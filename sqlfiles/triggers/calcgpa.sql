set serveroutput on

create or replace trigger calc_gpa
after update on enrolls
for each row
declare
cursor c is select * from course
total number;
obtained numeric(2,2)
g numeric(2,2)
gr varchar(2)
cr number
begin

    obtained:=0;

    select sum(credit) into total
    from enrolls, course, student
    where :NEW.regNo = student.regNo and enrolls.course_id = course.course_id;

    for i in c
    loop
        select grade into gr from enrolls, student
        where :NEW.regNo = student.regNo;

        select credit into cr from course, enrolls
        where i.course_id = enrolls.course_id;

        if gr = 'F' then g:= 0
        elsif gr = 'E' then g:= 0.5
        elsif gr = 'D' then g:= 0.6
        elsif gr = 'C' then g:= 0.7
        elsif gr = 'B' then g:= 0.8
        elsif gr = 'A' then g:= 0.9
        elsif gr = 'A+' then g:= 1

        obtained:= obtained + (cr*g);
    end loop;

    x: obtained/total;
    
    update semester set gpa = x
    where regNo = :NEW.regNo and course_id = cid;
end;
/