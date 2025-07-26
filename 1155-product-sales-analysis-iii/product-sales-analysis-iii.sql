# Write your MySQL query statement below
with cte as(
   select product_id,min(year) as first_year from Sales group by product_id 
)

select Sales.product_id, Sales.year as first_year, quantity, price 
from Sales join cte on Sales.product_id=cte.product_id
where cte.first_year=Sales.year 