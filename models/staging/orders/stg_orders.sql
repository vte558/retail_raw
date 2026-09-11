select

    order_id,

    customer_id,

    store_id,

    order_date,

    lower(trim(order_status)) as order_status

from {{ source('retail_raw', 'orders') }}