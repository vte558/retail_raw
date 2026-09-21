with product_sales_cte as (

    select
        order_item_id,
        order_id,
        product_id,
        quantity,
        unit_price,
        line_amount
    from {{ ref('int_product_sales') }}

),

orders_cte as (

    select
        order_id,
        customer_id,
        store_id,
        order_date,
        order_status
    from {{ ref('stg_orders') }}

)

select
    ps.order_item_id,
    ps.order_id,
    ps.product_id,

    o.customer_id,
    o.store_id,
    o.order_date,
    o.order_status,

    ps.quantity,
    ps.unit_price,
    ps.line_amount

from product_sales_cte as ps

left join orders_cte as o
    on ps.order_id = o.order_id