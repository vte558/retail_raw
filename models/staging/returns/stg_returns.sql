select
    return_id,
    order_id,
    trim(return_reason) as return_reason,
    return_date
from {{ source("retail_raw", "returns") }}