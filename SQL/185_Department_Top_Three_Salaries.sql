WITH Top3Salaries AS (
    SELECT e.*, 
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rn
    FROM Employee e
)

SELECT 
    d.name as Department,
    t.name as Employee,
    t.salary as Salary
FROM Top3Salaries t
JOIN Department d on t.departmentId = d.id
WHERE rn < 4;

-- DENSE_RANK() turned out to be very suitable for solving this problem easily.
-- I hope I won't forget that something like this can be easily done in pandas :D