with orders_cte as (

    select 
        order_id,
        customer_id,
        store_id,
        order_date,
        order_status
    from {{ref("stg_orders")}}
),
 customers_cte as (
select
        customer_id,
        customer_name,
        email,
        phone,
        city,
        state,
        country
 from {{ref("stg_customers")}}   

)

select 
    o.order_id,
    c.customer_id,

    c.customer_name,
    c.phone,
    c.email,
    c.city,
    c.state,
    c.country,

    o.store_id,
    o.order_date,
    o.order_status

from orders_cte as o

left join customers_cte as c
    on  o.customer_id=c.customer_id