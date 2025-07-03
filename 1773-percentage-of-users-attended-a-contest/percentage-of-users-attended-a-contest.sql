# Write your MySQL query statement below
 select rg.contest_id , round((count(rg.user_id)/(us.cnt))*100,2) as percentage  
 from (select count(user_id) as cnt  from Users) as us , Register as rg group by contest_id  order by percentage desc, contest_id asc