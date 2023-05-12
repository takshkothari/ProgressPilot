DELIMITER //

CREATE TRIGGER calc_grade
AFTER INSERT ON takes
FOR EACH ROW
BEGIN
DECLARE total INT;
DECLARE obtained INT;
DECLARE g DECIMAL(4,2);
DECLARE gr VARCHAR(2);
DECLARE cid VARCHAR(8);

SELECT SUM(maxmarks), SUM(marks)
INTO total, obtained
FROM takes
INNER JOIN assignment ON takes.ae_id = assignment.ae_id
INNER JOIN student ON takes.regNo = student.regNo
WHERE takes.regNo = NEW.regNo;

SELECT assignment.course_id
INTO cid
FROM takes
INNER JOIN assignment ON takes.ae_id = assignment.ae_id
INNER JOIN student ON takes.regNo = student.regNo
WHERE takes.regNo = NEW.regNo;

SET g = (obtained / total) * 10;

IF g > 0 AND g <= 4 THEN SET gr = 'F';
ELSEIF g > 4 AND g <= 5 THEN SET gr = 'E';
ELSEIF g > 5 AND g <= 6 THEN SET gr = 'D';
ELSEIF g > 6 AND g <= 7 THEN SET gr = 'C';
ELSEIF g > 7 AND g <= 8 THEN SET gr = 'B';
ELSEIF g > 8 AND g <= 9 THEN SET gr = 'A';
ELSEIF g > 9 AND g <= 10 THEN SET gr = 'A+';
END IF;

UPDATE enrolls
SET grade = gr
WHERE regNo = NEW.regNo AND course_id = cid;

END//

DELIMITER ;