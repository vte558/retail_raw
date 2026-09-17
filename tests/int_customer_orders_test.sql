select 
    count(*) total_records,
   count(distinct(order_id)) as distinct_order_is_count
   from {{ref("int_customer_orders")}}
