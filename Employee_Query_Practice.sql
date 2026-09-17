use akshay;

-- Find the names of employees who earn more than the salary of their manager.
select e.ename as Emp_Name , e.sal as Emp_sal , m.mgr as Mgr_ID  , m.sal as Mgr_Sal from emp as e join emp as m on e.mgr=m.empno where e.sal > m.sal;

-- Find managers who manage more than one employee.
select e.mgr , Count(*) as Employee_count from emp as e group by mgr having count(*) > 1;

-- Display employee name and their manager name.
select e.ename as Employee_Name ,m.ename as Manager_Name from emp as e join emp as m on e.mgr=m.empno;

-- Find employees who are the only employee with their particular job in their department.
select * from emp where (deptno,job)in (select deptno,job from emp group by deptno,job having count(*) =1);

-- Find the names of employees who work in the SALES department and have a salary greater than 1200.
SELECT e.ename FROM emp AS e JOIN dept AS d ON e.deptno = d.deptno WHERE d.dname = 'SALES' AND e.sal > 1200;