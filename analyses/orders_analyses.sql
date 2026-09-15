select * from 
{{source("retail_raw","orders")}}

select
    column_name,
    data_type
from `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'orders'
order by ordinal_position

select 
    order_status,
    count(*) as order_count,
from {{source("retail_raw","orders")}}
group by order_status
order by  order_count desc


select 
    count(*) as total_order_count,
    count(distinct(order_id)) as order_id_count
from {{source("retail_raw","orders")}}


select count(*) as row_count
from {{ source("retail_raw", "orders") }}

select *  
from {{ source("retail_raw","orders") }} 

where customer_id=101