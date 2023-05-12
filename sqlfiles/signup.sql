set serveroutput on
declare
    regNo varchar(10);
    name varchar(20);
    email varchar(50);
    pwd varchar(20);
    phone varchar(10);
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