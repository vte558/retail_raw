select
    store_id,
    {{ clean_string('store_name')}} as store_name,
    {{ clean_string('city')}} as city,
    {{ clean_string('state')}} as state,
    {% if target.name=='default' %}
            'Dev' as environment
    {% else %}
            'PROD' as environment
    {% endif %}

from {{ source("retail_raw", "stores") }}