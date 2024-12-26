CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE nth_salary INT;
    SET N = N - 1;
    SELECT DISTINCT salary
    INTO nth_salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT N, 1;

    RETURN nth_salary;
END;
