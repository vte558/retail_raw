{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='merge'
    )
}}

with orders_cte as (

    select
        order_id,
        customer_id,
        store_id,
        order_date,
        order_status,
        updated_at
    from {{ ref('stg_orders') }}

),
etl_watermark_cte as(
    select max(last_processed_value)
    from `vctbatch-9916-500703.retail_control.etl_watermark`
    where  pipeline_name = 'orders_load'
      and status = 'SUCCESS'
)

select
    order_id,
    customer_id,
    store_id,
    order_date,
    order_status,
    updated_at

from orders_cte
cross join etl_watermark_cte
{% if is_incremental() %}

where updated_at > (
    select max(updated_at)
    from {{ this }}

)

{% endif %}


