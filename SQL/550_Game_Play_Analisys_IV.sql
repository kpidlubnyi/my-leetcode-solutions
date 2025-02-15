with cte as (
    SELECT player_id,
        CASE event_date - first_login
            WHEN 1 THEN 1
            ELSE 0 END as good
    FROM Activity a
    JOIN (
        SELECT a.player_id, MIN(a.event_date) as first_login
        FROM Activity a
        GROUP BY player_id
        ) USING(player_id)
    )

SELECT ROUND(SUM(MAX(good)) / COUNT(*), 2) as fraction
FROM cte
GROUP BY player_id

-- A little bit of complex cte and an aggregation function in the query and nothing more.