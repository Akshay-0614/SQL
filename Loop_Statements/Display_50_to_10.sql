-- Question:
-- Write a stored procedure using LOOP to display
-- numbers from 50 to 10, decreasing by 5 each time.

-- Delete the procedure if it already exists
DROP PROCEDURE IF EXISTS task1;

-- Change the delimiter temporarily
DELIMITER $$

-- Create the stored procedure
CREATE PROCEDURE task1()
BEGIN

    -- Declare variable and initialize it with 50
    DECLARE i INT DEFAULT 50;

    -- Start the LOOP with the label 'task1'
    task1: LOOP

        -- Display the current value
        SELECT i;

        -- Decrease the value by 5
        SET i = i - 5;

        -- Stop the loop after displaying 10
        IF i <= 10 THEN
            LEAVE task1;
        END IF;

    -- End the LOOP
    END LOOP task1;

-- End of the stored procedure
END $$

-- Restore the default delimiter
DELIMITER ;

-- Execute the stored procedure
CALL task1();
