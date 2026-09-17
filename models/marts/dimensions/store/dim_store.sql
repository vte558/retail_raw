with store_cte as (
    select 
        * 
    from {{ref('stg_stores')}}

)

select 
    store_id,
    store_name,
    city,
    state
from store_cte