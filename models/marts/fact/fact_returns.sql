with returns_cte as (
    select
        return_id,
        order_id,
        customer_id,
        
        return_reason,
        return_date,
        order_date,
        order_status,
        days_to_return
    from {{ ref('int_returns') }}
)

select
    return_id,
    order_id,
    customer_id,
    
    return_reason,
    return_date,
    order_date,
    order_status,
    days_to_return

from returns_cte

