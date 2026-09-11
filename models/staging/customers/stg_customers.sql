select 
    customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    concat(trim(first_name),' ',trim(last_name)) as customer_name,
    lower(trim(email)) as email,
    trim(cast(phone as string)) as phone,
    upper(trim(city)) as city,
    upper(trim(state)) as state,
    country,
    cast(created_at as timestamp) as created_at,
    cast(updated_at as timestamp) as updated_at
from {{source("retail_raw","customers")}}
