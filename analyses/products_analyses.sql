select * from 

{{source("retail_raw","products")}}


select max(order_id) 
from {{ref('stg_orders')}}
2026-09-15T15:09:24.769506+00:00

select * 
from {{ref('fact_orders_incremental')}} where order_id=1
order by order_id desc 


2026-09-15T14:42:59.700994+00:00