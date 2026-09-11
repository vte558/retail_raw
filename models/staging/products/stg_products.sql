select 
    product_id ,
    trim(product_name) as product_name,
    trim(category) as category,
    trim(brand) as brand,
    cast(unit_price as numeric) as unit_price,
from {{source("retail_raw","products")}}