delete from student;
delete from course;
delete from assignment_exam;
delete from enrolls;
delete from takes;
delete from belongs;
delete from sem;

insert into student values (210905338, 'Taksh', 'taksh@gmail.com', 'taksh1234', '913632','1980-01-01');
insert into student values (210905170, 'Viswatara', 'viswatara@gmail.com', 'tara5678', '6281869387');

insert into course values ('c1', 'DBS', 3);
insert into course values ('c2', 'DAA', 4);
insert into course values ('c3', 'ES', 4);
insert into course values ('c4', 'FLAT', 3);
insert into course values ('c5', 'MATH', 3);
insert into course values ('c6', 'OE', 3);

insert into assignment values ('a1', 'c2', 10);
insert into assignment values ('a2', 'c2', 10);
insert into assignment values ('a3', 'c1', 20);

insert into enrolls values (210905170, 'c1', 4, 'A');
insert into enrolls values (210905338, 'c2', 4, 'A+');
insert into enrolls values (210905170, 'c2', 4, 'B');

insert into takes values (210905338, 'a1', 9);
insert into takes values (210905170, 'a2', 10);

insert into belongs values ('a1', 'c2');
insert into belongs values ('a2'. 'c2');
insert into belongs values ('a3', 'c1');

insert into sem values (210905338, 4, 8.40);
insert into sem values (210905338, 4, 7.97);
