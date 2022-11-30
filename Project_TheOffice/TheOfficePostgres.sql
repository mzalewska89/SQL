DROP DATABASE scranton;

DROP TABLE employees cascade;
DROP TABLE branch CASCADE;
DROP TABLE client CASCADE;
DROP TABLE works_with ;

			
-- tworzenie tabel 
CREATE TABLE employees 
(
emp_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
birth_date date,
sex VARCHAR(20),
salary INT
);

SELECT * FROM employees;

CREATE TABLE branch
(
branch_id SERIAL PRIMARY KEY,
branch_name VARCHAR(20),
mgr_id INT REFERENCES employees(emp_id) , --ON DELETE SET NULL 
mgr_start_date DATE
);

SELECT * FROM branch;

ALTER TABLE employees 
ADD COLUMN super_id int REFERENCES employees(emp_id), --ON DELETE SET NULL 
ADD COLUMN branch_id int REFERENCES branch(branch_id);

CREATE TABLE client (
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT REFERENCES branch(branch_id)
);

SELECT * FROM client;

CREATE TABLE works_with
(
emp_id INT REFERENCES employees(emp_id),
client_id INT REFERENCES client(client_id),
total_sales INT,
PRIMARY KEY (emp_id, client_id)
);

SELECT * FROM works_with;

CREATE TABLE branch_supplier
(
branch_id INT REFERENCES branch(branch_id), --ON DELETE CASCADE 
supplier_name VARCHAR(50),
supply_type VARCHAR (50),
PRIMARY KEY (branch_id, supplier_name)
);

SELECT * FROM branch_supplier ;

		-- update danych 


INSERT INTO employees (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES  
	(100, 'David', 'Wallace', '1967-11-17', 'M', '250000', NULL, NULL);

SELECT * FROM employees ;

INSERT INTO branch (branch_name, mgr_id, mgr_start_date)
 VALUES 
 	('Corporate', 100, '2006-02-09');

 SELECT * FROM branch ;

UPDATE  employees 
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employees (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES  
	(101, 'Jan', 'Levinson', '1961-05-11', 'F', 1110000, 100, 1);

INSERT INTO employees (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES 
	(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch (branch_name, mgr_id, mgr_start_date)
 VALUES 
 	('Scranton', 102, '1992-04-06');
 
UPDATE  employees 
SET branch_id = 2
WHERE emp_id = 102;
 
INSERT INTO employees (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES 
	(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
	(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2),
	(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

INSERT INTO employees (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
	(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch (branch_name, mgr_id, mgr_start_date)
 VALUES ('Stamford', 106, '1998-02-13');

UPDATE  employees 
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employees (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES 
	(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
	(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

INSERT INTO client (client_id, client_name , branch_id)
VALUES 
	(400, 'Dunmore Highschool', 2),
	(401, 'Lackawana Country', 2),
	(402, 'FedEx', 3),
	(403, 'John Daly Law, LLC', 3),
	(404, 'Scranton Whitepages', 2),
	(405, 'Times Newspaper', 3),
	(406, 'FedEx', 2);

SELECT * FROM employees ;

SELECT * FROM branch ;

SELECT * FROM client;

SELECT * FROM branch_supplier ; 

SELECT * FROM works_with ;


-- taski

--find all employees
SELECT *
FROM employees 
 ORDER BY emp_id;

--find all clients
SELECT * 
FROM client ;

--find all employees ordered by salary
SELECT *
FROM employees 
ORDER BY salary DESC ;

--find all employees ordered by sex than name  
SELECT * 
FROM employees 
ORDER BY sex , first_name , last_name ;

--find the first 5 employees in the table
SELECT * 
FROM employees 
ORDER BY emp_id 
LIMIT 5;

--find the fisrt and last names of all employees
SELECT first_name AS name, last_name AS surname
FROM employees ;

--find out all the different genders
SELECT DISTINCT sex
FROM employees ;


--find the number of employees
SELECT count(emp_id)
FROM employees ; 

--find the number of female employees born after 1970
SELECT count(sex)
FROM employees 
WHERE sex = 'F'
AND 
birth_date >= '01.01.1971';

--find the avarge of all employee's salaries
SELECT avg(salary::float)
FROM employees ;
SELECT * FROM employees ;

UPDATE employees 
SET salary = 110000
WHERE salary = 111000 
AND first_name = 'Jan'
 ;

--find out how many males and females there are  
SELECT count(sex), sex
FROM employees 
GROUP BY sex;

--find the total sales of each salesman 
SELECT sum(total_sales) AS sales, emp_id 
FROM works_with 
GROUP BY emp_id 
ORDER BY sales DESC ;

--find any client's who are an LLC
SELECT *
FROM client 
WHERE client_name LIKE '%LLC';

--find any suppliers who are in the label business
SELECT * 
FROM branch_supplier 
WHERE supplier_name LIKE '%Label%';

--find any employee born in october
SELECT *
FROM employees 
WHERE  birth_date::varchar LIKE '____-10-__';

SELECT *
FROM employees 
WHERE salary::varchar LIKE '7%';

--find a list of employee and branch names  
SELECT last_name 
FROM employees 
UNION
SELECT branch_name
FROM branch ;

--find a list of all clients and branch suppliers names  
SELECT client_name AS contrahents
FROM client 
UNION 
SELECT supplier_name
FROM branch_supplier ;

SELECT client_name AS companies, client.branch_id
FROM client  
UNION 
SELECT supplier_name, branch_supplier.branch_id 
FROM branch_supplier ;

--find a list of all money spent or earned by the company
SELECT total_sales AS money, 'earned'
FROM works_with 
UNION 
SELECT salary, 'spent'
FROM employees 
ORDER BY money;

SELECT sum(total_sales), 'sales' AS name
FROM works_with 
UNION
SELECT sum(salary), 'salary'
FROM employees;

INSERT INTO branch VALUES (4, 'Buffalo', NULL, NULL);

SELECT * FROM branch ;

--find all branches and the naes of their managers
SELECT employees.emp_id, employees.first_name, branch.branch_name 
FROM employees 
JOIN branch 
ON employees.emp_id = branch.mgr_id ;

SELECT employees.first_name, employees.last_name , branch.branch_name 
FROM employees 
JOIN branch 
ON employees.emp_id = branch.mgr_id ;

--all the rows from the table from "from" are included 
SELECT employees.emp_id, employees.first_name, branch.branch_name 
FROM employees 
LEFT JOIN branch 
ON employees.emp_id = branch.mgr_id ;

--all the rows from the table from "join" are included 
SELECT employees.emp_id, employees.first_name, branch.branch_name 
FROM employees 
right JOIN branch 
ON employees.emp_id = branch.mgr_id ;

SELECT employees.emp_id, employees.first_name, branch.branch_name 
FROM employees 
full JOIN branch 
ON employees.emp_id = branch.mgr_id ;

SELECT works_with.total_sales , client.client_name 
FROM works_with 
JOIN client 
ON works_with.client_id = client.client_id ;

SELECT works_with.total_sales AS "Total sales", employees.first_name AS "Name", employees.last_name AS "Surname", client.client_name AS "Client name"
FROM works_with 
INNER join employees 
ON works_with.emp_id = employees.emp_id 
INNER JOIN client
ON works_with.client_id = client.client_id 
ORDER BY total_sales ;

--find names of all employees who have sold over 30,000 to a single client
SELECT * FROM works_with ;

SELECT employees.first_name , employees.last_name 
FROM employees 
WHERE employees.emp_id IN (
	SELECT works_with.emp_id 
	FROM works_with 
	WHERE works_with.total_sales > 30000
);

--find all clients who are handled by the branch that Michael Scott manages
--assume you know Michael's ID (102)

SELECT client.client_name 
FROM client 
WHERE client.branch_id  IN (
	SELECT branch.branch_id
	FROM branch 
	WHERE branch.mgr_id = 102
) ;
