-- data insertion: 
USE FacultyDBS;
GO
-- departments: 
INSERT INTO Department (Department_ID, Department_Name, Capacity)
VALUES 
(8976, 'IT', 50),
(9945, 'AI', 35),
(2267, 'CS', 40),
(7907, 'IS', 45),
(1166, 'Software Engineering', 60),
(7543, 'Cyber Security', 70);
-- students: 
INSERT INTO Student (NationalID, FirstName, LastName, BirthDate, GPA, Gender)
VALUES 
('306080', 'Enjy', 'Ashraf', '2006-05-20', 3.0, 'Female'),
('306070', 'Ola', 'Mahmoud', '2006-07-15', 3.5, 'Female'),
('306090', 'Areej', 'Hesham', '2006-07-30', 3.1, 'Female'),
('306020', 'Mohammed', 'Moez', '2006-11-11', 3.2, 'Male'),
('306040', 'Abdelrhman', 'Abbas', '2006-11-20', 3.3, 'Male'),
('306060', 'Yasser', 'Osama', '2006-02-09', 3.1, 'Male'),
('306010', 'Habiba', 'Ahmed', '2006-03-24', 3.0, 'Female'),
('306050', 'Hazem', 'Ahmed', '2006-09-08', 3.0, 'Male'),
('306078', 'Hadeer', 'Montasar', '2006-01-02', 3.0, 'Female'),
('306098', 'Ahmed', 'Bershawi', '2006-03-08', 4.0, 'Male'),
('306099', 'Mohammed', 'Bakr', '2006-03-06', 4.0, 'Male'),
('306101', 'Karim', 'Hassan', '2006-06-10', 2.8, 'Male'),
('306102', 'Nour', 'Adel', '2006-08-12', 3.6, 'Female'),
('306103', 'Salma', 'Khaled', '2006-04-03', 3.9, 'Female'),
('306104', 'Omar', 'Tarek', '2006-10-21', 2.7, 'Male'),
('306105', 'Laila', 'Samir', '2006-12-01', 3.4, 'Female'),
('306106', 'Mostafa', 'Ali', '2006-02-14', 3.2, 'Male'),
('306107', 'Dina', 'Hossam', '2006-09-17', 3.7, 'Female'),
('306108', 'Yousef', 'Wael', '2006-07-22', 2.9, 'Male');

-- students' phones: 
INSERT INTO Student_Phone (StudentID, PhoneNumber)
VALUES 
(1, '01011223344'),
(1, '01211223344'),
(2, '01155667788'),
(3, '01599887766'),
(4, '01066554433'),
(4, '01266554434'),
(5, '01288776655'),
(6, '01122334455'),
(6, '01162554433'),
(6, '01567554433'),
(7, '01544332211'),
(8, '01000998877'),
(9, '01233445566'),
(9, '01566559933'),
(10, '01086550033'),
(10, '01199887700'),
(11, '01100887700'),
(12, '01011112222'),
(12, '01111112222'),
(13, '01222223333'),
(14, '01533334444'),
(15, '01044445555'),
(16, '01155556666'),
(17, '01266667777'),
(18, '01577778888');

-- instructors: 
INSERT INTO Instructor (Instructor_ID, First_Name, Last_Name, Email, Department_ID)
VALUES 
(1, 'Mohammed', 'Youssif', 'mohmmed@gmail.com', 8976),
(2, 'Manar', 'Oqpy', 'manar@gmail.com', 9945),
(3, 'Nabil', 'Nasr_Aldin', 'nabil@gmail.com', 2267),
(4, 'Gomaa', 'Shaban', 'gomaa@gmail.com', 7907),
(5, 'Mona', 'Mohammed', 'mona@gmail.com', 1166),
(6, 'Hala', 'Yasser', 'hala@gmail.com', 7543), 
(7, 'Samy', 'Amer', 'samy.amer@gmail.com', 8976),
(8, 'Reham', 'Said', 'reham.said@gmail.com', 9945),
(9, 'Khaled', 'Nour', 'khaled.nour@gmail.com', 2267), 
(10, 'Fatma', 'Ali', 'fatma.z@gmail.com', 1166),
(11, 'Hossam', 'Fathy', 'hossam@gmail.com', 8976),
(12, 'Nada', 'Ibrahim', 'nada@gmail.com', 9945),
(13, 'Sherif', 'Adel', 'sherif@gmail.com', 2267),
(14, 'Mai', 'Gamal', 'mai@gmail.com', 7907);

--	department managers: 
UPDATE Department SET Manager_Instructor_ID = 1 WHERE Department_ID = 8976;
UPDATE Department SET Manager_Instructor_ID = 2 WHERE Department_ID = 9945;
UPDATE Department SET Manager_Instructor_ID = 3 WHERE Department_ID = 2267;
UPDATE Department SET Manager_Instructor_ID = 4 WHERE Department_ID = 7907;
UPDATE Department SET Manager_Instructor_ID = 5 WHERE Department_ID = 1166;
UPDATE Department SET Manager_Instructor_ID = 6 WHERE Department_ID = 7543;

-- courses: 
INSERT INTO Course (Course_ID, Course_Name, Credit_Hours, Course_Level, Department_ID)
VALUES 
(101, 'Database 1', 3, 2, 8976),
(102, 'Machine Learning', 3, 4, 9945),
(103, 'Algorithms', 4, 3, 2267),
(201, 'Operating Systems', 3, 3, 2267), 
(202, 'Computer Networks', 3, 3, 8976),
(203, 'Deep Learning', 4, 4, 9945),
(204, 'Software Testing', 3, 4, 1166),
(205, 'Web Security', 3, 3, 7543),
(301, 'Data Structures', 3, 2, 2267),
(302, 'Cloud Computing', 3, 4, 8976),
(303, 'AI Ethics', 2, 4, 9945),
(304, 'Mobile Development', 3, 3, 1166);


-- labs: 
INSERT INTO Lab (LabNumber, CourseID, Schedule, Capacity)
VALUES 
(1, 101, 'Sunday 08:00 AM', 25),
(2, 101, 'Tuesday 10:00 AM', 25),
(1, 102, 'Monday 12:00 PM', 20),
(1, 201, 'Monday 08:00 AM', 30),
(1, 202, 'Tuesday 01:00 PM', 25),
(1, 203, 'Thursday 10:00 AM', 15),
(2, 201, 'Wednesday 10:00 AM', 30);

-- teaching data: 
INSERT INTO Teaching (InstructorID, CourseID, Semester, AcademicYear)
VALUES 
(1, 101, 1, 2026),
(2, 102, 1, 2026),
(3, 103, 1, 2026),
(7, 202, 2, 2026),
(9, 201, 2, 2026),
(8, 203, 2, 2026),
(5, 204, 2, 2026),
(6, 205, 2, 2026),
(11, 301, 1, 2026),
(12, 303, 1, 2026),
(13, 201, 1, 2026),
(14, 304, 2, 2026),
(1, 302, 2, 2026);

-- enrollment data: 
INSERT INTO Enrollment (NationalID, CourseID, Semester, Grade)
VALUES 
('306080', 101, 1, 85),
('306070', 101, 1, 90),
('306020', 103, 1, 75),
('306090', 201, 2, 88),
('306040', 202, 2, 91),
('306060', 203, 2, 82),
('306010', 204, 2, 95),
('306050', 205, 2, 70),
('306078', 201, 2, 84),
('306098', 203, 2, 99),
('306099', 205, 2, 88),
('306101', 101, 1, 78),
('306102', 102, 1, 92),
('306103', 103, 1, 88),
('306104', 201, 2, 67),
('306105', 202, 2, 85),
('306106', 203, 2, 80),
('306107', 204, 2, 93),
('306108', 205, 2, 74),
('306101', 301, 1, 81),
('306102', 303, 1, 90),
('306103', 304, 2, 87),
('306104', 302, 2, 76);