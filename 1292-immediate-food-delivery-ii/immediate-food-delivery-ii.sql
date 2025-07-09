# Write your MySQL query statement below
with cte as (
select customer_id, min(order_date) as order_date,min(customer_pref_delivery_date) as pref_date from Delivery group by customer_id
)
select round(100*count(if(order_date=pref_date,1,null))/count(customer_id),2) as immediate_percentage from cte 