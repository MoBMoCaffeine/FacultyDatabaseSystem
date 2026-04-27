/* University Database System 
   Target: Microsoft SQL Server
*/

-- 1. إنشاء قاعدة البيانات
CREATE DATABASE UniversityDB;
GO
USE UniversityDB;
GO

-- 2. إنشاء جدول القسم (DEPARTMENT)
CREATE TABLE DEPARTMENT (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    budget DECIMAL(15, 2),
    estab_year INT,
    street VARCHAR(100),
    city VARCHAR(50)
);

-- 3. إنشاء جدول المحاضرين (INSTRUCTOR)
CREATE TABLE INSTRUCTOR (
    inst_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    dept_id INT, -- علاقة 1:N مع القسم
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

-- إضافة علاقة الكرسي (Chairs) 1:1 بين القسم والمحاضر
-- سنقوم بتعديل جدول القسم لإضافة معرف رئيس القسم
ALTER TABLE DEPARTMENT ADD chair_id INT UNIQUE;
ALTER TABLE DEPARTMENT ADD FOREIGN KEY (chair_id) REFERENCES INSTRUCTOR(inst_id);

-- 4. إنشاء جدول الطلاب (STUDENT)
CREATE TABLE STUDENT (
    stud_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    NID VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    admit_date DATE,
    gender CHAR(1),
    dept_id INT, -- التخصص
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

-- 5. إنشاء جدول المقررات (COURSE)
CREATE TABLE COURSE (
    course_id INT PRIMARY KEY,
    cour_name VARCHAR(100) NOT NULL,
    credits INT,
    description TEXT,
    level INT,
    dept_id INT, -- القسم الذي يقدم المقرر (Offers)
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

-- 6. إنشاء جدول المشاريع (PROJECT)
CREATE TABLE PROJECT (
    proj_id INT PRIMARY KEY,
    title VARCHAR(200),
    status VARCHAR(50),
    start_date DATE,
    end_date DATE,
    supervisor_id INT, -- المحاضر المشرف (Supervises)
    FOREIGN KEY (supervisor_id) REFERENCES INSTRUCTOR(inst_id)
);

-- 7. إنشاء جدول القاعات الدراسية (CLASSROOM)
CREATE TABLE CLASSROOM (
    room_id INT PRIMARY KEY,
    building_name VARCHAR(100),
    capacity INT
);

-- 8. إنشاء جدول المعامل (LAB) - كيان ضعيف
CREATE TABLE LAB (
    lab_no INT,
    course_id INT, -- المفتاح الأجنبي المعرف (Identifying)
    capacity INT,
    floor INT,
    room_no INT,
    schedule VARCHAR(100),
    PRIMARY KEY (lab_no, course_id), -- مفتاح مركب
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id) ON DELETE CASCADE
);

-- --- جداول العلاقات المتعددة (M:N Relationships) ---

-- 9. علاقة التدريس (TEACHES) بين المحاضر والمقرر
CREATE TABLE TEACHES (
    inst_id INT,
    course_id INT,
    semester VARCHAR(20),
    acad_year INT,
    PRIMARY KEY (inst_id, course_id, semester, acad_year),
    FOREIGN KEY (inst_id) REFERENCES INSTRUCTOR(inst_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

-- 10. علاقة التسجيل (ENROLLS_IN) بين الطالب والمقرر
CREATE TABLE ENROLLS_IN (
    stud_id INT,
    course_id INT,
    semester VARCHAR(20),
    acad_year INT,
    grade DECIMAL(5, 2),
    enroll_date DATE,
    PRIMARY KEY (stud_id, course_id, semester, acad_year),
    FOREIGN KEY (stud_id) REFERENCES STUDENT(stud_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

-- 11. علاقة الجدول الدراسي (SCHEDULED_IN) بين المقرر والقاعة
CREATE TABLE SCHEDULED_IN (
    course_id INT,
    room_id INT,
    day_of_week VARCHAR(15),
    time_slot TIME,
    PRIMARY KEY (course_id, room_id, day_of_week, time_slot),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id),
    FOREIGN KEY (room_id) REFERENCES CLASSROOM(room_id)
);

-- --- جداول الصفات متعددة القيم (Multi-valued Attributes) ---

-- 12. تخصصات المحاضرين
CREATE TABLE INSTRUCTOR_SPECIALIZATION (
    inst_id INT,
    specialization VARCHAR(100),
    PRIMARY KEY (inst_id, specialization),
    FOREIGN KEY (inst_id) REFERENCES INSTRUCTOR(inst_id)
);

-- 13. أرقام هواتف الطلاب
CREATE TABLE STUDENT_PHONE (
    stud_id INT,
    phone VARCHAR(20),
    PRIMARY KEY (stud_id, phone),
    FOREIGN KEY (stud_id) REFERENCES STUDENT(stud_id)
);

-- 14. أرقام هواتف الأقسام
CREATE TABLE DEPARTMENT_PHONE (
    dept_id INT,
    phone VARCHAR(20),
    PRIMARY KEY (dept_id, phone),
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);
GO


