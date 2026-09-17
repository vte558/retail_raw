select * from {{ref("stg_customers")}}

select
    stg_cust.customer_id,
    stg_cust.customer_name,
    stg_cust.email,
    stg_ord.order_id,
    stg_ord.store_id,
    stg_ord.order_date,
    stg_ord.order_status
from  {{ref("stg_orders")}} as stg_ord
left join {{ref("stg_customers")}} as stg_cust
    on  stg_ord.customer_id =stg_cust.customer_id


    select
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.email,
    o.store_id,
    o.order_date,
    o.order_status
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id




select
    min(customer_id) as min_customer_id,
    max(customer_id) as max_customer_id,
    count(distinct customer_id) as distinct_customer_ids
from {{ source("retail_raw", "orders") }}


select
    min(customer_id) as min_customer_id,
    max(customer_id) as max_customer_id,
    count(distinct customer_id) as distinct_customer_ids
from {{ source("retail_raw", "customers") }}

select
    count(*) as orphan_orders
from {{ source("retail_raw", "orders") }} o
left join {{ source("retail_raw", "customers") }} c
    on o.customer_id = c.customer_id
where c.customer_id is null


select
    count(*) as customer_count,
    count(distinct customer_id) as distinct_customer_count
from {{ source("retail_raw", "customers") }}


select
    customer_id,
    customer_name
from {{ source("retail_raw", "customers") }}
order by customer_id




select
    customer_id,
    count(*) as order_count
from {{ source("retail_raw", "orders") }}
group by customer_id
order by customer_id



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





with customers as (

    select
        customer_id,
        customer_name,
        email,
        phone,
        city,
        state,
        country,
        created_at,
        updated_at
    from {{ ref('stg_customers') }}

)

select
    customer_id,
    customer_name,
    email,
    phone,
    city,
    state,
    country,
    created_at,
    updated_at
from customers


select
     * 
    from {{ ref('int_product_sales') }}
