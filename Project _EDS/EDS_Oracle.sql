CREATE TABLE department 
(
dept_id              NUMBER(2) NOT NULL,
name                 VARCHAR2(14),
location             VARCHAR2(13),
CONSTRAINT dept_pk PRIMARY KEY (dept_id)
);

ALTER USER EDS quota unlimited on USERS;

INSERT INTO department (dept_id, name, location) VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO department (dept_id, name, location) VALUES (20,'RESEARCH','DALLAS');
INSERT INTO department (dept_id, name, location) VALUES (30,'SALES','CHICAGO');
INSERT INTO department (dept_id, name, location) VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE employees 
(
emp_id              NUMBER(4) NOT NULL,
name                VARCHAR2(10),
job                 VARCHAR2(9),
manager             NUMBER(4) CONSTRAINT emp_self_key REFERENCES employees (emp_id),
hire_date           DATE,
salary              NUMBER(7,2),
commition           NUMBER(7,2),
dept_id             NUMBER(2) NOT NULL,
CONSTRAINT emp_fk FOREIGN KEY (dept_id) REFERENCES department (dept_id),
CONSTRAINT emp_pk PRIMARY KEY (emp_id)
);

INSERT INTO employees VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('17-11-1981','DD-MM-YYYY'), 5000,NULL,10);
INSERT INTO employees VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1-05-1981','DD-MM-YYYY'), 2850,NULL,30);
INSERT INTO employees VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('9-06-1981','DD-MM-YYYY'), 2450,NULL,10);
INSERT INTO employees VALUES (7566,'JONES','MANAGER',7839,TO_DATE('2-04-1981','DD-MM-YYYY'), 2975,NULL,20);
INSERT INTO employees VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('28-10-1981','DD-MM-YYYY'), 1250,1400,30);
INSERT INTO employees VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('20-02-1981','DD-MM-YYYY'), 1600,300,30);
INSERT INTO employees VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('8-10-1981','DD-MM-YYYY'), 1500,0,30);
INSERT INTO employees VALUES (7900,'JAMES','CLERK',7698,TO_DATE('3-12-1981','DD-MM-YYYY') ,950,NULL,30);
INSERT INTO employees VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('22-02-1981','DD-MM-YYYY'), 1250,500,30);
INSERT INTO employees VALUES (7902,'FORD','ANALYST',7566,TO_DATE('3-12-1981','DD-MM-YYYY'), 3000,NULL,20);
INSERT INTO employees VALUES (7369,'SMITH','CLERK',7902,TO_DATE('17-12-1980','DD-MM-YYYY'), 800,NULL,20);
INSERT INTO employees VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('09-12-1982','DD-MM-YYYY'), 3000,NULL,20);
INSERT INTO employees VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('12-01-1983','DD-MM-YYYY'), 1100,NULL,20);
INSERT INTO employees VALUES (7934,'MILLER','CLERK',7782,TO_DATE('23-01-1982','DD-MM-YYYY'), 1300,NULL,10);


CREATE TABLE salgrade 
(
grade               NUMBER,
lowest_salary       NUMBER,
highest_salary      NUMBER
);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);


--find all department IDs, employees' names and managers IDs
SELECT 
	dept_id,
	name,
	manager
FROM 
	EDS.employees;

--find all the data from Employees table 
SELECT * FROM EDS.employees;

--find all the one-year salaries and employees names (no commition included)
SELECT 
	name,
	salary * 12
FROM 
	EDS.employees;

--count the one-year salary of all employees considering that all got a rise of 250 (no commition included)
SELECT 
	name,
	(salary + 250) * 12
FROM 
	EDS.employees;

--give a lable 'yearly' to the 'salary * 12' statement
SELECT 
	name,
	salary * 12 AS yearly
FROM 
	EDS.employees;

--show employees ID and their name together in one COLUMN and label the columnt as 'employeed'

--SELECT 
--	CONCAT(emp_id, name)
--FROM
--	EDS.employees;

SELECT 
	emp_id || ', ' || name AS employeed
FROM 
EDS.employees;

--show in one column: 'Employee' + emp_id + 'works in department' + dept_id. Label the column 'Employee information'
SELECT 
	'Employee' || ' ' || emp_id || ' ' || 'works in department' || ' ' || dept_id AS Employee_information
FROM 
	EDS.employees;


--find one-year salary of all employees, commition included
SELECT 	
	name, 
	(salary * 12) + NVL(commition, 0)
FROM 
	EDS.employees;

--find all department IDs from employees table
SELECT dept_id
FROM EDS.employees;

--find all (single) departments from employees table
SELECT DISTINCT dept_id
FROM EDS.employees;

--find all single combinations of departments IDs and jobs in employees TABLE 
SELECT DISTINCT 
	dept_id,
	job
FROM 
	EDS.employees;

--order (ascending) all data from employees table by the column name 
SELECT *
FROM EDS.employees
ORDER BY name;

--order (descending) all data from eployee table by the column hire_date
SELECT *
FROM EDS.employees
ORDER BY hire_date DESC;

--order all data from employees table by: 
--department ID ascending and
--salary descending
SELECT * 
FROM EDS.employees
ORDER BY 
	dept_id ASC,
	salary DESC;


--show names, IDs, jobs, salaries and departments IDs of all CLERKS
SELECT 
	name, 
	emp_ID,
	job,
	salary, 
	dept_id
FROM EDS.employees
WHERE job = 'CLERK';

--show all departments names and ID with the ID higher than 20
SELECT 
	name, 
	dept_id
FROM 
	EDS.department
WHERE 	
	dept_id > 20;

--show all IDs and names of employees whose commition exceeds the monthly salary
SELECT 
	name,
	emp_id
FROM 
	EDS.employees
WHERE 
	commition > salary;

--show all data of employees whose salary is between 1000 and 2000
SELECT *
FROM EDS.employees
WHERE salary between 1000 AND 2000;

--show all data of employees whose managers have IDs: 7902, 7566 or 7788
SELECT *
FROM EDS.employees
WHERE manager IN (7902, 7566, 7788);

--show all data of employees whose surnames have 4 letters (in two ways - using and not using LENGTH function)
SELECT  *
FROM EDS.employees
WHERE LENGTH (name) = 4;

SELECT  *
FROM EDS.employees
WHERE name LIKE '____';

--show ID, name and job of all employees who do not have a manager
SELECT *
FROM eds.employees
WHERE manager IS NULL;

--show all data of employees whose salary is less than 1000 and more than 2000
SELECT *
FROM EDS.employees
WHERE salary NOT between 1000 AND 2000;

--show ID, name and department ID of employees whose names do not start with M
SELECT 
	emp_id,
	name,
	dept_id
FROM 
	EDS.employees
WHERE name NOT LIKE 'M%';

--show names of all employees that have a manager
SELECT name 
FROM EDS.employees
WHERE manager IS NOT NULL; 

--show name, department ID, salary and job of all employees who either are Clerks or have salary betwee 1000 and 2000
SELECT 
	name, 
	dept_id, 
	salary, 
	job 
FROM 
	EDS.employees
WHERE 
	job = 'CLERK'
	OR 
	salary BETWEEN 1000 AND 2000;

--show name, salary and job of all employees whose job is MANAGER and whose salary is 1500 and also all SALESMEN
SELECT 
	name, 
	salary,
	job 
FROM 
	EDS.employees
WHERE 
	(
	job = 'MANAGER'
	AND 
	salary >= 1500
	)
OR 
	job = 'SALESMAN';	

--show names, salary and job of all employees who are MANAGERS or who are SALESMEN and whose salary is more than 1500
SELECT 
	name, 
	salary, 
	job
FROM 
	EDS.employees
WHERE 
	job = 'MANAGER'
	OR 
	(
	job = 'SALESMAN'
	AND 
	salary >= 1500
	);

--show name, job and department ID of all MANAGERs and all CLERKs working in department 10
SELECT 
	name, 
	job,
	dept_id
FROM 
	EDS.employees
WHERE 
	job = 'MANAGER'
	OR 
	(
	job = 'CLERK'
	AND dept_id = 10
	);

--show all data from SALGRADE
SELECT *
FROM EDS.salgrade;

--show all data from DEPARTMENT 
SELECT *
FROM DEPARTMENT ;

--show all data of employees whose yearly salary (commition included) are less than 12000 or more than 24000
SELECT *
FROM EMPLOYEES 
WHERE 
	((salary * 12)+NVL(commition, 0)) < 12000
	OR 
	((salary * 12)+NVL(commition, 0)) > 24000;


--show all employee IDs, jobs and department IDs of all employees. Order the results by dept IDs and jobs, ascending.
SELECT 
	emp_id,
	job, 
	dept_id
FROM
	EMPLOYEES 
ORDER BY 
	dept_id, job;

--show all kinds of jobs (no repetitions)
SELECT DISTINCT job
FROM EMPLOYEES ;

--show all data of employees working in departments 10 and 20. Order the results by names
SELECT *
FROM EMPLOYEES 
WHERE 
	dept_id = 10 
	OR 
	dept_id = 20
ORDER BY name;

--show all names and jobs of employees working in department 20 who are CLERKs
SELECT 
	name,
	job
FROM 
	EMPLOYEES 
WHERE 
	dept_id = 20
	AND 
	job = 'CLERK';

--show names of all employees whose name includes "TH" or "LL"
SELECT name 
FROM EMPLOYEES 
WHERE 
	name LIKE '%TH%'
	OR 
	name LIKE '%LL%';

--show yearly salary (commition included) of all employees
SELECT (salary * 12) + NVL(commition, 0) AS yearly_salary
FROM EMPLOYEES ;

--show name, dept ID and hire date of all employees hired in 1982
SELECT 
	name,
	dept_id
FROM
	EMPLOYEES 
WHERE EXTRACT (YEAR FROM hire_date)=1982;

--show names, yearly salary and commition of all Salesmen, whose monthly salary exceeds the commition
--order the results by salary (descending) and names (ascending)
SELECT 
	name, 
	(salary * 12),
	commition
FROM 
	EMPLOYEES 
WHERE 
	salary > NVL(commition, 0)
ORDER BY 
	salary DESC,
	name ASC; 

--show all the data from EMPLOYEES and Department tables (without joining them)
SELECT *
FROM EMPLOYEES, DEPARTMENT ;

--show all the data from EMPLOYEES and Department tables (joining them)
SELECT *
FROM EMPLOYEES e
JOIN DEPARTMENT d ON e.dept_id = d.dept_id;

--show names, IDs, department names, locations and dept IDs of all employees. Order the results by names.
SELECT 
	e.name,
	e.emp_id, 
	e.dept_id, 
	d.name,
	d.location
FROM EMPLOYEES e
JOIN DEPARTMENT d ON e.dept_id = d.dept_id
ORDER BY e.name;

--names, deprtment locations and department names of all employees whose salary is more than 1500
SELECT 
	e.name,
	d.name, 
	d.location
FROM EMPLOYEES e
JOIN DEPARTMENT d ON e.dept_id = d.dept_id;

--show names, job, salary and salary's grade of all employees. 
--Order the results descending by grade and ascending by name  
SELECT 
	e.name,
	e.job, 
	e.salary,
	s.grade
FROM 
	EMPLOYEES e
	JOIN salgrade s 
		ON e.salary BETWEEN s.lowest_salary AND s.highest_salary
ORDER BY 
	s.grade DESC,
	e.name ASC;

--show name, salary and job of all employees whose salary-s grade is 3
SELECT 
	e.name, 
	e.job,
	e.salary
FROM 
	EMPLOYEES e
JOIN salgrade s ON e.salary BETWEEN s.lowest_salary AND s.highest_salary
WHERE s.grade = 3;

--show names and jobs of all employees hired in Dallas
SELECT 
	e.name,
	e.job
FROM 
	EMPLOYEES e
JOIN DEPARTMENT d ON e.dept_id = d.dept_id
WHERE d.location = 'DALLAS';

--show name, dept ID, dept name and location of all employees hired in dept 30 and 40 
SELECT 
	e.name,
	d.dept_id,
	d.name,
	d.location
FROM EMPLOYEES e
RIGHT JOIN DEPARTMENT d ON e.dept_id = d.dept_id
WHERE 
	d.dept_id = 30
	OR 
	d.dept_id = 40
;

--show names, dept name, dept location of all employees. Include the employees who are not asigned to any department
SELECT 
	e.name,
	d.name, 
	d.location 
FROM 
	EMPLOYEES e
LEFT JOIN DEPARTMENT d ON e.dept_id = d.dept_id
;

--show names of employees and names of departmets. 
--Include employees who are not asigned to any department and department which does not have any employees asigned to them
SELECT 
	e.name,
	d.name
FROM 
	EMPLOYEES e
FULL OUTER JOIN DEPARTMENT d ON e.dept_id = d.dept_id
;

--show names of employees who earn less than their managers
SELECT DISTINCT  emp.name
FROM EMPLOYEES emp
JOIN EMPLOYEES mgr ON mgr.emp_id = emp.manager
WHERE mgr.salary > emp.salary;

--add manager's names, their salary and their employees to the above
SELECT 
	emp.name,
	emp.salary,
	mgr.name,
	mgr.salary
FROM EMPLOYEES emp
JOIN EMPLOYEES mgr ON mgr.emp_id = emp.manager
WHERE emp.salary < mgr.salary;

--show all the jobs that occur in department 10 or 30
SELECT 
	job 
FROM EMPLOYEES 
WHERE DEPT_ID = 10 
UNION  
SELECT 
	job 
FROM EMPLOYEES 
WHERE DEPT_ID = 30;

--show all the jobs that occur both in department 10 and 30
SELECT 
	job 
FROM EMPLOYEES 
WHERE DEPT_ID = 10 
INTERSECT  
SELECT 
	job 
FROM EMPLOYEES 
WHERE DEPT_ID = 30;

--show all the jobs that occur in department 10, but not in department 30 
SELECT 
	job 
FROM EMPLOYEES 
WHERE DEPT_ID = 10 
EXCEPT  
SELECT 
	job 
FROM EMPLOYEES 
WHERE DEPT_ID = 30;

--show the avarage salary
SELECT 
	ROUND(AVG(salary),2) AS averege_salary
FROM 
	EMPLOYEES ;

--show minimum salary for CLERK
SELECT 
	MIN(salary) 
FROM
	EMPLOYEES 
WHERE 
	job = 'CLERK';

--count all the employees working in department 20
SELECT 
	COUNT(emp_id)
FROM 
	EMPLOYEES 
WHERE
	DEPT_ID = 20;

--show averege salary for each job
SELECT 
	ROUND(AVG(salary),2),
	job 
FROM 
	EMPLOYEES 
GROUP BY job;

--show averege salary for each job, except managers
SELECT 
	ROUND(AVG(salary),2),
	job 
FROM 
	EMPLOYEES 
WHERE job != 'MANAGER'
GROUP BY job;


--show averege salary for each job in each department
SELECT 
	job, 
	dept_id,
	ROUND(AVG(salary),2)
FROM 
	EMPLOYEES 
GROUP BY 
	DEPT_ID,
	job
ORDER BY DEPT_ID ;

--show maximum salary for each job
SELECT 
	job, 
	MAX(salary)
FROM 
	EMPLOYEES 
GROUP BY job;
	
--show averege salary for those department which hire more than 3 people
SELECT 	
	ROUND(AVG(salary),2)
FROM 
	EMPLOYEES 
HAVING COUNT(DEPT_ID) > 3;
	
--show jobs where the avarage salary is more than 3k
SELECT 
	job 
FROM 
	EMPLOYEES 
GROUP BY JOB 
HAVING AVG(salary) > 3000; 

--show all avarage mothly and yearly salary (with commition)
SELECT 
	job, 
	ROUND(AVG(salary),2),
	AVG(salary*12 + NVL(commition,0))
FROM EMPLOYEES 
GROUP BY JOB 
;

--show all departments that hire more than 3 people
SELECT 
	dept_id 
FROM 
	EMPLOYEES 
GROUP BY 
	DEPT_ID 
HAVING 
	count (DEPT_ID) > 3;

--check if there are any duplicate emp_ids
SELECT 
	EMP_ID  
FROM 
	EMPLOYEES 
GROUP BY 
	EMP_ID
HAVING 
	COUNT(emp_id) > 1; 

--show all minimum wages of all the subordinates (under each manager).           !!!!!!!!!!
--exclude the ones under 1000. order the result by the salary, ascending
SELECT 
	MIN(s.salary), 
	s.manager,
	m.NAME 
FROM 
	EMPLOYEES s
JOIN 
	EMPLOYEES m 
ON s.manager = m.EMP_ID 
GROUP BY s.manager, m.name 
HAVING MIN(s.salary) > 1000
ORDER BY min(s.SALARY) 
;

--count how many employees are hired in Dallas
SELECT 
	count (e.emp_id),
	d.LOCATION 
FROM 
	EMPLOYEES e
JOIN 
	DEPARTMENT d 
ON 
	e.DEPT_ID = d.DEPT_ID 
WHERE
	d.LOCATION = 'DALLAS'
GROUP BY 
	d.LOCATION  
;

--show maximum wage and employee name for each salary group
SELECT DISTINCT 
	MAX(e.salary) OVER (PARTITION BY s.GRADE ),
	s.grade
FROM EMPLOYEES e
JOIN SALGRADE s 
ON e.SALARY BETWEEN s.LOWEST_SALARY AND s.HIGHEST_SALARY 
;

-- to the above add a name of an employee with the maximum wage
SELECT DISTINCT 
	MAX(es.salary) OVER (PARTITION BY s.grade) AS maximum ,
	FIRST_VALUE(en.name) OVER (PARTITION BY s.grade ORDER BY es.salary DESC ),
	s.grade
FROM 
	EMPLOYEES en
JOIN 
	EMPLOYEES es 
ON 
	en.name = es.NAME 
JOIN 
	SALGRADE s 
ON 
	es.SALARY BETWEEN s.LOWEST_SALARY AND s.HIGHEST_SALARY 
;


SELECT 
	max_salary.ms,
	max_salary.grade,
	e.NAME 
FROM 
	(
	SELECT 
		MAX(e.salary) AS ms,
		s.GRADE
	FROM 
		EMPLOYEES e
	JOIN 
		SALGRADE s
	ON e.SALARY BETWEEN s.LOWEST_SALARY AND s.HIGHEST_SALARY  
	GROUP BY 
		s.GRADE
	) max_salary
JOIN EMPLOYEES e 
ON max_salary.ms = e.SALARY 
ORDER BY grade
;
	

--show how many wages are duplicates and how many employees gets them
SELECT 
	salary,
	COUNT(salary) cnt
FROM 
	EMPLOYEES 
GROUP BY 
	SALARY 
HAVING COUNT(salary) > 1
ORDER BY cnt DESC 
;

--show an avarage salary of employees from grade 2
SELECT 
	ROUND(AVG(salary),2)
FROM 
	EMPLOYEES e
JOIN 
	SALGRADE s 
ON 
	e.SALARY BETWEEN s.LOWEST_SALARY AND s.HIGHEST_SALARY 
WHERE grade = 2;

--show how many subordinates has each manager (including the name of the manager)
SELECT 
	count(emp_cnt.emp_id) cnt,
	emp_cnt.manager,
	mngr.name 
FROM 
	EMPLOYEES emp_cnt
JOIN 
	EMPLOYEES mngr 
ON 
	emp_cnt.MANAGER = MNGR.emp_id
GROUP BY 
	emp_cnt.MANAGER, MNGR.NAME 
;


--count the sum of all salaries of employees from salary grade 1
SELECT 
	SUM(salary)
FROM EMPLOYEES e
JOIN SALGRADE s 
ON e.SALARY BETWEEN s.LOWEST_SALARY AND s.HIGHEST_SALARY 
WHERE grade = 1
;

--find the names and salaries of all employees whose salary equals to the minimum salary in the company
SELECT 
	name, 
	salary
FROM 
	EMPLOYEES 
WHERE 
	SALARY = 
		(
		SELECT 
			MIN(salary)
		FROM 
			EMPLOYEES 
		)
;

--how names, salary and dept IDs of employees whose salary is equal to the lowest salary in each department 
SELECT 
	name,
	salary,
	dept_id
FROM 
	EMPLOYEES 
WHERE 
	salary IN  
	(
	SELECT 
		min(salary)
	FROM 
		EMPLOYEES 
	GROUP BY 
		DEPT_ID
	)
 ;

--show names, salary and dept IDs of all employees whose job is the same as Blake's
SELECT 
	name, 
	salary, 
	dept_id
FROM 
	EMPLOYEES 
WHERE 
	job = 
	(
	SELECT 
		job
	FROM 
		EMPLOYEES 
	WHERE 
		NAME = 'BLAKE'
	)
;

--from the above, exclude Blake himself
SELECT 
	name, 
	salary, 
	dept_id
FROM 
	EMPLOYEES 
WHERE 
	job = 
	(
	SELECT 
		job
	FROM 
		EMPLOYEES 
	WHERE 
		NAME = 'BLAKE'
	)
AND 
name != 'BLAKE'
;

--show name, salary and dept IDs of employees with the lowest salary in the department where they are hired
WITH m AS  (SELECT 
				DEPT_ID ,
				min(salary) AS min_sal
			FROM 
				EMPLOYEES 
			GROUP BY 
				DEPT_ID)
SELECT 
	e.name,
	e.salary,
	e.dept_id
FROM 
	EMPLOYEES e
JOIN m ON m.DEPT_ID = e.DEPT_ID AND e.SALARY = m.min_sal;

SELECT DISTINCT 
	FIRST_VALUE(salary) OVER ( PARTITION BY dept_id ORDER BY salary ASC) AS min_sal,
	FIRST_VALUE(NAME) OVER ( PARTITION BY dept_id ORDER BY salary ASC) AS name ,
	DEPT_ID
FROM 
	EMPLOYEES ;

--show name, salary, and dept IDs for employees who earn more than the minimum wage in dept30 (using ANY)
SELECT 
	name, 
	salary,
	dept_id
FROM 
	EMPLOYEES 
WHERE 
	SALARY > ANY (
	SELECT 
		salary
	FROM 	
		EMPLOYEES 
	WHERE 
		DEPT_ID = 30
	) 
;

--show name, salary and department ID for employees 
--whose salary is higher than the salary of every employee from dept30 (using ALL)
SELECT 
	name, 
	salary, 
	dept_id
FROM 
	EMPLOYEES 
WHERE salary > ALL (
	SELECT 
		salary
	FROM 	
		EMPLOYEES 
	WHERE 
		DEPT_ID = 30
	) 
;

--find a department ID in which the avarage salary is higher than the avarage salary in dept30

WITH avg_sal AS (
					SELECT 
						AVG(salary) AS a
					FROM 
						EMPLOYEES 
					WHERE DEPT_ID = 30
			    	)
SELECT 	
	dept_id
FROM 
	EMPLOYEES 
GROUP BY DEPT_ID 
HAVING 
	AVG(SALARY) >  (SELECT a FROM avg_sal) ;
	
SELECT 	
	dept_id
FROM 
	EMPLOYEES 
GROUP BY DEPT_ID 
HAVING 
	AVG(SALARY) >   (
					SELECT 
						AVG(salary)
					FROM 
						EMPLOYEES 
					WHERE DEPT_ID = 30
			    	);


--add the amount of an avarage salary, names and locations of the departments to the above
SELECT 	
	e.dept_id,
	ROUND(AVG(e.SALARY),2) a ,
	d.name,
	d.location
FROM 
	EMPLOYEES e
JOIN 
	DEPARTMENT d
ON e.DEPT_ID = d.DEPT_ID 
GROUP BY e.DEPT_ID, d.NAME , d.LOCATION 
HAVING 
	AVG(SALARY) >   (
					SELECT 
						AVG(salary)
					FROM 
						EMPLOYEES 
					WHERE DEPT_ID = 30
			    	);


--find a job with the highest avarage salary
SELECT * FROM 
	(
	SELECT 
		job,
		AVG(salary) a 
	FROM 
		EMPLOYEES 
	GROUP BY 
		job 
	ORDER BY a DESC 
	)
WHERE rownum = 1
;

SELECT 
	MAX(AVG(salary))
FROM 
	EMPLOYEES  
GROUP BY 
	job
;


SELECT 
	AVG(salary),
	job
FROM 
	EMPLOYEES  
GROUP BY 
	job
ORDER BY 1 DESC 
FETCH FIRST 1 ROW ONLY 
;


--find name, salary, job and dept ID of all employees whose salary is higher than the maximum wage in SALES dept  
SELECT 	
	name, 
	salary, 
	job, 
	dept_ID
FROM 	
	EMPLOYEES 
WHERE 
	salary > ALL
				(
				SELECT ROUND(AVG(e.salary),2)
				FROM EMPLOYEES e
				JOIN DEPARTMENT d
				ON e.DEPT_ID = d.DEPT_ID 
				WHERE d.name = 'SALES'
				)
;

--find name, job and salary of all employees who works on the same position as the employee 7369 
--and whose salary is bigger than the employee's 7876
SELECT 
	name, 
	job, 
	salary
FROM 
	EMPLOYEES 
WHERE 
	job = 
		(
		SELECT job
		FROM EMPLOYEES 
		WHERE EMP_ID = 7369
		)
	AND 
	salary > 
			( 
			SELECT SALARY 
			FROM EMPLOYEES 
			WHERE EMP_ID = 7876
			)
;

--find department names where CLERKs work 
SELECT DISTINCT 
	d.name
FROM 
	DEPARTMENT d 
JOIN 
	EMPLOYEES e 
ON 
	d.DEPT_ID = e.DEPT_ID 
WHERE 
	e.JOB = 'CLERK';


--find name, salary and dept ID of all employees who earn most in their departments 
WITH a AS (
SELECT 
	name,
	salary,
	dept_id,
	DENSE_RANK () OVER (PARTITION BY  DEPT_ID  ORDER BY SALARY DESC) r
FROM 
	EMPLOYEES 
)
SELECT * FROM a 
WHERE r = 1;

--find name, salary and dept ID of all employees who earn more than the avarage in their department
WITH a AS (
				SELECT 
					ROUND(AVG(salary),2) averege,
					DEPT_ID 
				FROM 
					EMPLOYEES 
				GROUP BY DEPT_ID )
SELECT 
	e.name, 
	e.salary, 
	e.DEPT_ID, 
	a.averege
FROM EMPLOYEES e
JOIN a 
ON e.DEPT_ID = a.dept_id
WHERE e.salary > a.averege;

--find name, salary and job of the employees with the smallest wage in each department
WITH a AS (
SELECT 
	name,
	salary, 
	job, 
	DENSE_RANK () OVER (PARTITION BY dept_id ORDER BY salary) r
FROM EMPLOYEES 
)
SELECT * FROM a 
WHERE r = 1
;

--find names of employees who has subordinates (using EXIST)
SELECT 	
	name 
FROM 
	EMPLOYEES e
WHERE 
	EXISTS (
			SELECT NAME 
			FROM EMPLOYEES m
			WHERE m.MANAGER = e.EMP_ID  
			)
;



--find names of employees whose department does not appear in the DEPT table 
SELECT 
	name 
FROM 
	EMPLOYEES 
WHERE 
	DEPT_ID NOT IN 
		(SELECT DEPT_ID
		FROM DEPARTMENT);
	
--using subquery, find names and location of departments which do not hire any employees 
SELECT 
	name, 
	location 
FROM 
	DEPARTMENT 
WHERE 
	DEPT_ID NOT IN 
	(SELECT DEPT_ID
	FROM EMPLOYEES);

--find name, salary and job of all employees who earn the maximum salary within their job
-- order the results by salary, descending 
WITH ms AS (
			SELECT 
				e.*,
				MAX(salary) OVER (PARTITION BY job) maxsalary
			FROM EMPLOYEES e
			)
SELECT 
	name, 
	salary, 
	job 
FROM ms 
WHERE salary = maxsalary
ORDER BY SALARY DESC ;


--find name, salary and job of all employees who earn the minimum salary within their job
-- order the results by salary, descending 
WITH ms AS (
			SELECT 
				e.*,
				MIN(salary) OVER (PARTITION BY job) minsalary
			FROM EMPLOYEES e
			)
SELECT 
	name, 
	salary, 
	job 
FROM ms 
WHERE salary = minsalary
ORDER BY SALARY DESC ;

--find name and location of each department 
--and name and date of an employee that was hired the most recently (in each dept)
WITH hire AS (
			SELECT 
				e.*,
				MAX(hire_date) OVER (PARTITION BY dept_id) maxhire
				FROM EMPLOYEES e
			)
SELECT 
	hire.name,
	hire.hire_date,
	d.name,
	d.location
FROM hire 
JOIN DEPARTMENT d
ON hire.DEPT_ID = d.dept_id
WHERE hire.hire_date = maxhire
ORDER BY HIRE_DATE DESC;

--find name, salary and dept name of emplyees whose salary exceeds 
-- the averege salary in their pay grade 
WITH averege AS (
				SELECT 
					e.*,
					AVG(e.salary) OVER (PARTITION BY s.grade) avgsal
				FROM 
					EMPLOYEES e
				JOIN 
					SALGRADE s 
				ON e.salary BETWEEN s.LOWEST_SALARY AND s.HIGHEST_SALARY)
SELECT 
	averege.name, 
	averege.salary, 
	d.name
FROM averege
JOIN DEPARTMENT d 
ON averege.dept_id = d.DEPT_ID 
WHERE averege.salary > avgsal;

--find names of three employees whose salary is the highest
SELECT * FROM (
				SELECT 
					name, salary
				FROM 
					EMPLOYEES 
				ORDER BY salary DESC)
WHERE rownum <=3
;

SELECT 
	name, salary
FROM 
	EMPLOYEES 
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY ;

--find name, salary, dept name and averege salary in the department 
--for all emploees whose salary exceed the averege in their department 
WITH averege AS (
				SELECT 
					e.*,
					round(AVG(salary) OVER (PARTITION BY dept_id),2) avgsal
				FROM 
					EMPLOYEES e)
SELECT 
	name, 
	SALARY, 
	DEPT_ID ,
	avgsal
FROM 
	averege 
WHERE salary > avgsal;
	
--make a list of names and hire date of all employees
--add a new column named MAXDATE and put (*) next to the employee hired most recently 


