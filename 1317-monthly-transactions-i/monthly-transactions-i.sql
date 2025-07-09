# Write your MySQL query statement below
with cte as(
select id,country,state,amount,date_format(trans_date,'%Y-%m') as date
from Transactions
)

select cte.date as month,cte.country,count(id) as trans_count,coalesce(count(if(cte.state='approved',1,null)),0) as approved_count,
sum(amount) as trans_total_amount,coalesce(sum(if(cte.state='approved',amount,Null)),0) as approved_total_amount from cte group by date, country 