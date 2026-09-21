{% snapshot customers_check_snapshot %}

{{
    config(
        target_schema='retail_snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=[
            'customer_name',
            'email',
            'phone',
            'city',
            'state',
            'country'
        ]
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

{% endsnapshot %}