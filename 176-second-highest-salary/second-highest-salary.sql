-- Write your PostgreSQL query statement below
with cte as(
select id, salary, dense_rank() over(order by salary desc) as rank1 from Employee)

select 
max(case 
    when cte.rank1=2 then salary
    else  null end ) as "SecondHighestSalary"
  from cte 