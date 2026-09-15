select * from 

{{source("retail_raw","payments")}}

SELECT
    column_name,
    data_type
FROM `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'payments'
ORDER BY ordinal_position

SELECT *
FROM `vctbatch-9916-500703.retail_raw.payments`
LIMIT 10