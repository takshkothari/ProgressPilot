drop table student;
drop table course;
drop table assignment_exam;
drop table enrolls;
drop table takes;
drop table belongs;
drop table sem;

create table student
 (regNo  varchar(9) not null, 
  stud_name  varchar(20) not null, 
  email varchar(50) not null, 
  pass varchar(20) not null,
  phone varchar(10) not null,
  dob varchar(10) not null,
  primary key (regNo)
 );

create table course
 (course_id varchar(8) not null, 
  title varchar(50) not null, 
  credits numeric(1,0) check (credits > 0),
  primary key (course_id)
 );

create table assignment_exam
 (ae_id  varchar(10) not null,
  maxmarks numeric(2,0) not null,
  course_id varchar(8) not null,
  primary key (ae_id),
  foreign key (course_id) references course (course_id) on delete cascade
 );

create table enrolls
 (regNo  varchar(9) not null,
  course_id varchar(8) not null,
  sem numeric(1,0) not null,
  grade varchar(2) check (grade in ('A+', 'A', 'B', 'C', 'D', 'E', 'F')),
  primary key (regNo, course_id, sem),
  foreign key (regNo) references student(regNo) on delete cascade,
  foreign key (course_id) references course(course_id) on delete cascade
 );

create table takes
 (regNo varchar(9) not null,
  ae_id varchar(5) not null,
  marks numeric(2,0) not null,
  primary key (regNo, ae_id),
  foreign key (regNo) references student(regNo) on delete cascade,
  foreign key (ae_id) references assignment_exam(ae_id) on delete cascade
 );

create table belongs
 (ae_id varchar(5) not null,
  course_id varchar(8) not null,
  primary key (ae_id, course_id),
  foreign key (ae_id) references assignment_exam(ae_id) on delete cascade,
  foreign key (course_id) references course(course_id) on delete cascade
 );

create table sem
 (regNo varchar(9) not null,
  sem numeric(1,0) not null,
  gpa numeric(2,2) check (gpa >= 0 and gpa <= 10),
  primary key(regNo, sem),
  foreign key (regNo) references student(regNo) on delete cascade
 );