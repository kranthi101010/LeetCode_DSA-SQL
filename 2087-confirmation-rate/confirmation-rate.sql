# Write your MySQL query statement below

with cte_join as (
select s.user_id,s.time_stamp,COALESCE(action,'timeout') as action_1 from Signups as s left join Confirmations as c on s.user_id = c.user_id
),
cte_conf as (
    select cj.user_id,count(user_id) as cnt_conf from cte_join as cj group by user_id
),
cte_timeout as (
    select cj.user_id, count(user_id) as cnt_timeout  from  cte_join as cj where cj.action_1='timeout' group by user_id
),
cte_final as
(
select cc.user_id,cc.cnt_conf as total , COALESCE(cnt_timeout,0) as timeout_cnt from cte_conf as cc left join cte_timeout as ct on cc.user_id=ct.user_id
)
select cf.user_id , round((cf.total-cf.timeout_cnt)/(cf.total),2) as confirmation_rate from cte_final AS cf 