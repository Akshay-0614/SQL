-- Write a CTE named AccountingEmployees to select all employees from Accounting department.
-- Using the same CTE, update the salary of all Accounting employees by adding 5000.
with AccountingEmployees as (

select empno from emp where deptno in (select deptno from dept where dname= 'Accounting')

)
update emp set sal = sal + 5000 where empno in (select empno from AccountingEmployees) ;
select * from emp where deptno in (select deptno from dept where dname='Accounting');

-- Write a CTE named Department20Employees to select employees working in department 20. Using the CTE, increase their salaries by 10%.
with D_20_emp as (

select empno from emp where deptno = 20

)
update emp set sal = sal +(sal *0.10) where empno in (select empno from D_20_emp) ;
select * from emp where deptno = 20;

-- Write a CTE named Department30Employees to select employees in department 30. Decrease their salaries by 500.

with D_30_emp as(

select empno from emp where deptno =30 

)
update emp set sal = sal - 500 where empno in (select * from D_30_emp);
select * from emp where deptno = 30;

-- Write a CTE named ManagerEmployees to select all employees whose job is MANAGER. Increase their salaries by 2000.
with ManagerEmployees as (

select empno from emp where job = 'Manager'

)
update emp set sal = sal + 2000 where empno in (select empno from ManagerEmployees);
select * from emp where job ='Manager';

-- Write a CTE named LowSalaryEmployees to select employees whose salary is less than 2000. Increase their salaries by 1000.
with LowSalaryEmployees as (

select empno from emp where sal < 2000

)
update emp set sal = sal + 1000 where empno in (select empno from LowSalaryEmployees);
select * from emp where sal >= 1000;