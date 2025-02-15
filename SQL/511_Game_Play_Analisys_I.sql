SELECT player_id, TO_CHAR(MIN(event_date), 'yyyy-mm-dd') AS first_login
FROM Activity
GROUP BY player_id;

-- Some problems with date output in Oracle SQL, but solved by simple formatting!