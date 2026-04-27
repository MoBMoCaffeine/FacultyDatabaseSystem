# Faculty Database System Documentation

## 1. Entities & Attributes

### [cite_start]**STUDENT** [cite: 1, 2]
* [cite_start]**St_ID**: Primary Key (Surrogate Key) [cite: 2]
* [cite_start]**National_ID**: Unique Key [cite: 2]
* [cite_start]**Name**: Composite Attribute (First_Name, Last_Name) [cite: 2]
* [cite_start]**Birth_Date**: Date of birth [cite: 2]
* [cite_start]**GPA**: Grade Point Average [cite: 2]
* [cite_start]**Gender**: Student gender [cite: 2]
* **Age**: Derived Attribute (Calculated from Birth_Date)
* [cite_start]**Phone**: Multi-valued Attribute (Stored in a separate table) [cite: 3, 4]

### [cite_start]**DEPARTMENT** [cite: 7, 8]
* [cite_start]**Department_ID**: Primary Key [cite: 8]
* [cite_start]**Department_Name**: Name of the department [cite: 8]
* [cite_start]**Capacity**: Maximum student capacity [cite: 8]
* [cite_start]**Manager_Instructor_ID**: Foreign Key (Refers to the Instructor who chairs the department) [cite: 8]

### [cite_start]**INSTRUCTOR** [cite: 9, 10]
* [cite_start]**Instructor_ID**: Primary Key [cite: 10]
* [cite_start]**Name**: Composite Attribute (First_Name, Last_Name) [cite: 10]
* [cite_start]**Email**: Professional email address [cite: 10]
* [cite_start]**Department_ID**: Foreign Key (The department where the instructor works) [cite: 10]

### [cite_start]**COURSE** [cite: 5, 6]
* [cite_start]**Course_ID**: Primary Key [cite: 6]
* [cite_start]**Course_Name**: Name of the course [cite: 6]
* [cite_start]**Credit_Hours**: Number of hours assigned [cite: 6]
* [cite_start]**Level**: Academic level [cite: 6]
* [cite_start]**Dep_ID**: Foreign Key (The department offering the course) [cite: 6]

### [cite_start]**LAB** (Weak Entity) [cite: 11, 12]
* [cite_start]**Lab_Number**: Partial Key [cite: 12]
* [cite_start]**Course_ID**: Foreign Key (Identifying Relationship) [cite: 12]
* [cite_start]**Capacity**: Lab capacity [cite: 12]
* [cite_start]**Schedule**: Weekly timing [cite: 12]

---

## 2. Relationships

| Relationship | Entities Involved | Cardinality | Attributes on Relationship |
| :--- | :--- | :--- | :--- |
| **Manage** | Department & Instructor | 1 : 1 | - |
| **Works_in** | Instructor & Department | M : 1 | - |
| **Offers** | Department & Course | 1 : N | - |
| **Teaches** | Instructor & Course | M : N | [cite_start]Semester, Academic Year [cite: 14] |
| **Has** | Course & Lab | 1 : N | Identifying Relationship |
| **Enrolls_in** | Student & Course | M : N | [cite_start]Grade, Enroll_Date, Semester [cite: 16] |

---

## 3. Business Rules

1.  **Department Management**: Each department is managed by exactly one instructor, and each instructor can manage at most one department (1:1 relationship).
2.  **Employment**: An instructor works in only one department, while a department can have multiple instructors (M:1 relationship).
3.  **Course Offering**: A department offers multiple courses, but each course is offered by only one department (1:N relationship).
4.  **Teaching Assignment**: An instructor can teach multiple courses, and a course can be taught by multiple instructors. [cite_start]The semester and academic year are tracked for each assignment (M:N relationship)[cite: 13, 14].
5.  **Student Enrollment**: A student can enroll in many courses, and each course can host many students. [cite_start]The grade, enrollment date, and semester are recorded for each enrollment (M:N relationship)[cite: 15, 16].
6.  **Lab Association**: Labs are weak entities that depend on courses. [cite_start]A course can have multiple lab sections (1:N identifying relationship)[cite: 11, 12].
7.  [cite_start]**Multi-valued Attributes**: Students can have multiple phone numbers, which are managed in a dedicated relationship table to maintain data integrity[cite: 3, 4].