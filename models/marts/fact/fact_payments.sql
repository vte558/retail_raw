with payments_cte as (

    select
        payment_id,
        order_id,
        payment_method,
        payment_amount,
        payment_status
    from {{ ref('stg_payments') }}

),

orders_cte as (

    select
        order_id,
        customer_id,
        store_id,
        order_date
    from {{ ref('stg_orders') }}

)

select
    p.payment_id,
    p.order_id,
    o.customer_id,
    o.store_id,
    o.order_date,
    p.payment_method,
    p.payment_status,
    p.payment_amount

from payments_cte as p

left join orders_cte as o
    on p.order_id = o.order_id