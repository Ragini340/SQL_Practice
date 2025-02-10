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

SELECT Max(Salary) From Employee_Details;
SELECT Max(Salary) From Employee_Details Where Salary != (SELECT Max(Salary) From Employee_Details);
SELECT Min(Salary) From Employee_Details Where Salary IN (SELECT Distinct Salary From Employee_Details Order By Salary desc Limit 3 );

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
SELECT Column Department, Count(*) From Employee_Details Group By Department;

-- https://www.google.com/search?q=order+for+writting+query&rlz=1C1CHZN_enIN1045IN1045&oq=order+for+writting+query&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgWGB4yDQgCEAAYhgMYgAQYigUyDQgDEAAYhgMYgAQYigUyDQgEEAAYhgMYgAQYigUyDQgFEAAYhgMYgAQYigUyCggGEAAYgAQYogTSAQkxNTA2OGowajeoAgCwAgA&sourceid=chrome&ie=UTF-8