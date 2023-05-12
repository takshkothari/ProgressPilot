set serveroutput on
declare
    regNo varchar(10);
    pwd varchar(20);
begin
    regNo := '&RegistrationNumber';
    pwd := '&NewPassword';

    update student set password =  pwd where regNo = regNo;
    dbms_output.put_line('Signed Up Successfully');
end;
/