with cte as (
    SELECT w1.*, w1.recordDate - INTERVAL '1' DAY AS yesterday
    FROM Weather w1
)

SELECT c.id
FROM cte c
JOIN Weather w ON c.yesterday = w.recordDate
WHERE c.temperature > w.temperature

-- Use cte to write “yesterday's” data and take only those where the “today's” temperature is higher.