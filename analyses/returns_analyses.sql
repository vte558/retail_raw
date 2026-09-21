select * from 

{{source("retail_raw","returns")}}

SELECT
    column_name,
    data_type
FROM `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'returns'
ORDER BY ordinal_position


select * from 

{{ref("stg_returns")}}

with returnd_cte as(
select
    return_id,
    order_id,
    return_reason,
    return_date
from {{ref("stg_returns")}}
),
orders_cte as(
select 
    order_id,
    customer_id,
    store_id,
    order_date,
    order_status
from {{ref('stg_orders')}}
)

select 
    r.return_id,
    r.return_date,
    r.return_reason,
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    date_diff(r.return_date,o.order_date,day) as days_to_return
from returnd_cte as r
left join orders_cte as o
on o.order_id=r.order_id
