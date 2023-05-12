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