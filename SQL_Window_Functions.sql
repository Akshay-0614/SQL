use akshay;

-- Display the employee name, salary, and the salary of the next employee when employees are ordered by salary from highest to lowest.
select ename,sal,lead(sal) over(order by sal desc) as res from emp;


--  Display the employee name, salary, and the salary of the previous employee when employees are ordered by salary from highest to lowest.
select ename,sal,lag(sal) over (order by sal desc) as res1 from emp;


-- Divide all employees into 4 groups based on salary, from highest salary to lowest salary, and display the employee name, salary, and group number.
select ename,sal,ntile(4) over (order by sal desc) as grp_num from emp;


-- Display the employee name, department number, salary, previous employee's salary, and next employee's salary using LAG() and LEAD(), grouped by department.
select ename as Emp_Name,deptno as Emp_dept,sal as Emp_sal,lead(sal) over (partition by deptno ORDER BY hiredate ASC) as lead1,lag(sal) over (partition by deptno ORDER BY hiredate ASC) as lag1,sal-lead(sal) over (partition by deptno ORDER BY hiredate ASC) as Lead_Diff,sal-lag(sal) over(partition by deptno ORDER BY hiredate ASC) as Lag_diff from emp;


-- Display the employee name, current salary, next salary, and the difference between the current salary and next salary, ordered by salary from highest to lowest
select ename as Emp_Name,sal as Emp_sal,lead(sal) over (order by sal desc) as Next_sal,sal-lead(sal) over (order by sal desc) as Sal_diff  from emp;


-- Find employees whose current salary is greater than the next employee's salary when employees are ordered by salary from highest to lowest.
select Emp_Name,Emp_sal,Next_sal from ( select ename as Emp_Name ,sal as Emp_sal, lead(sal) over(order by sal desc) as Next_sal from emp) as e
					where Emp_sal > Next_sal;


-- Divide employees into 4 salary groups and display employees belonging to the first salary group.
select * from (select * , ntile(4) over(ORDER BY sal DESC) as group_number from emp) as res where group_number = 1; 


-- Display employees whose salary is lower than the salary of the next employee in their department
select * from(select * , lead(sal) over (PARTITION BY deptno ORDER BY hiredate ASC) as Low_sal from emp ) as l_s where sal < Low_sal ;


-- Display the employees whose salary is greater than the previous employee's salary but less than the next employee's salary, based on hire date asc within the department.
select * from (select * ,lag(sal) over(partition by deptno order by hiredate asc) as Lag_sal,lead(sal) over(partition by deptno order by hiredate asc) as Lead_sal from emp) as res where sal > lag_sal and sal< lead_sal;


-- Display the employee name, department number, salary, previous employee's salary, and the difference between the current salary and previous salary, based on hire date ascending within each department.
select empno,ename,deptno,sal,Prev_sal,sal-Prev_sal as Sal_Diff from (select * ,Lag(sal) over (partition by deptno order by hiredate asc) as Prev_sal from emp) as result;