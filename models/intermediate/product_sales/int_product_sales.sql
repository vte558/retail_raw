with order_item_cte as (
select 
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
from {{ref("stg_order_items")}}
),

product_cte as(
select 
    product_id,
    product_name,
    category,
    brand 
from {{ref("stg_products")}}

) 

select 
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    p.product_name,
    p.category,
    p.brand,
    oi.quantity,
    oi.unit_price,
    oi.quantity*oi.unit_price as line_amount

from order_item_cte as oi
left join product_cte as p
    on oi.product_id=p.product_id