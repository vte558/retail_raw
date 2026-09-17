with orders_cte as(
    select
        order_id,
        customer_id,
        store_id,
        order_date,
        order_status
    from {{ref("stg_orders")}}
),
order_sales_cte as(
    select 
        order_id,
        sum(line_amount) as order_amount,
        sum(quantity) as total_quantity,
        count(distinct order_item_id) as total_items
    from {{ref("int_product_sales")}}
    group by order_id
)

select 
    o.order_id,
    o.customer_id,
    o.store_id,
    o.order_date,
    o.order_status,
    coalesce(os.order_amount, 0) as order_amount,
    coalesce(os.total_quantity, 0) as total_quantity,
    coalesce(os.total_items, 0) as total_items 
from orders_cte as o
    left join order_sales_cte os
    on o.order_id=os.order_id

