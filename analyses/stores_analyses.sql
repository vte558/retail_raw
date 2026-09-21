select * from 

{{source("retail_raw","stores")}}


SELECT
    column_name,
    data_type
FROM `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'stores'
ORDER BY ordinal_position



select 
    store_id,
    store_name,
    city,
    state,
     from 

{{source("retail_raw","stores")}}