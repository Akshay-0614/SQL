-- SQL practice using Department and Employee tables with constraints,
-- data manipulation, joins, and subqueries for salary-based analysis.

create table Department(
Dept_Id int primary key,
Dept_Name Varchar (50) unique not null
);
select * from department;

-- insert values into department table
insert into Department values (10,'IT');
insert into Department values (20,'HR');
insert into Department values (30,'Finance');
insert into Department values (40,'Marketing');

-- create Employee table.
create table Employee(
Emp_Id int primary key,
Emp_Name varchar (50) not null,
Email varchar(100) unique,
Salary DECIMAL (10,2),
city Varchar(50) default 'Hyderabad',
Dept_Id int,
Foreign key (Dept_Id) References Department(Dept_Id)
); 

-- insert values into employee table
INSERT INTO Employee
(Emp_Id, Emp_Name, Email, Salary, City, Dept_Id)
VALUES
(101, 'Akshay Kumar', 'akshay@gmail.com', 50000.00, 'Hyderabad', 10),
(102, 'Priya Sharma', 'priya@gmail.com', 32000.00, 'Warangal', 20),
(103, 'Arjun Reddy', 'arjun@gmail.com', 45000.00, 'Karimnagar', 10),
(104, 'Sneha Rao', 'sneha@gmail.com', 28000.00, 'Hyderabad', 30),
(105, 'Akhil Kumar', 'Kiran@gmail.com', 38000.00, 'Khammam', 40);

-- Update the email address of employee 105
UPDATE Employee SET Email = 'akhil@gmail.com' WHERE Emp_Id = 105;

-- Display all employee details from the Employee table.
select * from employee;

-- Display the details of employees whose salary is greater than ₹30,000.
select * from Employee where salary > 30000;

-- Display the complete details of employees whose salary is greater than the average salary from Employee table.
select * from Employee where salary > (select avg(salary) from Employee);

-- Display the complete details of employees whose salary is greater than the average salary of their own department.
 select * from Employee as e where salary > (select avg(salary)  from employee as e1 where e1.Dept_Id= e.Dept_Id);
 
-- Display the employees who have the second-highest salary in each department.
SELECT * FROM Employee AS e WHERE Salary = (SELECT MAX(Salary) FROM Employee AS e1 WHERE e1.Dept_Id = e.Dept_Id AND e1.Salary < (SELECT MAX(Salary) FROM Employee AS e2 WHERE e2.Dept_Id = e.Dept_Id));

-- Display the department name and the employee name of the employee who has the highest salary in each department.
select e.Emp_Name,d.Dept_Name,e.Salary from Employee as e inner join Department as d on e.Dept_Id=d.Dept_Id where salary =(select max(salary) from Employee as e1 where e1.Dept_Id=e.Dept_Id);
