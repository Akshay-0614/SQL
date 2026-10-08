-- Write a BEFORE UPDATE trigger on the employee table
-- that stores the employee's previous department
-- in the emp_dept_audit table before the department is updated.

-- Drop the audit table if it already exists
-- This is useful while practicing and recreating the table
DROP TABLE IF EXISTS emp_dept_audit;

-- Create the employee department audit table
CREATE TABLE emp_dept_audit(
    sno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    empno INT NOT NULL,
    ename VARCHAR(50) NOT NULL,
    dept VARCHAR(70),
    salary DOUBLE NOT NULL,
    updatedon DATE,
    remarks VARCHAR(100)
);


-- Display the audit table
-- It will be empty before the update
SELECT * FROM emp_dept_audit;


-- Drop the trigger if it already exists
-- This prevents "Trigger already exists" error
DROP TRIGGER IF EXISTS before_dept_update;

-- Change the delimiter temporarily
DELIMITER $$

-- Create BEFORE UPDATE trigger
CREATE TRIGGER before_dept_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN

    -- Store the employee's previous department details
    -- OLD refers to the values before the update
    INSERT INTO emp_dept_audit
        (empno, ename, dept, salary, updatedon, remarks)
    VALUES
        (
            OLD.Employee_Id,
            OLD.Employee_name,
            OLD.department,
            OLD.salary,
            CURDATE(),
            'BEFORE UPDATE'
        );
END $$

-- Restore the default delimiter
DELIMITER ;

-- Update the employee's department
-- This automatically fires the BEFORE UPDATE trigger
UPDATE employee
SET department = 'Hardware'
WHERE Employee_Id = 7;

-- Display the audit records
SELECT * FROM emp_dept_audit;