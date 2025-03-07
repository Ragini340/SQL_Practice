Create Table Employee_Details
(
Id int,
Name varchar(20),
Department varchar(20),
Salary int
);
--alter Table Employee_Detail add Address varchar(20);
--alter Table Employee_Detail drop Column Address;
Insert Into Employee_Details Values (1, 'Varun', 'IT', 1000);
Insert Into Employee_Details Values (2, 'Arun', 'Management', 7000);
Insert Into Employee_Details Values (3, 'Karuna', 'HR', 11000);
Insert Into Employee_Details Values (4, 'Amrit', 'Dev', 10000);
Insert Into Employee_Details Values (5, 'Ranjeet', 'Support', 12000);
Insert Into Employee_Details Values (6, 'Ajeet', 'L&D', Null);

SELECT Max(Salary) From Employee_Details;  --Highest salary 
SELECT Max(Salary) From Employee_Details Where Salary != (SELECT Max(Salary) From Employee_Details); --2nd highest salary
--3rd highest salary
SELECT Min(Salary) From Employee_Details Where Salary IN (SELECT Distinct Salary From Employee_Details Order By Salary desc Limit 3);

SELECT COUNT(*) From Employee_Details;
SELECT COUNT(Salary) From Employee_Details;
SELECT Distinct (COUNT(Salary)) From Employee_Details;
SELECT * From Employee_Details;
SELECT Sum(Salary) From Employee_Details;
SELECT Distinct (Sum(Salary)) From Employee_Details;
SELECT Avg(Salary) From Employee_Details;
SELECT Distinct (Avg(Salary)) From Employee_Details;
SELECT LOWER(Name) From Employee_Details;

--Find employee details whose name starting with 'A'
SELECT * FROM Employee_Details Where Name Like 'A%';
--Find employee details whose name ending with 'n'
SELECT * FROM Employee_Details Where Name Like '%n';
--Find employee details whose name contains 'ee'
SELECT * FROM Employee_Details Where Name Like '%ee';
--Find employee details whose name contains 'a' in second place
SELECT * FROM Employee_Details Where Name Like '_a%';
--Find employee details whose name contains 'a' in second place and name should contain total 5 characters
SELECT * FROM Employee_Details Where Name Like '_a___';

SELECT LOWER(Name) FROM Employee_Details;
SELECT Upper(Name) FROM Employee_Details;
SELECT Concat(Id,Name) FROM Employee_Details;
SELECT Substring(Name,2,5) FROM Employee_Details;
SELECT Trim('v' from Name) FROM Employee_Details;
SELECT Replace(Name, 'v', 't') FROM Employee_Details;

--Order of Execution
--From -> Join -> Where -> Group By -> Having -> Select -> Distinct -> Order By -> LIMIT

--Write a query to display all the department names along with number of employees working in that department
SELECT Department, Count(*) From Employee_Details Group By Department;
                              --Or
SELECT Department, Count(Department) From Employee_Details Group By Department;

-- https://www.google.com/search?q=order+for+writting+query&rlz=1C1CHZN_enIN1045IN1045&oq=order+for+writting+query&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgWGB4yDQgCEAAYhgMYgAQYigUyDQgDEAAYhgMYgAQYigUyDQgEEAAYhgMYgAQYigUyDQgFEAAYhgMYgAQYigUyCggGEAAYgAQYogTSAQkxNTA2OGowajeoAgCwAgA&sourceid=chrome&ie=UTF-8

--Write a query to display all the department names Where number of employees are less than 4
SELECT Department From Employee_Details Group By Department Having Count(*) < 4;

--Write a query to display all the names of employee where in department the number of employees are less than 4
SELECT Name From Employee_Details Where Department In (SELECT Department From Employee_Details Group By Department Having Count(*) < 4);

-- How to find duplicates without using count(*)
SELECT e1.Id, e1.Name, e1.Department, e1.Salary
FROM Employee_Details e1 JOIN Employee_Details e2 ON
e1.Id = e2.Id
AND e1.Name <> e2.Name;  -- <>	Not equal to

-- SQL databases offer an Auto Increment feature that automatically generates unique numerical values for a specified column.
CREATE TABLE Employees(
Id int IDENTITY(1,1) PRIMARY KEY,  --SQL Auto Increment
Name varchar(20),
Department varchar(20),
Salary int
);
Insert Into Employees Values ('Varun', 'HR', 10000);
Insert Into Employees Values ('Arun', 'Management', 20000);
Insert Into Employees Values ('Karuna', 'HR', 30000);
Insert Into Employees Values ('Amrit', 'Dev', 40000);
Insert Into Employees Values ('Ranjeet', 'Support', 50000);
Insert Into Employees Values ('Ajeet', 'L&D', 60000);
SELECT * FROM Employees;

--Write a query to display highest salary department wise and name of employee who is taking that salary
SELECT NAME FROM Employees Where Salary In (SELECT Max(Salary) From Employees Group By Department);

--The DROP command is a Data Definition Language (DDL) operation used to completely remove a table, its structure, and all 
--its data from the database. Once executed, the table is permanently deleted and cannot be recovered unless from a backup.
DROP table Employees;

--Union
CREATE TABLE Salesman(
Salesman_id int IDENTITY(5001 ,1) PRIMARY KEY,  --SQL Auto Increment
Name varchar(20),
City  varchar(20),
Commission int
);
Insert Into Salesman Values ('James Hoog', 'New York',  0.15);
Insert Into Salesman Values ('Nail Knite', 'Paris',  0.13);
Insert Into Salesman Values ('Pit Alex', 'London', 0.11);
Insert Into Salesman Values ('Mc Lyon', 'Paris', 0.14);
Insert Into Salesman Values ('Paul Adam', 'Rome', 0.13);
Insert Into Salesman Values ('Lauson Hen', 'San Jose', 0.12);

--1. From the following tables, write a SQL query to find all salespeople and customers located in the city of London.
CREATE TABLE  Customer(
Salesman_id int IDENTITY(5001 ,1) PRIMARY KEY,  --SQL Auto Increment
Name varchar(20),
City  varchar(20),
Commission int
);
Insert Into Salesman Values ('James Hoog', 'New York',  0.15);
Insert Into Salesman Values ('Nail Knite', 'Paris',  0.13);
Insert Into Salesman Values ('Pit Alex', 'London', 0.11);
Insert Into Salesman Values ('Mc Lyon', 'Paris', 0.14);
Insert Into Salesman Values ('Paul Adam', 'Rome', 0.13);
Insert Into Salesman Values ('Lauson Hen', 'San Jose', 0.12);

CREATE TABLE Customers(
Customer_id int,
Cust_name   varchar(20),
City  varchar(20),
Grade  int,
Salesman_id int IDENTITY(5001 ,1) 
);
Insert Into Customers Values (3002, 'Nick Rimando', 'New York',  100);
Insert Into Customers Values (3007, 'Brad Davis', 'New York',  200);
Insert Into Customers Values (3005, 'Graham Zusi', 'California', 200);
Insert Into Customers Values (3008, 'Julian Green', 'London', 300);
Insert Into Customers Values (3004, 'Fabian Johnson', 'Paris', 300);
Insert Into Customers Values (3009, 'Geoff Cameron', 'Berlin', 100);
Insert Into Customers Values (3003, 'Jozy Altidor', 'Moscow', 200);
Insert Into Customers Values (3001, 'Brad Guzan', 'London', 200);

SELECT salesman_id AS "ID", name, 'Salesman' FROM Salesman WHERE city='London' 
UNION (SELECT customer_id AS "ID", cust_name, 'Customer' FROM Customers WHERE city='London');

--2. From the above tables, write a SQL query to find distinct salespeople and their cities. Return salesperson ID and 
--city.
SELECT Salesman_id, city FROM Customers UNION (SELECT Salesman_id, city FROM Salesman);

--Difference between Joins, Nested Subquery and Correlated Subquery
--Nested Subquery:- Bottom up approach
--Correlated Subquery:- Top dowm approach
-- Joins:- Cross product + condition

--Find the details of all employees who works in any department
Create Table Emp
(
E_Id int IDENTITY(1,1) PRIMARY KEY,
Name varchar(20),
);
Insert Into Emp Values ('A');
Insert Into Emp Values ('B');
Insert Into Emp Values ('C');
Insert Into Emp Values ('D');
Insert Into Emp Values ('E');

Create Table Department
(
Dept_No varchar(20),
Name varchar(20),
E_Id int IDENTITY(1,1) PRIMARY KEY,
);
Insert Into Department Values ('D1', 'IT');
Insert Into Department Values ('D2', 'HR');
Insert Into Department Values ('D3', 'MRKT');

SELECT * FROM Emp Where E_Id in(SELECT E_Id From Department); --Nested Subquery
SELECT * FROM Emp Where Exists (SELECT E_Id From Department Where Emp.E_Id = Department.E_Id); --Correlated Subquery
SELECT * From Emp, Department Where Emp.E_Id =  Department.E_Id; -- Joins

--Find Nth(1st,2nd,3rd....N) Highest Salary in SQL
Create Table Emp1
(
Id int IDENTITY(1,1) PRIMARY KEY,
Salary int
);
Insert Into Emp1 Values (10000);
Insert Into Emp1 Values (20000);
Insert Into Emp1 Values (20000);
Insert Into Emp1 Values (30000);
Insert Into Emp1 Values (40000);
Insert Into Emp1 Values (50000);

--SELECT Id, Salary From Emp1 e1 Where N-1 = (SELECT Count(Distinct Salary) From Emp1 e2 Where e2.Salary > e1.Salary);
                  --Max Salary
SELECT Max(Salary) From Emp1; --1st highest salary
SELECT Max(Salary) From Emp1 Where Salary != (SELECT Max(Salary) From Emp1); --2nd highest salary
--SELECT Min(Salary) From Emp1 Where Salary IN (SELECT Distinct Salary From Emp1 Order By Salary desc Limit 3) ; 
SELECT Id, Salary From Emp1 e1 Where 2 = (SELECT Count(Distinct Salary) From Emp1 e2 Where e2.Salary > e1.Salary); --3rd highest salary
SELECT Id, Salary From Emp1 e1 Where 3 = (SELECT Count(Distinct Salary) From Emp1 e2 Where e2.Salary > e1.Salary); --4th highest salary

                   --Min Salary
SELECT Min(Salary) From Emp1; --1st lowest salary
SELECT Min(Salary) From Emp1 Where Salary != (SELECT Min(Salary) From Emp1); --2nd lowest salary
SELECT Id, Salary From Emp1 e1 Where 2 = (SELECT Count(Distinct Salary) From Emp1 e2 Where e2.Salary < e1.Salary); --3rd lowest salary
SELECT Id, Salary From Emp1 e1 Where 3 = (SELECT Count(Distinct Salary) From Emp1 e2 Where e2.Salary < e1.Salary); --4th lowest salary
/*
Outer Query (SELECT Id, Salary FROM Emp1 e1):
This selects the Id and Salary columns from the table Emp1, using an alias e1 to refer to each row.

Subquery (SELECT Count(Distinct Salary) FROM Emp1 e2 WHERE e2.Salary < e1.Salary):
For each row in the outer query (represented by e1), the subquery counts how many distinct salaries from Emp1 are less than the salary of the current row.
It does this by referencing e2, another alias for the same table. The e2.Salary values are compared to e1.Salary from the outer query row.
The Count(Distinct Salary) counts how many distinct salaries exist in Emp1 that are smaller than the current e1.Salary.

The condition in the outer query is 2 = (subquery). This means we are looking for rows where the count of distinct salaries less than the current row's salary is exactly 2.
*/

SELECT Id, Salary From Emp1 e1 Where 3 = (SELECT Count(Distinct Salary) From Emp1 e2 Where e2.Salary < e1.Salary); --4th lowest salary

/*Write a query that joins two tables A and B having common attribute ID and selects records(ID_NAME) that have matching ID values in
both tables.*/
SELECT Emp.E_Id, Emp.Name
FROM Emp
JOIN Department ON Emp.E_Id = Department.E_Id
/*
JOIN Department ON Emp.E_Id = Department.E_Id:
This performs an INNER JOIN between the Emp table and the Department table.
INNER JOIN: This means that only rows where there is a match between the E_Id column in Emp and the E_Id column in Department will be included in the result 
set.
If an employee does not have a matching E_Id in the Department table, that employee will not be included in the result.
ON Emp.E_Id = Department.E_Id: 
This specifies the condition for the join, where the E_Id in Emp must match the E_Id in Department. This condition links employees to the departments they 
belong to.
*/
--SELECT * FROM EMP;
--SELECT * FROM Department;