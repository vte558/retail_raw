with retail_raw_orders_cte as(
    select count(*) as raw_orders_count
    from {{source("retail_raw","orders")}}
),
 retail_silver_orders_cte as(
    select count(*) as silver_orders_count
    from {{ref("stg_orders")}}
)
select 
    ro.raw_orders_count,
    so.silver_orders_count
    from retail_raw_orders_cte ro
    cross join retail_silver_orders_cte so
    where ro.raw_orders_count!=silver_orders_count
