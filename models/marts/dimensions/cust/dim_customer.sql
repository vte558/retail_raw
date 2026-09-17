{{
    config(
        materialized='incremental',
        unique_key='customer_id',
        incremental_strategy='merge'
    )
}}

select
    customer_id,
    customer_name,
    email,
    phone,
    city,
    state,
    country,
    created_at,
    updated_at

from {{ ref('stg_customers') }}

{% if is_incremental() %}

where updated_at > (
    select max(updated_at)
    from {{ this }}
)

{% endif %}