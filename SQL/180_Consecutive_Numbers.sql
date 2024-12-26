SELECT DISTINCT num as "ConsecutiveNums"
FROM
    (SELECT
        num,
        LAG(num) OVER (ORDER BY id) as prev_num,
        LAG(num, 2) OVER (ORDER BY id) as prev_2x_num
    FROM Logs) tablee
WHERE num = prev_num AND num = prev_2x_num

