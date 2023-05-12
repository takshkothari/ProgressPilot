set serveroutput on
declare
    regNo Student.regNo%TYPE;
    Student.password%TYPE;
begin
    regNo := '&RegistrationNumber';
    pwd := '&NewPassword';

    update student set password =  pwd where regNo = regNo;
    dbms_output.put_line('Updates Password Successfully');
end;
/