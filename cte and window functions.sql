
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

#-------------------------------------------------------------

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

#--------------------------------------------------------

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
select customer_name, total_rev, row_number() over(
		order by total_rev desc
		) as row_num
from total_revenue;

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
select customer_name, total_rev, dense_rank() over(
		order by total_rev desc
		) as row_num
from total_revenue;

#---------------------------------------------------------------

with customer_orders as (
select c.customer_id, customer_name, order_id, order_date
from customers as c
join orders as o on c.customer_id = o.customer_id
),
ranked_orders as (
select customer_name, order_id, order_date, row_number() over(
		  partition by customer_id
          order by order_date desc
) as rn
from customer_orders
)
select * 
from ranked_orders
where rn = 1;


#---------------------------------------------------------------

with order_revenue as (
	select date_format(order_date, '%Y-%m') as orderdate, (oi.quantity * p.price) as revenue
	from orders as o
	join order_items as oi on o.order_id  = oi.order_id
	join products as p on oi.product_id = p.product_id
),
month_revenue as (
select orderdate, sum(revenue)
from order_revenue
group by orderdate
order by orderdate asc
)
select *
from month_revenue;








