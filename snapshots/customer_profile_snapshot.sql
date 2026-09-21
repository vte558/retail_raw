{{% snapshot customer_profile_snapshot %}}

{{
    config(
        materialized='table'
        target_schema='retail_snapshots',
        strategy='check'
        check_cols=[
            'customer_name',
            'emial',
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
    city,
    state,
    country
    from {{ ref('stag_customers')}}

{{% endsnapshot %}}