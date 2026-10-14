
USE akshay;

-- CTE Aggregate Functions

-- 1. Create a CTE to find the total salary of all employees.

WITH total_salary AS (
    SELECT SUM(sal) AS Total_Salary
    FROM emp
)
SELECT * FROM total_salary;


-- 2. Create a CTE to calculate the average salary of employees.

WITH avg_salary AS (
    SELECT AVG(sal) AS Average_Salary
    FROM emp
)
SELECT * FROM avg_salary;


-- 3. Create a CTE to find the maximum salary from the emp table.

WITH max_salary AS (
    SELECT MAX(sal) AS Maximum_Salary
    FROM emp
)
SELECT * FROM max_salary;


-- 4. Create a CTE to find the minimum salary from the emp table.

WITH min_salary AS (
    SELECT MIN(sal) AS Minimum_Salary
    FROM emp
)
SELECT * FROM min_salary;


-- 5. Create a CTE to count the total number of employees.

WITH emp_count AS (
    SELECT COUNT(*) AS Total_Employees
    FROM emp
)
SELECT * FROM emp_count;


-- 6. Create a CTE to calculate the total salary
-- of employees working in department 20.

WITH dept_salary AS (
    SELECT SUM(sal) AS Total_Salary
    FROM emp
    WHERE deptno = 20
)
SELECT * FROM dept_salary;


-- 7. Create a CTE to calculate the average salary
-- of employees working in department 10.

WITH dept_avg AS (
    SELECT AVG(sal) AS Average_Salary
    FROM emp
    WHERE deptno = 10
)
SELECT * FROM dept_avg;


-- 8. Create a CTE to count employees in each department.

WITH dept_count AS (
    SELECT deptno, COUNT(*) AS Total_Employees
    FROM emp
    GROUP BY deptno
)
SELECT * FROM dept_count;


-- 9. Create a CTE to find the maximum salary
-- in each department.

WITH dept_max_salary AS (
    SELECT deptno, MAX(sal) AS Maximum_Salary
    FROM emp
    GROUP BY deptno
)
SELECT * FROM dept_max_salary;


-- 10. Create a CTE to display departments
-- whose average salary is greater than 2000.

WITH dept_avg_salary AS (
    SELECT deptno, AVG(sal) AS Average_Salary
    FROM emp
    GROUP BY deptno
)
SELECT *
FROM dept_avg_salary
WHERE Average_Salary > 2000;
