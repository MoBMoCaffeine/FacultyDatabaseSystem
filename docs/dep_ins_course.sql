create database university
use university
GO

-- department
create table department
(dep_id int not null,
department_name char(50),
capacity int,
instructor_id int,
constraint department_dep_id primary key (dep_id),
);

-- instructor
create table instructor
(instructor_id int not null,
first_name  char (10),
last_name char (15),
E_mail varchar (30),
dep_id int ,
constraint instructor_instructor_id_id_pk primary key (instructor_id),
constraint fk_department_dep_id foreign key (dep_id)
references department(dep_id)
);

-- course
create table course(
course_id int not null,
course_name char(50),
credit_hours int,
level_course int,
dep_id int,
constraint course_course_id primary key (course_id),
constraint fk_course_department foreign key (dep_id)
references department(dep_id)
);

-- 
alter table department
add constraint instructor_instructor_id
foreign key(instructor_id)
references instructor (instructor_id);