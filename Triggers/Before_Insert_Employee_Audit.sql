-- Write a BEFORE INSERT trigger on the emp table that
-- inserts the newly added employee's empno and ename into
-- emp_audit only if the employee's salary (sal) is not 0.

-- Select the database
USE akshay;

-- Display existing triggers
SHOW TRIGGERS;

-- Drop the trigger if it already exists
-- This prevents the "Trigger already exists" error
DROP TRIGGER IF EXISTS before_emp_insert;

-- Change the delimiter temporarily
DELIMITER $$

-- Create a BEFORE INSERT trigger
CREATE TRIGGER before_emp_insert
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN

    -- Check whether the new employee's salary is not zero
    IF NEW.sal <> 0 THEN

        -- Insert the employee number and name into the audit table
        INSERT INTO emp_audit (empno, ename)
        VALUES (NEW.empno, NEW.ename);

    END IF;

END $$

-- Restore the default delimiter
DELIMITER ;

-- Display the audit records
SELECT * FROM emp_audit;

-- Display the trigger definition
SHOW CREATE TRIGGER before_emp_insert;
