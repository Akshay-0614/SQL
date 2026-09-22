use akshay;

-- Create a view named Employee_View that displays all columns from the Employee table.
create view Emp_view as select * from emp;
select * from Emp_view;

-- Create a view named Employee_Details that displays only Emp_Id, Emp_Name, and Salary.
create view Emp_details as select empno,ename,sal from emp;
select * from Emp_details;

-- Create a view named High_Salary that displays employees whose salary is greater than 3000.
create view High_sal as select * from emp where sal > 3000;
select * from High_sal;

-- Create a view named Low_Salary that displays employees whose salary is Lower than 2000
create view Low_sal as select * from emp where sal < 2000;
select * from Low_sal;

-- Create a view to display employee name and salary.
create view empsal as select ename,sal from emp;
select * from empsal;

-- Create a view to display the number of employees in each department.
create  view empcount as select deptno, count(*) from emp  group by deptno ;
select * from empcount;

-- Using the Empsal view, display employees whose salary is greater than 2000.
select * from Empsal where sal > 2000;

-- Create a view named Emp_job that displays Emp_Name and job.
create view Emp_job as select empno , ename, job from emp; 
select * from Emp_job;

-- Create a view that displays employees working in department 10.
create view emp10 as select * from emp where deptno = 10;
select * from emp10;

-- Create a view to display employees working in NEW YORK.
create view newyork as select * from emp where deptno = (select deptno from dept where loc = 'NEW YORK');
select * from newyork;



