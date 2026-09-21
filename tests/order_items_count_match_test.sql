with stg_order_items_count_cte as (

    select 
    count(*) as stg_order_items_count
    from {{source("retail_raw","order_items")}}
),

with silver_order_items_count_cte(
    select
    count(*) as silver_order_items_count
)

select 

from stg_order_items_count_cte as stg_oi
cross join silver_order_items_count_cte as sil_oi
where stg_oi.stg_order_items_count != sil_oi.silver_order_items_count