with orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

)

select 
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(order_id) as number_of_orders
from orders
group by customer_id