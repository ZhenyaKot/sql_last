DELIMITER //

CREATE FUNCTION FormatSeconds(seconds INT) 
RETURNS VARCHAR(100) 
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;

    SET days = seconds DIV 86400;  -- 1 день = 86400 секунд
    SET remaining_seconds = seconds MOD 86400;
    SET hours = remaining_seconds DIV 3600;  -- 1 час = 3600 секунд
    SET remaining_seconds = remaining_seconds MOD 3600;
    SET minutes = remaining_seconds DIV 60;  -- 1 минута = 60 секунд
    SET remaining_seconds = remaining_seconds MOD 60;
    
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');
END //

DELIMITER ;

SELECT FormatSeconds(123456);


CREATE TEMPORARY TABLE numbers (number INT);
INSERT INTO numbers (number) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

SELECT number
FROM numbers
WHERE number % 2 = 0;