CREATE DATABASE All_Projects;
use all_projects;
create table raw_customers (customer_id varchar int,
	name varchar(50),
	email varchar(100),
	signup_date date,
	country varchar(30));

create table raw_orders (order_id int,
	customer_id INT,
	order_date DATE,
	amount	float,
    status varchar(50));
    
    desc raw_orders;
    
select * from raw_customers;
select * from raw_orders;

with cleaned_order_data as(
	select * from raw_orders
    where status ='completed'),
customer_metrics as(
	select customer_id,
    count(order_id) as total_orders, 
	round(sum(amount),2)  as Total_spent,
    round(avg(amount),2) as Avg_Order_Value
    FROM Cleaned_order_data group by customer_id),
    customer_summary as (
		select c.customer_id,
        c.name,
        c.country,
        m.total_orders,
        m.total_spent,
        m.avg_order_value
        from raw_customers c 
        left join customer_metrics m 
        on c.customer_id =m.customer_id)
	select *, case
		when total_spent >=1000 then 'High Value'
        when Total_spent >=500 then 'Medium Value'
		else 'low value'
        end as Customer_Segment
	from customer_summary
    where total_spent is not null;





