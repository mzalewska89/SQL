-- show an avarage grade for each student from all courses
SELECT 
	avg(grade), 
	student_id 
FROM grades 
group BY student_id 
ORDER BY avg(grade);

SELECT * FROM grades ;

-- add name and surname to the above
SELECT 
	avg(grades.grade), 
	students.name, 
	students.surname
FROM grades 
	LEFT JOIN students 
	ON grades.student_id = students.student_id 
group BY students.name, students.surname
ORDER BY avg(grade) DESC 
;

--show name and surname of a students and all courses that they attend
SELECT 
	courses.course_name,
	students.name,
	students.surname 
FROM
	courses 
INNER JOIN students_courses  	
	ON students_courses.course_id = courses.course_id 
INNER JOIN students 
	ON students.student_id = students_courses.student_id 
ORDER BY students.name 
	;

--find the professor who gave the highest grade to student n.4
SELECT * FROM grades 
ORDER BY student_id ;

SELECT 
	name, 
	surname  
FROM teachers 
WHERE teacher_id IN 
	(SELECT teacher 
	FROM teachers_courses 	
	WHERE course IN 
		(SELECT course_id
		FROM courses 
		WHERE course_id IN 
			(SELECT 
				course_id
			FROM 
				grades 
			WHERE grade IN 
				(SELECT 
					max(grade) 
				FROM
					grades 	
				WHERE 
					student_id = 4
				)
			AND student_id = 4
			)
		)
	);

SELECT DISTINCT 
	t.name, 
	t.surname, 
	c.course_name
FROM teachers AS t
JOIN teachers_courses AS tc 
ON t.teacher_id = tc.teacher 
JOIN courses AS c 
ON c.course_id = tc.course
JOIN grades AS g 
ON g.course_id = c.course_id 
WHERE grade IN 
				(SELECT 
					max(grade) 
				FROM
					grades 	
				WHERE 
					student_id = 4
				)
			AND student_id=4;



--show an avarage grade, student's name, surname and course name 
SELECT 
	avg(grade), 
	courses.course_name , 
	s.name, 
	s.surname 
FROM grades 	
JOIN courses 
ON grades.course_id = courses.course_id 
JOIN students_courses sc
ON courses.course_id = sc.course_id 
JOIN students s
ON sc.student_id = s.student_id 
GROUP BY courses.course_name, s.name, s.surname  
ORDER BY s.name, s.surname ;

--show an avarage grade given by each teacher
SELECT 
	avg(grade), 
	teachers.name ,
	teachers.surname 
FROM grades 
JOIN courses USING (course_id)
JOIN teachers_courses 
ON courses.course_id = teachers_courses.course
JOIN teachers 
ON teachers_courses.teacher = teachers.teacher_id 
GROUP BY teachers.name, teachers.surname 
ORDER BY teachers.name, teachers.surname ;

--show in which department the avarage of given grade was higher or queal to 4
SELECT 	
	round(avg(grade),2) AS avarage_grade,
	department.dept_name
FROM grades 
JOIN courses USING (course_id)
JOIN department 
ON department.dept_id = courses.department 
GROUP BY department.dept_name 
HAVING avg(grade) >= 4 
ORDER BY avg(grade)  ;

--show how many students attend classes in each department
SELECT 	
	count(student_id),
	department.dept_name 
FROM students_courses 	sc
JOIN courses c 
ON sc.course_id = c.course_id 
JOIN department 	
ON c.department = department.dept_id 
GROUP BY department.dept_name
ORDER BY count(student_id);

--create a view that shows which students passes the school year (2 and higher is a pass) 
CREATE VIEW Pass  AS
	SELECT 	
		students.name ,
		students.surname ,
		avg(grade) >=2 AS PASS	
	FROM  students 
	JOIN grades 
	ON grades.student_id = students.student_id 
	GROUP BY students.surname,students.name
	ORDER BY avg(grade) 
;


SELECT *
FROM Pass
--LIMIT 7;

--show how many times each grade was given and who gave it, order the results by the most frequent 
SELECT 
	count(grade),
	grade,
	array_agg(' ' || name || ' ' || surname)
FROM grades 
JOIN students_courses USING (course_id)
JOIN teachers_courses 
ON students_courses.course_id = teachers_courses.course 
JOIN teachers 
ON teachers_courses.tc_id = teachers.teacher_id 
GROUP BY grade 
ORDER BY count(grade) DESC ;


SELECT 
	grades.grade,
	teachers.name,
	teachers.surname
FROM grades
JOIN students_courses USING (course_id)
	JOIN teachers_courses 
	ON students_courses.course_id = teachers_courses.course 
	JOIN teachers 
	ON teachers_courses.tc_id = teachers.teacher_id 
ORDER BY grade DESC ;


SELECT 
	max(how_many_teachers),
	grade,
	name ,
	surname
FROM 
	(
	SELECT 
		grade,
		teachers.name ,
		teachers.surname ,
		count(teacher_id) AS how_many_teachers
	FROM grades 
	JOIN students_courses USING (course_id)
	JOIN teachers_courses 
	ON students_courses.course_id = teachers_courses.course 
	JOIN teachers 
	ON teachers_courses.tc_id = teachers.teacher_id 
	GROUP BY grade, teacher_id
	) AS grade
GROUP BY 
	grade.grade, 
	name, 
	surname
ORDER BY 
	grade, 
	max(how_many_teachers)
;


SELECT DISTINCT 
	grade,
	s.name ,
	s.surname,
	max(count) 
FROM(
	SELECT 
	grades.grade,
	teachers.name ,
	teachers.surname,
	count(grade) AS cnt 
		FROM grades  
		JOIN students_courses USING (course_id)
		JOIN teachers_courses 
		ON students_courses.course_id = teachers_courses.course 
		JOIN teachers 
		ON teachers_courses.tc_id = teachers.teacher_id
		GROUP BY grades.grade, teachers.name, teachers.surname
	) AS s
GROUP BY 
	s.cnt, 
	grade, 
	name, 
	surname 
ORDER BY 
	cnt DESC, 
	grade desc
;


SELECT 
	grade,
	subquery.name ,
	subquery.surname,
	max(c) 
FROM(
	SELECT 
	grades.grade,
	teachers.name ,
	teachers.surname,
	count(grade) AS c 
		FROM grades  
		JOIN students_courses USING (course_id)
		JOIN teachers_courses 
		ON students_courses.course_id = teachers_courses.course 
		JOIN teachers 
		ON teachers_courses.tc_id = teachers.teacher_id
		GROUP BY grades.grade, teachers.name, teachers.surname
	) AS subquery
GROUP BY  
	grade, 
	name, 
	surname 
;

SELECT * FROM teachers;

SELECT * FROM students_courses;

SELECT * FROM grades;


SELECT 
	grade,
	RANK () OVER (
			ORDER BY grade)
FROM 
	grades ;

--show name and a sunae of a student whose avarage grade is the closest to the general avaarge grade 
WITH avg_all AS (
	SELECT 
		round(avg(grade), 2) AS r
	FROM
		grades 
)
SELECT 
	s.name,
	s.surname,
	abs(round(avg(grade), 2) - (SELECT r FROM avg_all))
FROM 
	grades g
JOIN students s USING (student_id) 
GROUP BY 
	s.name , 
	s.surname  
ORDER BY 3
LIMIT 1
;

--show which teachers gave the most grades 
SELECT 	
	t.name,
	t. surname,
	count(grade) cnt
FROM 
	teachers t
JOIN teachers_courses tc 
ON t.teacher_id = tc.tc_id 
JOIN courses c
ON tc.course = c.course_id 
JOIN grades g 
ON c.course_id = g.course_id 
GROUP BY t.name , t.surname
ORDER BY cnt DESC  ;
	

	
SELECT 	
	sbq.name,
	sbq.surname
FROM 
	(SELECT 	
		t.name,
		t.surname,
		RANK () OVER (
				ORDER BY count(grade) DESC 
		) rank_cnt
	FROM 
		teachers t
	JOIN teachers_courses tc 
	ON t.teacher_id = tc.tc_id 
	JOIN courses c
	ON tc.course = c.course_id 
	JOIN grades g 
	ON c.course_id = g.course_id 
	GROUP BY t.name , t.surname) sbq
WHERE rank_cnt = 1
	;

--show how many students there are with grades 6/5, 4/3, 2/1
WITH 
	six_five AS (
		SELECT 
			grade,
			count(grade) cnt65
		FROM 
			grades
		WHERE grade = 6 or grade = 5
		GROUP BY grade),
	four_three AS (
		SELECT 
			grade,
			count(grade) cnt43
		FROM 
			grades
		WHERE grade = 4 or grade = 3
		GROUP BY grade)
SELECT 
	'fives and sixes', sum(six_five.cnt65)
	'fours and threes', sum(four_three.cnt43)
FROM
	six_five
	JOIN four_three USING (grade)
;




WITH 
	six_five AS (
		SELECT 
			grade,
			count(grade) cnt65
		FROM 
			grades
		WHERE grade = 6 or grade = 5
		GROUP BY grade),
		four_three AS (
		SELECT 
			grade,
			count(grade) cnt43
		FROM 
			grades
		WHERE grade = 4 or grade = 3
		GROUP BY grade),
		twos_ones AS (
		SELECT 
			grade,
			count(grade) cnt21
		FROM 
			grades
		WHERE grade = 2 or grade = 1
		GROUP BY grade)
SELECT 
	'fives and sixes', sum(six_five.cnt65)
FROM
	six_five
UNION 
SELECT 
	'fours and threes', sum(cnt43)
FROM
	four_three	
UNION 
SELECT 
	'twos and ones', sum(cnt21)
FROM
	twos_ones	
;
	

	SELECT 	
		'six_fives', 
		count(grade) FILTER(WHERE grade IN (5,6))
	FROM grades 
UNION 
	SELECT 
		'fours_threes', 
		count(grade) FILTER(WHERE grade IN (4,3)) 
	FROM grades 
UNION 
	SELECT 
		'twos_ones', 
		count(grade) FILTER(WHERE grade IN (2,1))
	FROM grades ;
	

	
	SELECT 	
			course_name, 
			count(grade) FILTER(WHERE grade IN (5,6)) AS six_fives,
			count(grade) FILTER(WHERE grade IN (4,3)) AS fours_threes,
			count(grade) FILTER(WHERE grade IN (2,1)) AS twos_ones
	FROM grades 
	JOIN courses USING (course_id)
	GROUP BY course_name 






	
	
	