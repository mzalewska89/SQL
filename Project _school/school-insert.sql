CREATE TABLE teachers 
(
teacher_id serial PRIMARY key, 
name varchar, 
surname varchar, 
dob date,
UNIQUE (name, surname, dob)
); 



CREATE  TABLE students
(
student_id serial PRIMARY KEY,
name varchar,
surname varchar,
dob date,
UNIQUE (name, surname, dob)
);



CREATE TABLE department
(
dept_id serial PRIMARY KEY,
dept_name varchar,
deen int REFERENCES teachers(teacher_id) ON DELETE SET NULL 
);



CREATE TABLE courses
(
course_id serial PRIMARY KEY,
course_name varchar, 
department int REFERENCES department(dept_id) ON DELETE SET NULL 
);



CREATE TABLE teachers_courses
(
tc_id serial PRIMARY KEY,
teacher int REFERENCES teachers(teacher_id) ON DELETE SET NULL ,
course int REFERENCES  courses(course_id) ON DELETE SET NULL 
);



CREATE TABLE students_courses
(
id_sc serial PRIMARY KEY,
course_id int REFERENCES courses(course_id) ON DELETE cascade,
student_id int REFERENCES students(student_id) ON DELETE CASCADE,
UNIQUE (course_id, student_id)
);




CREATE TABLE grades
(
grade_id serial PRIMARY KEY,
course_id int REFERENCES courses(course_id) ON DELETE cascade,
student_id int REFERENCES students(student_id) ON DELETE CASCADE,
grade int 
);

DROP TABLE grades ;

INSERT INTO teachers (name, surname, dob)
VALUES 
	('Thomas', 'Tolkien', '21-09-1965');

SELECT * FROM teachers;
SELECT * FROM courses;

INSERT INTO teachers (name, surname, dob)
VALUES 
	('Matilda', 'Frank', '03-03-1987'),
	('Peggy', 'Brown', '18-07-1973'),
	('Theodor', 'McCurry', '22-11-1988'),
	('Mattew', 'Furry', '10-10-1963'),
	('Gregory', 'Sandman', '27-01-1961'),
	('Catherine', 'Stack', '07-09-1977'),
	('Betty', 'Monroe', '23-08-1964');
INSERT INTO teachers (name, surname, dob)
VALUES 
	('Mike', 'Rowly', '15-11-1989'),
	('Scott', 'Hornsby', '27-06-1971');


INSERT into students (name, surname, dob)
VALUES
	('Katty', 'Rose', '12-11-1994'),
	('Tom', 'McGregor', '01-01-1995'),
	('Melisa', 'Brown', '16-04-1993'),
	('Greg', 'Mallard', '28-09-1994'),
	('Becky', 'Boats', '07-08-1994'),
	('Meggy', E'O\'neil', '20-02-1993'),
	('Tracy', 'McGuire', '13-05-1993'),
	('Bill', 'Mosly', '03-07-1994'),
	('Cathrine', 'Mazzola', '08-12-1993'),
	('Stan','Grozky', '19-02-1993');


INSERT INTO department (dept_name, deen)
VALUES 
	('Science', 5),
	('Economy', 10),
	('History', 1),
	('Languages and Literature', 6),
	('Sports', 9);

INSERT INTO courses (course_name, department)
VALUES 
	('Physics', 1),
	('Biology', 1),
	('Chemistry', 1),
	('IT', 1),
	('Management', 2),
	('Statistics', 2),
	('Foreign relations', 2),
	('Acient history', 3),
	('Contemporary history', 3),
	('English literature', 4),
	('Foreign literature', 4),
	('Latin languages', 4),
	('Slovak languages', 4),
	('Athletics', 5),
	('Gymnastics', 5);


INSERT INTO teachers_courses (teacher, course)
VALUES 
	(10, 5),
	(10, 6),
	(2, 7),
	(2, 5),
	(7, 1),
	(7, 2),
	(7, 3),
	(3, 1),
	(3, 4),
	(4, 2),
	(4, 3),
	(5, 4),
	(1, 8),
	(1, 9),
	(6, 10),
	(6, 11),
	(9, 14),
	(8, 15);
	
	
INSERT INTO students_courses (course_id, student_id)
VALUES 
	(1, 1),
	(2, 1),
	(3, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 3),
	(5, 3),
	(14, 3),
	(4, 4),
	(5, 4),
	(15, 4),
	(4, 5),
	(5, 5),
	(6, 5),
	(7, 6),
	(11, 6),
	(12, 6),
	(7, 7),
	(11, 7),
	(12, 7),
	(8, 8),
	(9, 8),
	(10, 8),
	(13, 8),
	(8, 9),
	(9, 9),
	(10, 9),
	(13, 9),
	(14, 10),
	(15, 10);
	
INSERT INTO grades (course_id, student_id, grade)
	VALUES 
	(1, 1, 3),
	(2, 1, 4),
	(3, 1, 5),
	(1, 2, 2),
	(2, 2, 2),
	(3, 2, 3),
	(4, 3, 5),
	(5, 3, 5),
	(14, 3, 6),
	(4, 4, 4),
	(5, 4, 5),
	(15, 4, 4),
	(4, 5, 1),
	(5, 5, 2),
	(6, 5, 4),
	(7, 6, 6),
	(11, 6, 5),
	(12, 6, 6),
	(7, 7, 3),
	(11, 7, 2),
	(12, 7, 4),
	(8, 8, 4),
	(9, 8, 5),
	(10, 8, 2),
	(13, 8, 1),
	(8, 9, 4),
	(9, 9, 4),
	(10, 9, 6),
	(13, 9, 3),
	(14, 10, 2),
	(15, 10, 4);
	

