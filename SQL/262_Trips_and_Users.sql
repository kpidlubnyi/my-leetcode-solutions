WITH cte AS (
    SELECT *
    FROM Trips t
    LEFT JOIN Users u1 ON t.client_id = u1.users_id
    LEFT JOIN Users u2 ON t.driver_id = u2.users_id
    WHERE u1.banned = 'No' AND u2.banned = 'No'
)

SELECT 
    request_at AS "Day", 
    ROUND(COALESCE(cancelled, 0) / total, 2) AS "Cancellation Rate"
FROM (
    SELECT *
    FROM (
        SELECT request_at, COUNT(*) as total
        FROM cte
        GROUP BY request_at
    ) t1
    LEFT JOIN (
        SELECT request_at, COUNT(*) as cancelled
        FROM cte
        WHERE cte.status LIKE 'ca%' 
        GROUP BY request_at
    ) t2 
    USING(request_at)
    ORDER BY request_at
) r
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'

-- 