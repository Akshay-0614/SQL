USE akshay;

-- Q1: Classify employees based on their salary.

WITH SalaryCategory AS
(
    SELECT
        empno,
        ename,
        sal,
        CASE
            WHEN sal >= 5000 THEN 'High Salary'
            WHEN sal >= 3000 THEN 'Medium Salary'
            ELSE 'Low Salary'
        END AS Salary_Status
    FROM emp
)
SELECT *
FROM SalaryCategory;


-- Q2: Classify employees as Senior or Junior based on salary.

WITH EmployeeLevel AS
(
    SELECT
        empno,
        ename,
        job,
        sal,
        CASE
            WHEN sal >= 3000 THEN 'Senior'
            ELSE 'Junior'
        END AS Employee_Level
    FROM emp
)
SELECT *
FROM EmployeeLevel;


-- Q3: Display employees and identify whether
-- their salary is above or below 2000.

WITH SalaryComparison AS
(
    SELECT
        empno,
        ename,
        sal,
        CASE
            WHEN sal > 2000 THEN 'Above 2000'
            WHEN sal = 2000 THEN 'Equal to 2000'
            ELSE 'Below 2000'
        END AS Salary_Result
    FROM emp
)
SELECT *
FROM SalaryComparison;


-- Q4: Classify employees based on their job role.

WITH JobCategory AS
(
    SELECT
        empno,
        ename,
        job,
        sal,
        CASE
            WHEN job = 'MANAGER' THEN 'Management'
            WHEN job = 'ANALYST' THEN 'Technical'
            WHEN job = 'CLERK' THEN 'Administrative'
            WHEN job = 'SALESMAN' THEN 'Sales'
            ELSE 'Other'
        END AS Job_Category
    FROM emp
)
SELECT *
FROM JobCategory;


-- Q5: Assign a bonus percentage based on salary.

WITH EmployeeBonus AS
(
    SELECT
        empno,
        ename,
        sal,
        CASE
            WHEN sal >= 5000 THEN 20
            WHEN sal >= 3000 THEN 10
            ELSE 5
        END AS Bonus_Percentage
    FROM emp
)
SELECT
    empno,
    ename,
    sal,
    Bonus_Percentage,
    ROUND(sal * Bonus_Percentage / 100, 2) AS Bonus_Amount
FROM EmployeeBonus;