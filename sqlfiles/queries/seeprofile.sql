set serveroutput on
declare
    regNo Student.regNo%TYPE;
    name Student.name%TYPE;
    email Student.email%TYPE;
    phone Student.phone%TYPE;
begin
    regNo := '&RegistrationNumber';
    select name into name from Student where regNo = regNo;
    select name into email from Student where regNo = regNo;
    select name into phone from Student where regNo = regNo;
    dbms_output.put_line('Registration Number: ' || regNo || ' Name: ' || name || ' Email: ' || email || ' Phone: ' || phone);
end;
/