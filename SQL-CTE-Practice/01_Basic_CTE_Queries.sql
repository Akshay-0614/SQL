-- CTE Functions

-- Create a CTE to display employee ID and employee name from the emp table.
with emp_details as (
	select empno as Employee_id ,ename as Employee_name from emp
    )
    select * from emp_details;
    

-- Using CTE Find the Second Highest Salary from emp table 
with high_sal as (
select sal as Salary, dense_rank() over (order by sal desc) as rank1 from emp 
)
select distinct salary as second_high_sal from high_sal where rank1=2;


-- Create a CTE to display all employees from the emp table.
with emps as (
select * from emp
)
select * from emps;


-- Create a CTE to display employees whose salary is greater than 2000.
with sal1 as (
select sal as Salary from emp where sal > 2000
)
select salary as greater_sal from sal1;


-- Create a CTE to display employees working in department 20.
with d_emp as(
select * from emp where deptno = 20
)
select * from d_emp;
