# Write your MySQL query statement below
with cte as (
select p.product_id, units,(price*units) as t_price from Prices as p left join UnitsSold as us on p.product_id=us.product_id and us.purchase_date between p.start_date and p.end_date 
)
select cte.product_id , coalesce(round((sum(t_price)/sum(units)),2),0) as average_price from cte group by cte.product_id