select * from 

{{source("retail_raw","order_items")}}


SELECT
    column_name,
    data_type
FROM `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'order_items'
ORDER BY ordinal_position

SELECT *
FROM `vctbatch-9916-500703.retail_raw.order_items`
LIMIT 10;