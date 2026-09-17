

select
    order_id,
    count(*)   payment_count,
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
            when lower(payment_status) = 'failed'
            then payment_amount
            else 0
        end
    ) as failed_paymnet_amount,
    sum(payment_amount) as total_payment_amount
    
from {{ref('stg_payments')}}

group by order_id