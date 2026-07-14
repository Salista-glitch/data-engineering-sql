
select * from order_items;

with customer_revenue as (
select customer_name, (oi.quantity * p.price) as revenue
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id  = oi.order_id
join products as p on oi.product_id = p.product_id
),
total_revenue as (
select customer_name, sum(revenue) as total_rev
from customer_revenue
group by customer_name
),
rich_customers as (
select * from total_revenue
where total_rev > 10000
)
select *
from rich_customers;

#########

with customer_revenue as (
select customer_name, (oi.quantity * p.price) as revenue
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id  = oi.order_id
join products as p on oi.product_id = p.product_id
),
total_revenue as (
select customer_name, sum(revenue) as total_rev
from customer_revenue
group by customer_name
)
select customer_name, total_rev, rank() over(
order by total_rev desc
) as revenue_rank
from total_revenue;


