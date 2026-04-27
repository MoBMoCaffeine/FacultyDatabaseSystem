# Faculty Database Project

This repository contains a Microsoft SQL Server database project for a faculty or university management system. It covers students, departments, instructors, courses, labs, teaching assignments, and course enrollment.

## Main Files

- `faculty.schema.sql`
  Main schema script that creates the `FacultyDBS` database, tables, keys, foreign keys, and constraints.

- `DataInsertion.sql`
  Inserts sample data for departments, students, student phones, instructors, courses, labs, teaching assignments, and enrollments.

- `test.sql`
  Contains validation and reporting queries for checking data, joins, counts, averages, rankings, and missing relations.

- `Documentation.md`
  Project notes about entities, relationships, and business rules.

- `team.csv`
  Team members list.

- `faculty.erd.drawio`
  Editable ERD source file.

- `ERD.photo.jpeg`
  ERD image export.

- `Mapping.pdf`
  Mapping document used during database design.

- `University.bak`
  SQL Server backup file for the database.

## File Architecture

```text
database/
|-- README.md
|-- Documentation.md
|-- faculty.schema.sql
|-- DataInsertion.sql
|-- test.sql
|-- team.csv
|-- faculty.erd.drawio
|-- ERD.photo.jpeg
|-- Mapping.pdf
|-- University.bak
`-- docs/
    |-- University_Schema.sql
    |-- studentInsertion.sql
    |-- departmentInsertion.sql
    |-- instructorInsertion.sql
    |-- dep_ins_course.sql
    `-- sample.sql
```

## Core Tables

The main schema in `faculty.schema.sql` defines these tables:

- `Department`
- `Student`
- `Student_Phone`
- `Instructor`
- `Course`
- `Lab`
- `Teaching`
- `Enrollment`

## Key Relationships

- Each department can reference one manager from `Instructor`.
- Each instructor belongs to one department.
- Each course belongs to one department.
- `Lab` is identified by a composite key with its related course.
- `Teaching` represents the many-to-many relation between instructors and courses.
- `Enrollment` represents the many-to-many relation between students and courses.
- Student phone numbers are stored in the separate `Student_Phone` table.

## How To Run

1. Open SQL Server Management Studio or another SQL Server client.
2. Run `faculty.schema.sql`.
3. Run `DataInsertion.sql`.
4. Run `test.sql` to check the inserted data and example queries.

## Notes

- The primary working database in the root scripts is `FacultyDBS`.
- The root files `faculty.schema.sql` and `DataInsertion.sql` are the clearest current versions for final execution.
- The `docs/` folder contains extra scripts and older or alternative drafts, including:
  `University_Schema.sql`, `studentInsertion.sql`, `departmentInsertion.sql`, `instructorInsertion.sql`, `dep_ins_course.sql`, and `sample.sql`.
- Some files in `docs/` use different database names or a different schema shape, so the root scripts should be treated as the main version.

## Requirements

- Microsoft SQL Server
- A SQL client such as SSMS
