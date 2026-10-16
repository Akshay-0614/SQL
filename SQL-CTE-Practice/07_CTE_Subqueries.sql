USE akshay;

-- Q1: Find employees earning more than the average salary
-- using a CTE and subquery.

WITH AverageSalary AS
(
    SELECT AVG(sal) AS Avg_Salary
    FROM emp
)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > (SELECT Avg_Salary FROM AverageSalary);


-- Q2: Find the employee receiving the second-highest salary
-- using a CTE and a subquery.

WITH SalaryRank AS
(
    SELECT
        empno,
        ename,
        sal,
        DENSE_RANK() OVER (ORDER BY sal DESC) AS Salary_Rank
    FROM emp
)
SELECT empno, ename, sal
FROM SalaryRank
WHERE Salary_Rank = 2;


-- Q3: Find employees earning more than their department's
-- average salary.

WITH DepartmentAverage AS
(
    SELECT deptno, AVG(sal) AS Avg_Salary
    FROM emp
    GROUP BY deptno
)
SELECT empno, ename, sal, deptno
FROM emp e
WHERE sal >
(
    SELECT Avg_Salary
    FROM DepartmentAverage d
    WHERE d.deptno = e.deptno
);


-- Q4: Find employees working in departments where
-- at least one employee earns more than 3000.

WITH HighSalaryDepartments AS
(
    SELECT DISTINCT deptno
    FROM emp
    WHERE sal > 3000
)
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN
(
    SELECT deptno
    FROM HighSalaryDepartments
);


-- Q5: Find employees earning the maximum salary
-- using a CTE and subquery.

WITH MaximumSalary AS
(
    SELECT MAX(sal) AS Max_Salary
    FROM emp
)
SELECT empno, ename, sal
FROM emp
WHERE sal = (SELECT Max_Salary FROM MaximumSalary);