select * from 

{{source("retail_raw","returns")}}

SELECT
    column_name,
    data_type
FROM `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'returns'
ORDER BY ordinal_position