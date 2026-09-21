select
    store_id,
    {{ clean_string('store_name')}} as store_name,
    {{ clean_string('city')}} as city,
   {{ clean_string('state')}} as state
from {{ source("retail_raw", "stores") }}