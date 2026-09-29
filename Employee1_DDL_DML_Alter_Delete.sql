create table employee1(
emp_id INT,
emp_name varchar(30),
salary decimal(10,2),
dept_id int,
city varchar (30)
);

Insert Into employee1(emp_id,emp_name,salary,dept_id,city) values 
(101,'Ravi',25000,10,'Hyderabad'),
(102,'Anil',35000,20,'Chennai'),
(103,'Priya',45000,30,'Hyderabad'),
(104,'Suresh',55000,10,'Bangalore'),
(105,'Arun',20000,20,'Hyderabad'),
(106,'Sneha',80000,30,'Chennai'),
(107,'Kiran',90000,20,'Mumbai'),
(108,'Anusha',40000,10,'Hyderabd'),
(109,'Viay',30000,30,'Delhi'),
(110,'Amit',75000,20,'Bangalore'),
(111,'Rohit',15000,10,'Chennai'),
(112,'Pooja',50000,30,'Hyderabad');

select * from employee1 ; 
set sql_safe_Updates=0;
-- Write a query to delete employees whose salary is greater than 80,000.
Delete from employee1 where salary > 80000;

-- Write a query to add a column email with datatype VARCHAR(50).
Alter Table Employee1 add email varchar(50);

-- Write a query to remove the email column.
alter table employee1 drop email;

-- Write a query to rename the column emp_name to employee_name.
alter table employee1 Rename column Emp_name to employee_name;

-- Write a query to change the datatype of employee_name to VARCHAR(50).
Alter table employee1 modify employee_name varchar(50);

-- Write a query to remove all employees whose salary is between 30,000 and 50,000.
 delete from employee1 where  salary between 30000 and 50000;

-- Write a query to delete employees whose dept_id is either 10 or 30.
delete from employee1 where dept_id in (10,30);


select * from employee1;
