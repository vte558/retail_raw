select 
    payment_id,
    order_id,
    lower(trim(payment_method)) as payment_method,
    cast(payment_amount as numeric) as payment_amount,
    lower(trim(payment_status)) as payment_status
from {{source("retail_raw","payments")}}