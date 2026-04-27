create database University
use University

create table Student(
StudentID int primary key identity(1,1),
NationalID varchar(30) unique not null,
FirstName varchar(30),
LastName varchar(30),
BirthDate date,
GPA decimal(4,3),
Gender varchar(10)
);

create table StudentPhone(
StudentID int,
PhoneNumber varchar(20),
primary key (StudentID,PhoneNumber),
foreign key (StudentID) references Student(StudentID)
);

create table Department(
DepartmentID int primary key,
DepartmentName varchar(80) not null,
Capacity int,
ManagerID int,
);

create table Instructor(
InstructorID int primary key,
FirstName varchar(30),
LastName varchar(30),
Email varchar(50),
DepartmentID int,
foreign key (DepartmentID) references Department(DepartmentID)
);

alter table Department
add constraint FK_DEPARTMENT_MANAGER 
foreign key (ManagerID) references Instructor(InstructorID)

create table Course(
CourseID int primary key,
CourseName varchar(80) not null,
CreditHours tinyint,
Level tinyint,
DepartmentID int,
foreign key (DepartmentID) references Department(DepartmentID)
)

create table Lab(
LabNumber int,
CourseID int,
Schedule varchar(100),
Capacity int,
primary key(LabNumber,CourseID),
foreign key (CourseID) references Course(CourseID)
);

create table Teaching(
InstructorID int,
CourseID int,
Semester tinyint,
AcademicYear int,
primary key(InstructorID,CourseID),
foreign key (InstructorID) references Instructor(InstructorID),
foreign key (CourseID) references Course(CourseID),
);

create table Enrollment(
NationalID varchar(30),
CourseID int,
EnrollmentDate date default getdate(),
Semester tinyint,
Grade int,
primary key(NationalID,CourseID),
foreign key (NationalID) references Student(NationalID),
foreign key (CourseID) references Course(CourseID),
);

select * from Student

