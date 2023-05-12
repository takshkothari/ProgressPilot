set serveroutput on
declare
    regNo Student.regNo%TYPE;
    name Student.name%TYPE;
    email Student.email%TYPE;
    pwd Student.password%TYPE;
    phone Student.phone%TYPE;
begin
    regNo := '&RegistrationNumber';
    name := '&Name';
    email := '&Email';
    pwd := '&Password';
    phone := '&Phone';

    insert into student values (regNo, name, email, pwd, phone);
    dbms_output.put_line('Signed Up Successfully');
end;
/

CREATE PROCEDURE SignUp(
    IN p_regNo VARCHAR(50),
    IN p_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_pwd VARCHAR(50),
    IN p_phone VARCHAR(50)
)
BEGIN
    INSERT INTO student(regNo, stud_name, email, password, phone) 
    VALUES (p_regNo, p_name, p_email, p_pwd, p_phone);
    SELECT 'Signed Up Successfully' AS result;
END //

DELIMITER ;
