set serveroutput on
declare
    regNo Student.regNo%TYPE;
    stud_name Student.stud_name%TYPE;
    email Student.email%TYPE;
    phone Student.phone%TYPE;
begin
    regNo := '&RegistrationNumber';
    select stud_name into stud_name from Student where regNo = regNo;
    select email into email from Student where regNo = regNo;
    select phone into phone from Student where regNo = regNo;
    dbms_output.put_line('Registration Number: ' || regNo || ' Name: ' || name || ' Email: ' || email || ' Phone: ' || phone);
end;
/
SET @regNo = 'RegistrationNumber';

SELECT stud_name, email, phone INTO @name, @email, @phone
FROM Student
WHERE regNo = @regNo;

SELECT CONCAT('Registration Number: ', @regNo, ' Name: ', @name, ' Email: ', @email, ' Phone: ', @phone);
