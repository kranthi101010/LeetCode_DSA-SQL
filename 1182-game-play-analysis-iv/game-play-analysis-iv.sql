WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
),

next_day_login AS (
    SELECT DISTINCT A.player_id
    FROM Activity A
    JOIN first_login F ON A.player_id = F.player_id
    WHERE A.event_date = DATE_ADD(F.first_date, INTERVAL 1 DAY)
)

SELECT ROUND(COUNT(DISTINCT N.player_id) / COUNT(DISTINCT F.player_id), 2) AS fraction
FROM first_login F
LEFT JOIN next_day_login N ON F.player_id = N.player_id;
