use akshay;

-- Create a CTE named Emp_id to select employees working in department 30. Use it to delete those employees from employe.
with Emp_id as (

select Employe_id from employe where deptno = 30 

)
delete from employe where Employe_id in (select Employe_id from Emp_id);
select * from employe;


-- Create a CTE named LowSalaryEmployees to identify employees whose salary is below 1000. Delete those employees.
with LowSalaryEmployees as (

select Employe_id,sal from employe where sal <1000

)
delete from employe where employe_id in (select employe_id from LowSalaryEmployees);
select * from employe;

-- Create a CTE named department10Employees to select employees whose department is 10. Delete those records.
with D_10_Emp as(

select employe_id from employe where deptno = 10 

)
delete from employe where employe_id in (select * from D_10_Emp);
select * from employe;




