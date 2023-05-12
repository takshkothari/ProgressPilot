/* to register user */
insert into student values ();

/* see profile */
/* general */
select regNo, stud_name, sem, dob, email, phone
from student natural join sem
where stud_name = <login details> and sem = <selected sem>;
/* update email button */
update student set email = <new email>
where stud_name = <login details> and sem = <selected sem>;
/* update phone button */
update student set phone = <new phone>
where stud_name = <login details> and sem = <selected sem>;

