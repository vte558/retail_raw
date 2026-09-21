select * from 

{{ref('stg_payments')}}

SELECT
    column_name,
    data_type
FROM `vctbatch-9916-500703.retail_raw.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'payments'
ORDER BY ordinal_position

SELECT *
FROM `vctbatch-9916-500703.retail_raw.payments`
LIMIT 10

select 
    payment_status,
    count(*) as payment_count_by_status
from {{ref("stg_payments")}}
group by payment_status
order by payment_status


select
    payment_method,
    count(*) as payment_count
from {{ ref('stg_payments') }}
group by payment_method
order by payment_method

select
    order_id,
    count(*) as payment_count
from {{ ref('stg_payments') }}
group by order_id having payment_count >1


select
    order_id,

    
    count(*)   paymnet_count,
    sum(
        case 
            when lower(payment_status) = 'paid'
            then payment_amount
            else 0
        end
    ) as successful_payment_amount
    ,
    sum(

        case 
            when lower(payment_method) = 'failed'
            then payment_amount
            else 0
        end
    ) as failed_paymnet_amount,
    sum(payment_amount) as total_amount
    
from {{ref('stg_payments')}}

group by order_id