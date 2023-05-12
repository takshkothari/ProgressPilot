set serveroutput on

create or replace trigger calc_grade
after insert on takes
for each row
declare
total number;
obtained number;
g numeric(2,2)
gr varchar(2)
cid varchar(8)
begin
    select sum(maxmarks) into total, sum(marks) into obtained
    from takes, assignment, student
    where :NEW.regNo = student.regNo and takes.ae_id = assignment.ae_id;

    select course_id into cid 
    from student, takes, assignment, course
    where :NEW.regNo = student.regNo and takes.ae_id = assignment.ae_id and assignment.course_id = course.course_id;

    g := (obtained/total) * 10;

    if g > 0 and g <= 4 then gr:= 'F'
    elsif g > 4 and g <= 5 then gr:= 'E'
    elsif g > 5 and g <= 6 then gr:= 'D'
    elsif g > 6 and g <= 7 then gr:= 'C'
    elsif g > 7 and g <= 8 then gr:= 'B'
    elsif g > 8 and g <= 9 then gr:= 'A'
    elsif g > 9 and g <= 10 then gr:= 'A+'

    update enrolls set grade = gr
    where regNo = :NEW.regNo and course_id = cid;
end;
/