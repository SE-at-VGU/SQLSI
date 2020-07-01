DROP PROCEDURE IF EXISTS Q1;
DELIMITER //
CREATE PROCEDURE Q1(IN kcaller INT)
BEGIN
DECLARE _rollback int DEFAULT 0;
DECLARE krole varchar(100) DEFAULT 'Default';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SET _rollback = 1;
GET STACKED DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p1, @p2;
ROLLBACK;
END;
IF kcaller > 0 THEN 
SELECT Role.name INTO krole FROM Employee RIGHT JOIN Role ON Employee.role = Role.role_id WHERE kcaller = Employee.Employee_id;
END IF;
START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS Result;
CREATE TEMPORARY TABLE IF NOT EXISTS Result AS (SELECT 1 FROM Staff WHERE checkAuth(1, 1));
IF _rollback = 0
THEN SELECT * from Result;
END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS Q2a;
DELIMITER //
CREATE PROCEDURE Q2a(IN kcaller INT)
BEGIN
DECLARE _rollback int DEFAULT 0;
DECLARE krole varchar(100) DEFAULT 'Default';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SET _rollback = 1;
GET STACKED DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p1, @p2;
ROLLBACK;
END;
IF kcaller > 0 THEN 
SELECT Role.name INTO krole FROM Employee RIGHT JOIN Role ON Employee.role = Role.role_id WHERE kcaller = Employee.Employee_id;
END IF;
START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS Result;
CREATE TEMPORARY TABLE IF NOT EXISTS Result AS (SELECT name FROM Staff WHERE checkAuth(1, 1));
IF _rollback = 0
THEN SELECT * from Result;
END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS Q2b;
DELIMITER //
CREATE PROCEDURE Q2b(IN kcaller INT)
BEGIN
DECLARE _rollback int DEFAULT 0;
DECLARE krole varchar(100) DEFAULT 'Default';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SET _rollback = 1;
GET STACKED DIAGNOSTICS CONDITION 1 @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p1, @p2;
ROLLBACK;
END;
IF kcaller > 0 THEN 
SELECT Role.name INTO krole FROM Employee RIGHT JOIN Role ON Employee.role = Role.role_id WHERE kcaller = Employee.Employee_id;
END IF;
START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS Result;
CREATE TEMPORARY TABLE IF NOT EXISTS Result AS (SELECT age FROM Staff WHERE checkAuth(1, 1));
IF _rollback = 0
THEN SELECT * from Result;
END IF;
END //
DELIMITER ;
