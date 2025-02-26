WITH AvgSalaryByDept AS (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
)
SELECT * FROM AvgSalaryByDept;

--SELECT * FROM Department
--SELECT * FROM Employees

/*Key Terms:-
WITH: The WITH clause defines a CTE named AvgSalaryByDept.
AvgSalaryByDept: A unique name for the CTE expression.
SELECT: The main query that can reference the CTE by its name.
The main query references this CTE to retrieve the average salary for each department.*/

/*Syntax:-
WITH cte_name AS (
    SELECT query
)
SELECT *
FROM cte_name;

Key Terms:-
cte_name: A unique name for the CTE expression.
query: A valid SQL query that returns a result set, which will be treated as a virtual table within the main query.
SELECT: The main query that can reference the CTE by its name.*/