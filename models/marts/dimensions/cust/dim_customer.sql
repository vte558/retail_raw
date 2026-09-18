select
    to_hex(
        sha256(
            concat(
                cast(customer_id as string),
                '|',
                cast(dbt_valid_from as string)
            )
        )
    ) as customer_sk,

    customer_id,
    customer_name,
    email,
    phone,
    city,
    state,
    country,
    created_at,
    updated_at,

    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,

    case
        when dbt_valid_to is null then true
        else false
    end as is_current

from {{ ref('customers_snapshot') }}

