set serveroutput on
declare
    regNo Student.regNo%TYPE;
    email Student.email%TYPE;
begin
    regNo := '&RegistrationNumber';
    email := '&NewEmail';

    update student set email = email where regNo = regNo;
    dbms_output.put_line('Updated Email Successfully');
end;
/