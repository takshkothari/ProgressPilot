drop table student;
drop table course;
drop table assignment_exam;
drop table enrolls;
drop table takes;
drop table belongs;
drop table sem;

create table student
 (regNo  double(9) not null, 
  stud_name  varchar(20) not null, 
  email varchar(50) not null, 
  pass varchar(20) not null,
  phone varchar(10) not null,
  dob varchar(10) not null,
  primary key (regNo)
 );

create table course
 (course_id varchar(8) not null, 
  c_title varchar(50) not null, 
  credit numeric(1,0) check (credit > 0),
  primary key (course_id)
 );

create table assignment
 (ae_id  varchar(10) not null,
  maxmarks numeric(2,0) not null,
  course_id varchar(8) not null,
  primary key (ae_id),
  foreign key (course_id) references course (course_id) on delete cascade
 );

create table enrolls
 (regNo  double(9) not null,
  course_id varchar(8) not null,
  sem numeric(1,0) not null,
  grade varchar(2) check (grade in ('A+', 'A', 'B', 'C', 'D', 'E', 'F')),
  primary key (regNo, course_id, sem),
  foreign key (regNo) references student(regNo) on delete cascade,
  foreign key (course_id) references course(course_id) on delete cascade
 );

create table takes
 (regNo double(9) not null,
  ae_id varchar(10) not null,
  marks numeric(2,0) not null,
  primary key (regNo, ae_id),
  foreign key (regNo) references student(regNo) on delete cascade,
  foreign key (ae_id) references assignment(ae_id) on delete cascade
 );

create table belongs
 (ae_id varchar(10) not null,
  course_id varchar(8) not null,
  primary key (ae_id, course_id),
  foreign key (ae_id) references assignment(ae_id) on delete cascade,
  foreign key (course_id) references course(course_id) on delete cascade
 );

create table semester
 (regNo double(9) not null,
  sem numeric(1,0) not null,
  gpa numeric(2,2) check (gpa >= 0 and gpa <= 10),
  primary key(regNo, sem),
  foreign key (regNo) references student(regNo) on delete cascade
 );