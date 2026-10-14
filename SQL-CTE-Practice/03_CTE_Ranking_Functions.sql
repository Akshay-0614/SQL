
USE akshay;

-- CTE Ranking Functions


-- 1. Using a CTE, find the highest salary from the emp table.

WITH high_sal AS (
    SELECT empno, ename, sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rank1
    FROM emp
)
SELECT empno, ename, sal
FROM high_sal
WHERE rank1 = 1;


-- 2. Using a CTE, find the second-highest distinct salary.

WITH high_sal AS (
    SELECT sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rank1
    FROM emp
)
SELECT DISTINCT sal AS Second_Highest_Salary
FROM high_sal
WHERE rank1 = 2;


-- 3. Using a CTE, find the third-highest distinct salary.

WITH high_sal AS (
    SELECT sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rank1
    FROM emp
)
SELECT DISTINCT sal AS Third_Highest_Salary
FROM high_sal
WHERE rank1 = 3;


-- 4. Using a CTE, find the lowest salary from the emp table.

WITH low_sal AS (
    SELECT empno, ename, sal,
           DENSE_RANK() OVER (ORDER BY sal ASC) AS rank1
    FROM emp
)
SELECT empno, ename, sal
FROM low_sal
WHERE rank1 = 1;


-- 5. Using a CTE, assign a unique row number to each employee
-- based on salary in descending order.

WITH emp_rank AS (
    SELECT empno, ename, sal,
           ROW_NUMBER() OVER (ORDER BY sal DESC, empno) AS row_num
    FROM emp
)
SELECT * FROM emp_rank;


-- 6. Using a CTE, rank employees based on salary
-- in descending order using RANK().

WITH emp_rank AS (
    SELECT empno, ename, sal,
           RANK() OVER (ORDER BY sal DESC) AS rank1
    FROM emp
)
SELECT * FROM emp_rank;


-- 7. Using a CTE, rank employees based on salary
-- in descending order using DENSE_RANK().

WITH emp_rank AS (
    SELECT empno, ename, sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rank1
    FROM emp
)
SELECT * FROM emp_rank;


-- 8. Using a CTE, find the highest salary in each department.

WITH dept_rank AS (
    SELECT empno, ename, sal, deptno,
           DENSE_RANK() OVER (
               PARTITION BY deptno
               ORDER BY sal DESC
           ) AS rank1
    FROM emp
)
SELECT empno, ename, sal, deptno
FROM dept_rank
WHERE rank1 = 1;


-- 9. Using a CTE, find the second-highest distinct salary
-- in each department.

WITH dept_rank AS (
    SELECT empno, ename, sal, deptno,
           DENSE_RANK() OVER (
               PARTITION BY deptno
               ORDER BY sal DESC
           ) AS rank1
    FROM emp
)
SELECT empno, ename, sal, deptno
FROM dept_rank
WHERE rank1 = 2;


-- 10. Using a CTE, display the top three highest-paid employees.

WITH emp_rank AS (
    SELECT empno, ename, sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rank1
    FROM emp
)
SELECT empno, ename, sal
FROM emp_rank
WHERE rank1 <= 3
ORDER BY sal DESC;
