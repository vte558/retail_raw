select
    * 
from {{ref("stg_order_items")}}

where quantity<=0 or unit_price <=0