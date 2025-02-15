SELECT d.name as Department,
        e.name as Employee,
        e.salary as Salary
FROM Employee e, Department d
WHERE d.id = e.departmentId AND e.salary >= (SELECT MAX(salary) FROM Employee WHERE departmentId = d.id)


-- Using a subquery as an alternative to the created “salaries” dataframe in a Pandas solution