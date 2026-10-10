-- Write a BEFORE INSERT trigger on employee that inserts
-- employee ID and name into emp_audit only when
-- department is 'MANAGER'.

-- Select the database
USE akshay;

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS before_Insert2;

-- Change the delimiter
DELIMITER $$

-- Create a BEFORE INSERT trigger
CREATE TRIGGER before_Insert2
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    -- Check whether the new employee's department is MANAGER
    IF NEW.department = 'MANAGER' THEN

        -- Insert employee ID and name into the audit table
        INSERT INTO emp_audit (empno, ename)
        VALUES (NEW.Employee_Id, NEW.Employee_name);

    END IF;
END $$

-- Restore the default delimiter
DELIMITER ;

-- Verify that the trigger exists
SHOW TRIGGERS;

-- Display employee records
SELECT * FROM employee;

-- Display audit records
SELECT * FROM emp_audit;

-- Display the trigger definition
SHOW CREATE TRIGGER before_Insert2;