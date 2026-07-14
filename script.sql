
#Q1
select * from customers;

#Q2
select customer_name, city from customers;

#Q3
select customer_id, customer_name, city
from customers
where city="Johannesburg";

#Q4
select * from customers
order by signup_date desc;

#Q5
select * from customers
limit 3;

#Q6, Q7, Q8
select count(*) as num_customers from customers ;
select count(product_id) as num_products from products;
select count(order_id) as num_orders from orders;

#Q9
select * from products
order by price desc
limit 1;

#10
select avg(price) as avg_price
from products;

#11


select order_id, customer_name
from orders join customers
on orders.customer_id = customers.customer_id;

#12
select order_date, customer_name
from orders join customers
on orders.customer_id = customers.customer_id;

#13
select count(order_id) as num_orders, customer_name
from orders join customers
on orders.customer_id = customers.customer_id
group by customer_name;

#14
select *
from customers left join orders
on customers.customer_id = orders.customer_id
where order_id is null;

#15
select o.order_id,p.product_name, oi.quantity 
from orders as o
join order_items  as oi 
on o.order_id = oi.order_id
join products as p
on oi.product_id = p.product_id;

#16
select customer_name, product_name, quantity
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id= oi.order_id
join products as p on oi.product_id = p.product_id;

#Q17
select o.order_id, sum(quantity * price) as revenue
from orders as o
join order_items as oi on o.order_id = oi.order_id
join products as p on oi.product_id = p.product_id
group by o.order_id;

#Q18
select customer_name, sum(quantity * price) as total_revenue
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id = oi.order_id
join products as p on oi.product_id = p.product_id
group by customer_name;


select * from customers;
select * from orders;
select * from order_items;
select * from products;

#2.Find customers whose revenue is above average
select customer_name, sum(quantity * price) as revenue
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id = oi.order_id
join products as p on oi.product_id = oi.product_id
group by c.customer_name
having revenue > (
        select avg(quantity * price) as avg_revenue
		from orders as o
		join order_items as oi on o.order_id = oi.order_id
		join products as p on oi.product_id = oi.product_id
 );
 
 #Q19
  select customer_name, sum(quantity * price) as total_revenue
  from customers as c
  join orders as o on c.customer_id = o.customer_id
  join order_items as oi on o.order_id = oi.order_id
  join products as p on oi.product_id = oi.product_id
  group by customer_name
  having total_revenue > 10000;
  
#20
select *
from products as p
left join order_items as oi on p.product_id = oi.product_id
where order_id is null;

#	Q21
select customer_name, sum(quantity * price) as total_revenue
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_items as oi on o.order_id = oi.order_id
join products as p on oi.product_id = p.product_id
group by c.customer_name
order by total_revenue desc
limit 3;

#Q22- revenue contribution
select product_name, sum(quantity * price) as total_revenue
from order_items as oi
join products as p on oi.product_id = p.product_id
group by product_name;















