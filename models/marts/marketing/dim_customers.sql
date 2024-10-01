with customer_orders as (
    select * from {{ ref('customer_orders') }}
),
customers as (
    select * from {{ ref("stg_jaffle_shop__customers") }}
)

select 
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce (customer_orders.number_of_orders, 0) as number_of_orders,
    customer_orders.lifetime_value
from customer_orders
left join customers using (customer_id)