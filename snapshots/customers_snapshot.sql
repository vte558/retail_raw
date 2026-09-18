
{% snapshot customers_snapshot %}

{{
    config(
        target_schema='retail_gold',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}



select
    customer_id,
    first_name,
    last_name,
    customer_name,
    email,
    phone,
    city,
    state,
    country,
    created_at,
    updated_at
from {{ ref('stg_customers') }}

{% endsnapshot %}

