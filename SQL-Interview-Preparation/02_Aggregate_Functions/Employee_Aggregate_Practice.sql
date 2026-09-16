use task;
select * from department;
select * from employee;

-- Display each department's Dept_Id and the total salary of employees in that department.
select dept_id,Sum(Salary) as Total_Salary from employee group by dept_id;

-- Display the department ID and total salary of only those departments whose total salary is greater than ₹40,000.
select dept_id,Sum(salary) as Total_salary from employee group by dept_id having sum(salary) > 40000;

-- Display the department ID and average salary of each department, but show only departments whose average salary is greater than ₹35,000.
select dept_id,Avg(salary) as Average_salary from employee group by dept_id having avg(Salary) > 35000;

-- Display the department ID, number of employees, and total salary for each department, but display only departments having at least 2 employees.
select dept_id,  COUNT(*) AS Employee_Count,SUM(Salary) AS Total_Salary from employee group by dept_id having count(*) >= 2;

-- Display the department ID, minimum salary, maximum salary, and average salary for each department.
select dept_id,min(salary) as Minimum_Salary,max(salary) as Maximum_Salary,Avg(Salary) as Average_salary from employee group by dept_id;
