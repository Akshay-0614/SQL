-- Question:
-- Write a stored procedure using LOOP to display
-- numbers from 10 to 50, increasing by 5 each time.

-- Delete the procedure if it already exists
DROP PROCEDURE IF EXISTS task;

-- Change the delimiter temporarily
DELIMITER $$

-- Create the stored procedure
CREATE PROCEDURE task()
BEGIN

    -- Declare variable and initialize it with 10
    DECLARE e INT DEFAULT 10;

    -- Start the LOOP with the label 'task'
    task: LOOP

        -- Display the current value
        SELECT e;

        -- Increase the value by 5
        SET e = e + 5;

        -- Stop the loop after displaying 50
        IF e >= 51 THEN
            LEAVE task;
        END IF;

    -- End the LOOP
    END LOOP task;

-- End of the stored procedure
END $$

-- Restore the default delimiter
DELIMITER ;

-- Execute the stored procedure
CALL task();
