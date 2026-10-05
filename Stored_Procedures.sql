-- Write a stored procedure that accepts an employee number and displays "The Employee is Senior" if the employee's salary is greater than 2500; 
-- otherwise display "The Employee is Junior".

Delimiter $$
create procedure jobstatus(in eno int)
begin
if (select sal from emp where empno = eno)> 2500 then
	 select " The Employee is senior"  as Result;
else 
	select "The Employee is Junior" as Result;
end if ;
end $$
Delimiter ;

-- Call the procedure by passing an employee number
call jobstatus (7839);


-- Write a stored procedure that accepts an employee number and checks whether the employee belongs to the Accounting Department. 
-- If the department number is 10, display "The Employee is from Accounting Dept"; otherwise display "The Employee is from Another Dept"

Delimiter $$
create procedure empdeptno (in eno int)
begin
if (select deptno from emp where empno = eno) then
select "The Employee is from Accounting Dept" as result;
else
	select "The employee is from Another Dept" as result;
end if ;
end $$
delimiter ;

-- Call the procedure by passing an employee number
call empdeptno(7788);


-- Write a stored procedure that accepts an employee number and checks whether the employee's job role is ANALYST.
-- If the job is ANALYST, display "The Employee Role is Analyst"; otherwise display "The Employee is from Another Job Role".

delimiter $$
create procedure jobrole(in eno int)
begin
if (select job from emp where empno=eno) then
   select "The Employee Role is Analyst" as Emp_job ;
else
	select "The Employee is from Another job role" as Emp_job;
    end if;
    end $$
    delimiter //
    
    -- Call the procedure by passing an employee number
    call jobrole(7788);