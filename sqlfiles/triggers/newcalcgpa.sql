DELIMITER $$
CREATE TRIGGER calc_gpa
AFTER UPDATE ON enrolls
FOR EACH ROW
BEGIN
DECLARE obtained NUMERIC(2,2);
DECLARE g NUMERIC(2,2);
DECLARE gr VARCHAR(2);
DECLARE cr NUMERIC(1,0);
DECLARE total NUMERIC(1,0);
DECLARE cid VARCHAR(8);
DECLARE done INT DEFAULT FALSE;
DECLARE c CURSOR FOR SELECT * FROM course;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
SET obtained = 0;

SELECT SUM(credit) INTO total
FROM enrolls, course, student
WHERE NEW.regNo = student.regNo AND enrolls.course_id = course.course_id;

OPEN c;

read_loop: LOOP
    FETCH c INTO cid;

    IF done THEN
        LEAVE read_loop;
    END IF;

    SELECT grade INTO gr
    FROM enrolls, student
    WHERE NEW.regNo = student.regNo;

    SELECT credit INTO cr
    FROM course, enrolls
    WHERE cid = enrolls.course_id;

    IF gr = 'F' THEN
        SET g = 0;
    ELSEIF gr = 'E' THEN
        SET g = 0.5;
    ELSEIF gr = 'D' THEN
        SET g = 0.6;
    ELSEIF gr = 'C' THEN
        SET g = 0.7;
    ELSEIF gr = 'B' THEN
        SET g = 0.8;
    ELSEIF gr = 'A' THEN
        SET g = 0.9;
    ELSEIF gr = 'A+' THEN
        SET g = 1;
    END IF;

    SET obtained = obtained + (cr * g);
END LOOP;

CLOSE c;

SET @x := obtained / total;

UPDATE semester SET gpa = @x
WHERE regNo = NEW.regNo AND course_id = cid;

END$$

DELIMITER ;