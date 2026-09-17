with order_daily_cte as(
select 
    order_date as sales_date,
    count(distinct(order_id)) as order_count
from {{ref('fact_orders')}}
group by order_date
),

item_daily_cte as(
    select 
        order_date as sales_date,
        count(distinct(order_item_id)) as item_count,
        sum(quantity) as quantity_sold,
        sum(line_amount) as gross_sales
    from {{ref('fact_order_items')}}
    group by order_date
),
return_daily_cte as(
    select 
    return_date as sales_date,
    count(distinct(return_id)) as return_count
    from {{ref('fact_returns')}}
    group by return_date

)

select
    coalesce(o.sales_date, i.sales_date, r.sales_date) as sales_date,

    coalesce(o.order_count, 0) as order_count,

    coalesce(i.item_count, 0) as item_count,

    coalesce(i.quantity_sold, 0) as quantity_sold,

    coalesce(i.gross_sales, 0) as gross_sales,

    coalesce(r.return_count, 0) as return_count

from order_daily_cte o

full outer join item_daily_cte i
    on o.sales_date = i.sales_date

full outer join return_daily_cte r
    on coalesce(o.sales_date, i.sales_date) = r.sales_date

