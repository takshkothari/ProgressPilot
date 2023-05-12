set serveroutput on
declare
    ae_id assignment.ae_id%TYPE;
    mm assignment.maxmarks%TYPE;
    cid assignment.course_id%TYPE;
begin
    ae_id := '&AssignmentID';
    mm := '&MaxMarks';
    cid := '&CourseID';

    insert into assignment values (ae_id, mm, cid);
    dbms_output.put_line('Assignment Added Successfully');
end;
/

SET @ae_id = 'AssignmentID';
SET @mm = 'MaxMarks';
SET @cid = 'CourseID';

INSERT INTO assignment (ae_id, maxmarks, course_id) VALUES (@ae_id, @mm, @cid);

SELECT 'Assignment Added Successfully';
