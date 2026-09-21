with customer_sales_cte as (
    select 
        customer_id ,
        count(order_id) as order_count,
        count(order_item_id) as item_count,
        sum(quantity) as quantity_purchased,
        sum(line_amount) as total_sale_amount
    from {{ref('fact_order_items')}}
    group by customer_id
)

select
    c.customer_id,
    c.customer_name,
    c.email,
    c.city,
    c.state,
    c.country,

    coalesce(s.order_count, 0) as order_count,
    coalesce(s.item_count, 0) as item_count,
    coalesce(s.quantity_purchased, 0) as quantity_purchased,
    coalesce(s.total_sale_amount, 0) as total_sale_amount,

    case
        when coalesce(s.order_count, 0) > 0
        then coalesce(s.total_sale_amount, 0) / s.order_count
        else 0
    end as average_order_value

from {{ ref('dim_customer') }} as c

left join customer_sales_cte as s
    on c.customer_id = s.customer_id