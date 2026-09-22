with product_sales_cte as (
    select
        product_id,
        count(distinct order_id) as order_count,
        count(distinct order_item_id) as item_count,
        sum(quantity) as quantity_sold,
        sum(line_amount) as total_sales,
        avg(unit_price) as average_unit_price
    from {{ ref('fact_order_items') }}
    group by product_id
)

select
    p.product_id,
    p.product_name,
    p.category,
    p.brand,
    p.unit_price,

    coalesce(s.order_count, 0) as order_count,
    coalesce(s.item_count, 0) as item_count,
    coalesce(s.quantity_sold, 0) as quantity_sold,
    coalesce(s.total_sales, 0) as total_sales,

    case
        when coalesce(s.quantity_sold, 0) > 0
        then coalesce(s.total_sales, 0) / s.quantity_sold
        else 0
    end as revenue_per_unit,

    coalesce(s.average_unit_price, 0) as average_unit_price

from {{ ref('dim_product') }} as p

left join product_sales_cte as s
    on p.product_id = s.product_id