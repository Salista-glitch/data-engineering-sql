
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
select * from customers;
select * from orders;
select * from order_items;
select * from products;

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

