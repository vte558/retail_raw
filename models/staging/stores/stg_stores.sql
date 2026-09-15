select
    store_id,
    trim(store_name) as store_name,
    upper(trim(city)) as city,
    upper(trim(state)) as state
from {{ source("retail_raw", "stores") }}