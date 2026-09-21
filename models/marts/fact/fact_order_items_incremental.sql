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

)

select 
    * 
from orders_cte
{% if is_incremental() %}
    where updated_at >(select max(updated_at) from {{this}}
) 

{% endif %}