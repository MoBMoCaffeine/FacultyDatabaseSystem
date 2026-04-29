USE FacultyDBS;
GO
-- testing columns names:
PRINT '===================';
PRINT 'Course Table';
PRINT '===================';
SELECT * FROM Course;
GO
PRINT '===================';
PRINT 'Department Table';
PRINT '===================';
SELECT * FROM Department;
GO
PRINT '===================';
PRINT 'Enrollment Table';
PRINT '===================';
SELECT * FROM Enrollment;
GO
PRINT '===================';
PRINT 'Instructor Table';
PRINT '===================';
SELECT * FROM Instructor;
GO
PRINT '===================';
PRINT 'Lab Table';
PRINT '===================';
SELECT * FROM Lab;
GO
PRINT '===================';
PRINT 'Student Table';
PRINT '===================';
SELECT * FROM Student;
GO
PRINT '===================';
PRINT 'Students'' Phones Table';
PRINT '===================';
SELECT * FROM Student_Phone;
GO
PRINT '===================';
PRINT 'Teaching relation Table';
PRINT '===================';
SELECT * FROM Teaching;
GO

-- ============================
-- tasting data and relations: |
-- ============================

-- test on relation btw students and their phones: 
SELECT 
    S.FirstName + ' ' + S.LastName AS Student_Name, 
    P.PhoneNumber
FROM Student S
JOIN Student_Phone P ON S.StudentID = P.StudentID;

-- retrieve the number of phone numbers for each student:
SELECT s.StudentID, s.FirstName, COUNT(p.PhoneNumber) AS PhoneCount
FROM Student s
LEFT JOIN Student_Phone p ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FirstName;

-- retrieve students whose GPA is above average:
SELECT *
FROM Student
WHERE GPA > (SELECT AVG(GPA) AS Aerage_GPA FROM Student)
ORDER BY GPA DESC;

-- retrieve all courses with the number of students in them: 
SELECT c.Course_Name, COUNT(e.NationalID) AS StudentCount
FROM Course c
LEFT JOIN Enrollment e ON c.Course_ID = e.CourseID
GROUP BY c.Course_Name;

-- retrieve the highest student in each course
SELECT c.Course_Name, s.FirstName, e.Grade
FROM Enrollment e
JOIN Student s ON e.NationalID = s.NationalID
JOIN Course c ON e.CourseID = c.Course_ID
WHERE e.Grade = (
    SELECT MAX(e2.Grade)
    FROM Enrollment e2
    WHERE e2.CourseID = e.CourseID
);

-- retrieve the instructors who teach more than one course
SELECT i.Instructor_ID, i.First_Name, COUNT(t.CourseID) AS CourseCount
FROM Instructor i
JOIN Teaching t ON i.Instructor_ID = t.InstructorID
GROUP BY i.Instructor_ID, i.First_Name
HAVING COUNT(t.CourseID) > 1;

-- retrieve students who are not registered in any course
SELECT *
FROM Student s
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollment e
    WHERE e.NationalID = s.NationalID
);

-- retrieve the student who has taken the largest number of courses
SELECT TOP 1 s.StudentID, s.FirstName, COUNT(*) AS CourseCount
FROM Student s
JOIN Enrollment e ON s.NationalID = e.NationalID
GROUP BY s.StudentID, s.FirstName
ORDER BY CourseCount DESC;

-- retrieve the courses that do not have any lab
SELECT *
FROM Course c
WHERE NOT EXISTS (
    SELECT 1
    FROM Lab l
    WHERE l.CourseID = c.Course_ID
);

-- retrieve (Average grades for each course + exclude those below 70)
SELECT c.Course_Name, AVG(e.Grade) AS AvgGrade
FROM Course c
JOIN Enrollment e ON c.Course_ID = e.CourseID
GROUP BY c.Course_Name
HAVING AVG(e.Grade) >= 70;

-- ranking of students within each course
SELECT 
    c.Course_Name,
    s.FirstName,
    e.Grade,
    RANK() OVER (PARTITION BY c.Course_ID ORDER BY e.Grade DESC) AS RankInCourse
FROM Enrollment e
JOIN Student s ON s.NationalID = e.NationalID
JOIN Course c ON c.Course_ID = e.CourseID;

-- retrieve the student whose grade is higher than the average for the course
SELECT s.FirstName, c.Course_Name, e.Grade
FROM Enrollment e
JOIN Student s ON s.NationalID = e.NationalID
JOIN Course c ON c.Course_ID = e.CourseID
WHERE e.Grade > (
    SELECT AVG(e2.Grade)
    FROM Enrollment e2
    WHERE e2.CourseID = e.CourseID
);

-- retrieve instructors whose courses are all above average
SELECT i.Instructor_ID, i.First_Name
FROM Instructor i
WHERE NOT EXISTS (
    SELECT 1
    FROM Teaching t
    JOIN Enrollment e ON t.CourseID = e.CourseID
    WHERE t.InstructorID = i.Instructor_ID
    GROUP BY t.CourseID
    HAVING AVG(e.Grade) < (SELECT AVG(Grade) FROM Enrollment)
);

-- ============================================================


