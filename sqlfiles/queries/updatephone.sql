set serveroutput on
declare
    regNo Student.regNo%TYPE;
    phone Student.phone%TYPE;
begin
    regNo := '&RegistrationNumber';
    phone := '&NewPhone';

    update student set phone =  phone where regNo = regNo;
    dbms_output.put_line('Updated Phone Successfully');
end;
/