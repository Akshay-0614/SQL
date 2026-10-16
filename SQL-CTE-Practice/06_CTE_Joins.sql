USE akshay;

-- Q1: Display employee details along with their manager names
-- using a CTE and SELF JOIN.

WITH EmployeeDetails AS
(
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.sal,
        m.ename AS Manager_Name
    FROM emp e
    LEFT JOIN emp m
        ON e.mgr = m.empno
)
SELECT *
FROM EmployeeDetails;


-- Q2: Display employees whose department details are available
-- using a CTE and INNER JOIN.

WITH EmployeeDepartment AS
(
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.sal,
        e.deptno,
        d.dname,
        d.loc
    FROM emp e
    INNER JOIN dept d
        ON e.deptno = d.deptno
)
SELECT *
FROM EmployeeDepartment;


-- Q3: Display employees working in the SALES department
-- using a CTE and INNER JOIN.

WITH SalesEmployees AS
(
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.sal,
        d.dname
    FROM emp e
    INNER JOIN dept d
        ON e.deptno = d.deptno
)
SELECT *
FROM SalesEmployees
WHERE dname = 'SALES';


-- Q4: Display the total salary paid in each department
-- using a CTE and INNER JOIN.

WITH DepartmentSalary AS
(
    SELECT
        d.deptno,
        d.dname,
        SUM(e.sal) AS Total_Salary
    FROM dept d
    INNER JOIN emp e
        ON d.deptno = e.deptno
    GROUP BY d.deptno, d.dname
)
SELECT *
FROM DepartmentSalary;


-- Q5: Display employees earning more than 2000
-- along with their department names using a CTE.

WITH HighSalaryEmployees AS
(
    SELECT
        e.empno,
        e.ename,
        e.sal,
        d.dname
    FROM emp e
    INNER JOIN dept d
        ON e.deptno = d.deptno
)
SELECT *
FROM HighSalaryEmployees
WHERE sal > 2000;