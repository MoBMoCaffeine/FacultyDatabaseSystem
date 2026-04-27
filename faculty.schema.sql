-- =====================================
-- 
-- =====================================

USE master;
GO

-- drop and re-create database: 
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'FacultyDBS')
BEGIN
	ALTER DATABASE FacultyDBS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE FacultyDBS;
END
GO

CREATE DATABASE FacultyDBS COLLATE Arabic_CI_AS;
GO

USE FacultyDBS;
GO

-- =============================================
-- tables: 
-- =============================================
-- Department table: 
create table Department
(Department_ID INT NOT NULL,
Department_Name NVARCHAR(50) NOT NULL,
Capacity INT CHECK (Capacity > 0),
Manager_Instructor_ID INT,
constraint PK_Departments PRIMARY KEY (Department_ID)
);

-- Student table: 
create table Student(
StudentID int primary key identity(1,1),
NationalID varchar(30) not null,
FirstName varchar(30),
LastName varchar(30),
BirthDate date,
GPA decimal(3,2) CHECK (GPA BETWEEN 0 AND 4.0),
Gender varchar(10) CHECK (Gender IN ('Male', 'Female')),
CONSTRAINT UQ_Student_NationalID UNIQUE (NationalID)
);

-- Student_Phones table: 
create table Student_Phone(
StudentID int NOT NULL,
PhoneNumber varchar(20) NOT NULL,
CONSTRAINT PK_Student_Phone PRIMARY KEY (StudentID, PhoneNumber),
CONSTRAINT FK_StudentPhone_Student FOREIGN KEY (StudentID) 
        REFERENCES Student(StudentID) ON DELETE CASCADE
);

-- Instructor table: 
CREATE TABLE Instructor
(Instructor_ID INT NOT NULL,
First_Name  NVARCHAR (50) NOT NULL,
Last_Name NVARCHAR (50) NOT NULL,
Email VARCHAR (100),
Department_ID INT ,
CONSTRAINT PK_Instructors PRIMARY KEY (Instructor_ID),
CONSTRAINT FK_Instructors_Departments FOREIGN KEY (Department_ID)
REFERENCES Department(Department_ID)
);

-- Course table: 
CREATE TABLE Course(
Course_ID INT NOT NULL,
Course_Name nvarchar(50) NOT NULL,
Credit_Hours int,
Course_Level int,
Department_ID int,
constraint PK_Courses primary key (Course_ID),
constraint FK_Courses_Departments foreign key (Department_ID)
references Department(Department_ID)
);

-- relation between : 
alter table Department
add constraint FK_Departments_Instructor_Head
foreign key(Manager_Instructor_ID)
references Instructor (Instructor_ID);


-- Lab table: 
create table Lab(
LabNumber int NOT NULL,
CourseID int NOT NULL,
Schedule nvarchar(100),
Capacity int,
CONSTRAINT PK_Lab PRIMARY KEY (LabNumber, CourseID),
CONSTRAINT FK_Lab_Course FOREIGN KEY (CourseID) 
        REFERENCES Course(Course_ID)
);
-- teaching table: 
create table Teaching(
InstructorID int NOT NULL,
CourseID int NOT NULL,
Semester tinyint NOT NULL,
AcademicYear int NOT NULL,
CONSTRAINT PK_Teaching PRIMARY KEY (InstructorID, CourseID, Semester, AcademicYear),
    CONSTRAINT FK_Teaching_Instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(Instructor_ID),
    CONSTRAINT FK_Teaching_Course FOREIGN KEY (CourseID) REFERENCES Course(Course_ID)
);

-- Enrollment table: 
create table Enrollment(
NationalID varchar(30) NOT NULL,
CourseID int NOT NULL,
EnrollmentDate date default getdate(),
Semester tinyint,
Grade DECIMAL(5, 2),
CONSTRAINT PK_Enrollment PRIMARY KEY (NationalID, CourseID, Semester),
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (NationalID) REFERENCES Student(NationalID),
    CONSTRAINT FK_Enrollment_Course FOREIGN KEY (CourseID) REFERENCES Course(Course_ID)
);
GO