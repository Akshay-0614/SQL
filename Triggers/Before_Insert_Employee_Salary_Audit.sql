-- Question:
-- Write a BEFORE INSERT trigger on employee that inserts
-- empno and ename into emp_audit only when salary > 1000.

-- Select the database
USE akshay;

-- Remove the trigger if it already exists
DROP TRIGGER IF EXISTS before_Insert1;

-- Change the delimiter
DELIMITER $$

-- Create a BEFORE INSERT trigger
CREATE TRIGGER before_Insert1
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    -- Check whether the new employee's salary is greater than 1000
    IF NEW.salary > 1000 THEN

        -- Insert employee number and name into the audit table
        INSERT INTO emp_audit (empno, ename)
        VALUES (NEW.empno, NEW.ename);

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
SHOW CREATE TRIGGER before_Insert1;
