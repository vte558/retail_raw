select 
    order_item_id,
    order_id,
    product_id,
    quantity,
    cast(unit_price as numeric) as unit_price
from {{source("retail_raw","order_items")}}