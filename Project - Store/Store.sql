GRANT ALL PRIVILEGES TO store;

-- creating tables
CREATE TABLE store.employees (
	id NUMBER,
	name varchar(30),
	surname varchar(60),
	pesel NUMBER,
	sex varchar(1),
	dob DATE, 
	salary number
							);


CREATE TABLE store.items (
	id NUMBER,
	item_name varchar(100),
	item_type varchar(30),
	selling_price NUMBER,
	buying_price NUMBER, 
	tax NUMBER
						);

					
CREATE TABLE store.departments (
	id NUMBER, 
	department_name varchar(40),
	manager_id NUMBER,
	city varchar(50)
								);
								
-- inserting data (employees)						
INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (1, 'Jan', 'Kowalski', 88020512345, 'M', '05-FEB-1988', 4000);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (2, 'Krzysztof', 'Kapusta', 70122012345, 'M', '20-DEC-1970', 2500);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (3, 'Magdalena', 'Dzwonkowska', 92081612345, 'F', '16-AUG-1992', 5000);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (4, 'Karol', 'Krawcyzk', 82010112345, 'M', '01-JAN-1982', 3000);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (5, 'Joanna', 'Bak', 90121212345, 'F', '12-DEC-1990', 2700);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (6, 'Robert', 'Psikuta', 95070815642, 'M', '08-JUL-1995', 4200);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (7, 'Stefan', 'Siarzewski', 60051274391, 'M', '12-MAY-1960', 4550);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (8, 'Zofia', 'Brzydal', 84021659712, 'F', '16-FEB-1948', 2400);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (9, 'Julia', 'Niedziela', 81050242315, 'F', '02-MAY-1981', 7000);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (10, 'Bartosz', 'Karmel', 58031245679, 'M', '13-MAR-1958', 5120);

SELECT * FROM store.EMPLOYEES ;


-- constrains
INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (11, NULL, null, 12345678901, 'M', '18-MAY-1970', 1000);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (12, 'Grzegorz', null, 12345678901, 'M', '18-MAY-1970', 1000);

INSERT INTO store.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (13, 'Grzegorz', 'Brzeczyszczykiewicz', 12345678901, 'c', '18-MAY-1970', 1000);

DELETE FROM store.EMPLOYEES 
WHERE 	
	id = 11 OR  
	id = 12 OR  
	id = 13;

ALTER TABLE store.EMPLOYEES 
MODIFY name NOT NULL ;

ALTER TABLE store.EMPLOYEES 
MODIFY surname NOT NULL ;

ALTER TABLE EMPLOYEES 
MODIFY sex  CHECK(sex IN ('M', 'F')) ;

ALTER TABLE store.EMPLOYEES 
MODIFY sex  NOT NULL  ;

ALTER TABLE store.EMPLOYEES 
MODIFY pesel number(11) NOT null ;

-- primary key
ALTER TABLE store.EMPLOYEES 
ADD CONSTRAINT employees_pk PRIMARY KEY (id);

ALTER TABLE STORE.ITEMS 
ADD CONSTRAINT items_pk PRIMARY KEY (id); 

ALTER TABLE STORE.DEPARTMENTS 
ADD CONSTRAINT department_pk PRIMARY KEY (id); 

-- inserting data (items)
select * FROM items;

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (1, 'Baton "Mars"', 'sweets', 2.5, 1.5, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (2, 'Chleb', 'bread', 3, 1.2, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (3, 'P³atki owsiane 0.5kg', 'carbs', 2.25, 1.45, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (4, 'P³atki owsiane 1kg', 'carbs', 4, 2.4, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (5, 'Mleko', 'dairy', 3.5, 2, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (6, 'Jogurt "Danone"', 'dairy', 3.5, 2, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (7, 'Woda gazowana', 'drinks', 1.9, 1, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (8, 'Woda niegazowana', 'drinks', 1.9, 1, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (9, 'Oran¿ada', 'drinks', 2.49, 2, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (10, 'Bu³ka pszenna', 'bread', 0.5, 0.3, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (11, 'Bu³ka ¿ytnia', 'bread', 0.7, 0.5, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (12, 'Balsam do cia³a', 'cosmetics', 20, 14, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (13, 'Krem do r¹k', 'cosmetics', 8, 6.4, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (14, 'Dezodorant', 'cosmetics', 9, 4.4, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (15, 'Piwo', 'alcohol', 4, 2.8, 30);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (16, 'Wódka polska', 'alcohol', 25, 14, 30);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (17, 'Whiskey', 'alcohol', 60, 40, 30);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (18, 'Czekolada', 'sweets', 5, 2, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (19, 'Ry¿', 'carbs', 3, 1.5, 23);

INSERT INTO STORE.ITEMS (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (20, 'Kasza gryczana', 'carbs', 3, 1.7, 23);


-- inserting data (departments)
SELECT * FROM store.DEPARTMENTS ;

INSERT INTO STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
VALUES (1, 'Ksiêgowoœæ', NULL, 'Warszawa Œródmieœcie');

INSERT INTO STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
VALUES (2, 'Produkcja', NULL, 'Piaseczno');

INSERT INTO STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
VALUES (3, 'Administracja', NULL, 'Warszawa Centrum');

INSERT INTO STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
VALUES (4, 'IT', NULL, 'Warszawa Centrum');

INSERT INTO STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
VALUES (5, 'Sprzeda¿', NULL, 'Warszawa Œródmieœcie');

--foreign key 
ALTER TABLE STORE.DEPARTMENTS 
ADD CONSTRAINT fk_manager FOREIGN KEY (MANAGER_ID)
REFERENCES store.employees(id);

INSERT INTO STORE.EMPLOYEES (id, name, surname, pesel, sex, dob, salary)
VALUES (11, 'Sebastian', 'Krawczyk', 88031269123, 'M', '12-MAR-1988', 7000);

SELECT * FROM STORE.EMPLOYEES ;
SELECT * FROM STORE.DEPARTMENTS ;

UPDATE STORE.DEPARTMENTS 
SET MANAGER_ID = 2
WHERE ID = 1;

UPDATE STORE.DEPARTMENTS 
SET MANAGER_ID = 11
WHERE ID = 2;

UPDATE STORE.DEPARTMENTS 
SET MANAGER_ID = 4
WHERE ID = 3;

UPDATE STORE.DEPARTMENTS 
SET MANAGER_ID = 3
WHERE ID = 4

UPDATE STORE.DEPARTMENTS 
SET MANAGER_ID = 5
WHERE ID = 5;

SELECT 
	name, surname, department_name
FROM store.EMPLOYEES 
JOIN store.DEPARTMENTS 
ON store.EMPLOYEES.ID = store.DEPARTMENTS.MANAGER_ID ;

ALTER TABLE STORE.DEPARTMENTS  
MODIFY manager_id NOT NULL; 

--creating new table - product type
CREATE TABLE item_types 
(
item_type varchar(20) PRIMARY KEY,
full_name varchar(40) NOT NULL,
discount NUMBER,
expiry_date varchar(1) CHECK (expiry_date IN ('S', 'L'))
);

--change names of item types to the short form
UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'BRE'
WHERE ITEM_TYPE = 'bread';

UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'CAR'
WHERE ITEM_TYPE = 'carbs';

UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'DAI'
WHERE ITEM_TYPE = 'dairy';

UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'DRI'
WHERE ITEM_TYPE = 'drinks';

UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'COS'
WHERE ITEM_TYPE = 'cosmetics';

UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'ALC'
WHERE ITEM_TYPE = 'alcohol';

UPDATE STORE.ITEMS 
SET ITEM_TYPE = 'SWE'
WHERE ITEM_TYPE = 'sweets';

--inserting data to the table ITEM_TYPES 
INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('SWE', 'sweets', NULL, 'L');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('BRE', 'bread', NULL, 'S');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('CAR', 'carbs', NULL, 'L');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('DAI', 'dairy', NULL, 'S');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('DRI', 'drinks', NULL, 'L');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('COS', 'cosmetics', NULL, 'L');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('ALC', 'alcohol', NULL, 'L');

SELECT * FROM STORE.ITEM_TYPES ;

ALTER TABLE STORE.ITEMS 
ADD CONSTRAINT fk_item_type FOREIGN key(ITEM_TYPE)
REFERENCES store.item_types(item_type);

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('FRU', 'fruits', NULL, 'S');

INSERT INTO STORE.ITEM_TYPES (item_type, full_name, discount, EXPIRY_DATE)
VALUES ('VEG', 'vegetables', NULL, 'S');

--adding new items to ITEMS
INSERT INTO items (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (21, 'jab³ko', 'FRU', 4, 2.52, 23);

INSERT INTO items (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (22, 'pomarañcza', 'FRU', 8, 5.01, 23);

INSERT INTO items (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (23, 'banan', 'FRU', 7.25, 4.99, 23);

INSERT INTO items (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (24, 'pomidor malinowy', 'VEG', 12.99, 10.99, 23);

INSERT INTO items (id, ITEM_NAME, ITEM_TYPE, SELLING_PRICE, BUYING_PRICE, TAX)
VALUES (25, 'ogórek', 'VEG', 2.99, 1.99, 23);

--adding new column to ITEMS
ALTER TABLE ITEMS 
ADD unit varchar(10);

UPDATE STORE.ITEMS 
SET unit = 'piece'
WHERE ITEM_TYPE = 'BRE' 
	OR ITEM_TYPE = 'SWE' 
	OR ITEM_TYPE = 'CAR' 
	OR ITEM_TYPE = 'DAI' 
	OR ITEM_TYPE = 'DRI' 
	OR ITEM_TYPE = 'ALC' 
	or ITEM_TYPE = 'COS';

UPDATE STORE.ITEMS 
SET unit = 'kg'
WHERE ITEM_TYPE = 'FRU' 
	OR ITEM_TYPE = 'VEG';


SELECT * FROM store.ITEMS ;

ALTER TABLE store.ITEMS 
ADD  margin NUMBER ;

UPDATE STORE.ITEMS 
SET margin = items.SELLING_PRICE - items.BUYING_PRICE; 


--new table 
CREATE TABLE suppliers
(
id_supplier INT PRIMARY KEY ,
supplier_name varchar(20),
transportation_code varchar(3),
activity_status varchar(1)
);

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(1, 'Morliny', 'VAN', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(2, 'Koral', 'BUS', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(3, 'Pepco', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(4, 'Lidl', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(5, 'Obi', 'VAN', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(6, 'Decathlon', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(7, 'Biedronka', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(8, 'Auchan', 'BUS', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(9, 'Lewiatan', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(10, 'Intermarche', 'VAN', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(11, 'Bricomarche', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(12, 'Tesco', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(13, 'E.Leclerc', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(14, 'Amica', 'BUS', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(15, 'Avon', 'AUT', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(16, 'Puma', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(17, 'Lego', 'VAN', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(18, 'Militaria', 'TIR', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(19, 'Deliatesy', 'AUT', 'A');

INSERT INTO store.SUPPLIERS (id_supplier, SUPPLIER_NAME, TRANSPORTATION_CODE, ACTIVITY_STATUS)
values(20, 'Jogobella', 'VAN', 'A');


--find avarage price of items
SELECT AVG(items.BUYING_PRICE)
FROM ITEMS ;

--count suppliers and group by transportation
SELECT TRANSPORTATION_CODE , COUNT(suppliers.SUPPLIER_NAME)
FROM SUPPLIERS 
GROUP BY TRANSPORTATION_CODE ;

--count how many female and male employees there are
SELECT sex, SUM(id)  
FROM EMPLOYEES 
GROUP BY sex;

--find avarage selling price of items in specific groups
SELECT items.ITEM_TYPE , round(AVG(items.SELLING_PRICE),2) AS averege_price
FROM ITEMS 
GROUP BY ITEM_TYPE ;

--change tax for fruits
UPDATE ITEMS 
SET tax = 16 
WHERE ITEM_TYPE = 'FRU';

--find all data about employees who earn less than 3000
SELECT *
FROM STORE.EMPLOYEES 
WHERE SALARY < 3000;

--find all employees who earn more than 4k and the id is smaller than 7
SELECT *
FROM STORE.EMPLOYEES 
WHERE SALARY >4000 AND ID <7;

--order the list of employees by their age
SELECT *
FROM 
(
	SELECT * 
	FROM STORe.EMPLOYEES 
	ORDER BY DOB
)
WHERE ROWNUM <=5;


--order male employees by name ascending
SELECT * 
FROM STORE.EMPLOYEES 
WHERE sex = 'M'
ORDER BY NAME ASC ;

--order male employees by id descending
SELECT * 
FROM STORE.EMPLOYEES 
WHERE sex = 'M'
ORDER BY id desc ;

--find the names of departments' managers
SELECT 
	d.department_name, 
	e.name, 
	e.surname
FROM STORE.DEPARTMENTS d
JOIN store.EMPLOYEES e ON d.MANAGER_ID = e.ID ; 

--find expiry date for each item
SELECT 
	i.item_name,
	it.expiry_date
FROM store.items i
JOIN store.ITEM_TYPES it 
ON i.ITEM_TYPE  = it.ITEM_TYPE ;

--find a full name of an item type from items that cost between 8 and 18 PLM 
SELECT full_name 
FROM STORE.ITEM_TYPES 
WHERE ITEM_TYPE IN 
	(
	SELECT ITEM_TYPE 
	FROM STORE.ITEMS  
	WHERE SELLING_PRICE BETWEEN 8 AND 18
	);

--find all employees that earn more than an employee with na id = 10
SELECT * 
FROM STORE.EMPLOYEES 
WHERE salary >
	(
	SELECT salary 
	FROM STORE.EMPLOYEES 
	WHERE id = 10
	);

--find name, surname, salary for each empoyee and an avarage of all salaries 
SELECT name, 
	   surname, 
	   salary, 
	 (
	 SELECT round(AVG(salary),2) 
	 FROM STORE.EMPLOYEES
	 ) AS averege
FROM STORE.EMPLOYEES 
GROUP BY name, SURNAME, SALARY ;
	
--find all product where tax is the same as for "Chleb" (the list should exclude the "Chleb" itself)
SELECT *
FROM STORE.ITEMS 
WHERE TAX =
	(
	SELECT tax 
	FROM STORE.ITEMS 
	WHERE ITEM_NAME = 'Chleb'
	)
AND  ITEM_NAME != 'Chleb';

 --find the averege margin for all products group and order them 
 --in the alphabetical ORDER and show how many items and in the particular item's group, 
--where tax is less than 7% or the price is less than 5PLN

SELECT 
	it.full_name,
	count(i.id),
	ROUND(AVG(margin),2) 
FROM 
	STORE.ITEM_TYPES it
JOIN 
	store.ITEMS i 
ON i.ITEM_TYPE = it.ITEM_TYPE 
WHERE 
	tax > 7
	OR 
	selling_price < 5
GROUP BY FULL_NAME 
ORDER BY FULL_NAME ;


--find names, surnames and salaries of all employees who earn more or equaly as the employee with the highest ID
SELECT 
	e.NAME, 
	e.SURNAME, 
	e.SALARY
FROM 
	STORE.EMPLOYEES e
WHERE 
	SALARY >= 
	(
		SELECT salary 
		FROM STORE.EMPLOYEES 
		WHERE ID = 
				(
				SELECT MAX(id) 
				FROM STORE.EMPLOYEES e
				)
	);

--insert new records into the departments table
insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (6, 'Planowanie i zakupy', 5, 'Warszawa Ochota');

insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (7, 'HR', 1, 'Kraków');

insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (8, 'Badanie i rozwój', 12, '£odŸ');

insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (9, 'Dzia³ prawny', 18, 'Szczecin');

insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (10, 'Public relations', 20, 'Gdañsk Oliwa');

insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (11, 'Transport', 19, 'Poznañ');

insert into STORE.DEPARTMENTS (id, DEPARTMENT_NAME, MANAGER_ID, CITY)
values (12, 'Logistyka', 6, 'Zakopane');

--constraint violated, disable to update the table (employees not updated yet)
ALTER TABLE store.DEPARTMENTS disable CONSTRAINT FK_MANAGER;

--constraint violated, disable to update the table (column PESEL wrongly defined)
ALTER TABLE store.EMPLOYEES disable CONSTRAINT SYS_C008224;


--modify and update PESEL column
UPDATE STORE.EMPLOYEES 
SET PESEL = NULL ;

ALTER TABLE STORE.EMPLOYEES 
MODIFY PESEL varchar(11);

update STORE.EMPLOYEES 
set pesel = 88020512345
where id = 1;

update STORE.EMPLOYEES
set pesel = 70122012345
where id = 2;

update STORE.EMPLOYEES
set pesel = 92081612345
where id = 3;

update STORE.EMPLOYEES
set pesel = 82010112345
where id = 4;

update STORE.EMPLOYEES
set pesel = 90121212345
where id = 5;

update STORE.EMPLOYEES
set pesel = 95070815642
where id = 6;

update STORE.EMPLOYEES
set pesel = 60051274391
where id = 7;

update STORE.EMPLOYEES
set pesel = 84021659712
where id = 8;

update STORE.EMPLOYEES
set pesel = 81050242315
where id = 9;
	
update STORE.EMPLOYEES
set pesel = 58031245679
where id = 10;
	
update STORE.EMPLOYEES
set pesel = 88031269123
where id = 11;

ALTER TABLE store.EMPLOYEES enable CONSTRAINT SYS_C008224;

--add new column to the employees table
ALTER TABLE STORE.EMPLOYEES  
ADD department_id NUMBER 
REFERENCES store.departments(id);

update STORE.EMPLOYEES 
set department_id = 1
where id = 2;

update STORE.EMPLOYEES
set department_id = 2
where id = 11;

update STORE.EMPLOYEES
set department_id = 3
where id = 4;

update STORE.EMPLOYEES
set department_id = 4
where id = 3;

update STORE.EMPLOYEES
set department_id = 6
where id = 5;
	
update STORE.EMPLOYEES
set department_id = 12
where id = 1;

update STORE.EMPLOYEES
set department_id = 11
where id = 6;

update STORE.EMPLOYEES
set department_id = 10
where id = 7;

update STORE.EMPLOYEES
set department_id = 9
where id = 8;

update STORE.EMPLOYEES
set department_id = 8
where id = 9;

update STORE.EMPLOYEES
set department_id = 7
where id = 10;

--insert new records into the employees table
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id) 
values (12, 'Jacek', 'Grzyma³a', '80020366584', 'M', to_date('80/02/03','RR/MM/DD'), 7000, 2);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id)  
values (13, 'Pawe³‚', 'Kiepski', '81121225836', 'M', to_date('81/12/12','RR/MM/DD'), 3500, 5);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id) 
values (14, 'Julia', 'æwi¹ka³a', '92101548732', 'F', to_date('92/10/15','RR/MM/DD'), 2300, 5);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id) 
values (15, 'Katarzyna', 'Zebra', '98110843128', 'F', to_date('98/11/08','RR/MM/DD'), 7000, 3);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id)  
values (16, 'Przemys³aw', 'Grzyma³a', '80020314725', 'M', to_date('80/02/03','RR/MM/DD'), 9000, 12);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id)  
values (17, 'Zofia', 'Pryk', '91041516589', 'F', to_date('91/04/15','RR/MM/DD'), 4600, 1);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id) 
values (18, 'Paulina', 'Polak', '65020761975', 'F', to_date('65/02/07','RR/MM/DD'), 3540, 11);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id) 
values (19, 'Robert', 'Polewicz', '58090414763', 'M', to_date('58/09/04','RR/MM/DD'), 6500, 9);
    
Insert into store.EMPLOYEES  (ID,NAME,SURNAME,PESEL,SEX,DOB,SALARY,department_id) 
values (20, 'Józef', 'Wo³ecki', '00071313842', 'M', to_date('00/07/13','RR/MM/DD'), 2900, 9);

ALTER TABLE store.DEPARTMENTS enable CONSTRAINT FK_MANAGER;


-- new table - means of transport
CREATE TABLE means_of_transport
(
id varchar2(10) primary key,
full_name varchar2(80) not null,
min_length number,
max_length number,
min_weight number,
max_weight number,
capacity number
);

insert into means_of_transport (id, full_name, min_length, max_length, min_weight, max_weight, capacity)
values ('VAN', 'van', 3.5, 4, 1800, 2400, 1000);

insert into means_of_transport (id, full_name, min_length, max_length, min_weight, max_weight, capacity)
values ('BUS', 'bus', 3.8, 4.2, 1950, 2800, 1200);

insert into means_of_transport (id, full_name, min_length, max_length, min_weight, max_weight, capacity)
values ('CAR', 'car', 2, 3.2, 800, 1400, 600);

insert into means_of_transport (id, full_name, min_length, max_length, min_weight, max_weight, capacity)
values ('18W', '18-wheeler', 12, 20, 5000, 10000, 30000);

insert into means_of_transport (id, full_name, min_length, max_length, min_weight, max_weight, capacity)
values ('MOT', 'motor scooter', 1.65, 2.24, 300, 500, 200);
	
ALTER TABLE store.SUPPLIERS 
ADD FOREIGN KEY (transportation_code) REFERENCES means_of_transport(id);
 

-- new table - reason_of_absence	
CREATE TABLE reason_of_absence
(
ID NUMBER PRIMARY KEY,
name VARCHAR2(200) not null,
permission_needed VARCHAR2(1) DEFAULT 'N',
note VARCHAR2(1000)
);
	
insert into reason_of_absence (id, name, permission_needed, note)
values (1, 'maternity leave', 'N', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (2, 'paternity leave', 'N', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (3, 'parental leave', 'N', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (4, 'vacation', 'Y', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (5, 'unpaid extended maternity leave', 'N', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (6, 'training', 'Y', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (7, 'compassionate leave', 'Y', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (8, 'unpaid leave', 'Y', null);

insert into reason_of_absence (id, name, permission_needed, note)
values (9, 'leave at request', 'N', null);


--new table - absence
CREATE TABLE absence
(
ID NUMBER PRIMARY KEY,
employee_id NUMBER references store.employees(id),
ROA_id NUMBER references store.reason_of_absence(id),
date_from DATE,
date_to DATE
);

insert into absence (id, employee_id, ROA_id, date_from, date_to)
values (1, 11, 2, to_date('18/09/04','RR/MM/DD'), to_date('19/03/04','RR/MM/DD'));

insert into absence (id, employee_id, ROA_id, date_from, date_to)
values (2, 5, 1, to_date('17/08/12','RR/MM/DD'), to_date('18/05/04','RR/MM/DD'));

insert into absence (id, employee_id, ROA_id, date_from, date_to)
values (3, 15, 4, to_date('18/01/15','RR/MM/DD'), to_date('18/01/27','RR/MM/DD'));

insert into absence (id, employee_id, ROA_id, date_from, date_to)
values (4, 18, 4, to_date('18/02/27','RR/MM/DD'), to_date('18/03/05','RR/MM/DD'));

insert into absence (id, employee_id, ROA_id, date_from, date_to)
values (5, 15, 9, to_date('18/10/05','RR/MM/DD'), to_date('18/10/05','RR/MM/DD'));
		

-- new table - clients
CREATE TABLE clients
(
id number primary key,
name varchar2(30) not null,
surname varchar2(60) not null,
pesel varchar2(11),
postal_code varchar2(10),
city varchar2(40)
);
	
Insert into clients (id, name, surname, pesel, postal_code, city)
values (1, 'Bronis³aw', 'Foka', '72120573948', '09-400', 'P³ock');

Insert into clients (id, name, surname, pesel, postal_code, city)
values (2, 'Joanna', 'Fr¹czak', '80041146587', '09-400', 'P³ock');

Insert into clients (id, name, surname, pesel, postal_code, city)
values (3, 'Kazimiera', 'Wec³aw', '65091047612', '22-100', 'Gdansk');

Insert into clients (id, name, surname, pesel, postal_code, city)
values (4, 'Bartosz', 'Przybylski', '01101442863', '02-241', 'Warszawa');

Insert into clients (id, name, surname, pesel, postal_code, city)
values (5, 'Katarzyna', 'Fackiewicz', '85031856317', '30-006', 'Kraków');

Insert into clients (id, name, surname, pesel, postal_code, city)
values (6, 'Krzysztof', 'Jarzyna', '75110621863', '70-003', 'Szczecin');

--new table - sales_invoice 
Create table sales_invoice
(
invoice_id number primary key,
invoice_date date,
client_id number references clients(id),
net_worth number,
gross_value number,
tax number,
currency varchar2(4)
);

insert into sales_invoice (invoice_id, invoice_date, client_id, net_worth, gross_value, tax, currency)
values (1, to_date('2018-11-25', 'YYYY-MM-DD'), 5, 25, 30.75, 23, 'PLN');


-- new table - sales

CREATE TABLE sales
(
sales_id number primary key,
client_id number references clients(id),
receipt varchar2(1),
invoice varchar2(1),
invoice_id number references sales_invoice(invoice_id),
sales_date date
);
	
Insert into sales (sales_id,  client_id, receipt, invoice, invoice_id, sales_date)
values (1, 4,  'N', 'Y',  1, to_date('2018-02-04', 'YYYY-MM-DD'));
    
Insert into sales (sales_id,  client_id, receipt, invoice, invoice_id, sales_date)
values (2, 2, 'Y', 'N', null, to_date('2018-09-04', 'YYYY-MM-DD'));

Insert into sales (sales_id,  client_id, receipt, invoice, invoice_id, sales_date)
values (3, 6, 'Y', 'N', null, to_date('2018-12-04', 'YYYY-MM-DD'));

--new table - sales_items
Create table sales_orders
(
sales_id number references sales(sales_id),
order_number number,
item_id number references items(id),
amount number,
if_returned varchar2(1),
primary key (sales_id, order_number)
);



insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (1, 1, 25, 0.5, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (1, 2, 20, 1, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (1, 3, 5, 10, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (1, 4, 8, 8, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (1, 5, 7, 5, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (2, 1, 9, 2, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (3, 1, 1, 1, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (3, 2, 17, 7, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (3, 3, 22, 12, 'N');

insert into sales_orders (sales_id, order_number, item_id, amount, if_returned)
values (3, 4, 7, 6, 'N');


-- new table - units_of_measurement
CREATE TABLE units_of_measurement
	(
	id number primary key,
	item_id number references items(id),
	stock_unit varchar2(10),
	stock_unit_alt varchar2(10),
	calculator number
	);
	
	   
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (1, 1, 'szt', 'kg', 0.2);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (2, 2, 'szt', 'kg', 0.6);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (3, 3, 'kg', 'szt', 2);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (4, 4, 'kg', 'szt', 1);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (5, 5, 'szt', 'l', 1.5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (6, 5, 'szt', 'kg', 1.6);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (7, 6, 'szt', 'l', 0.2);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (8, 7, 'szt', 'l', 1.5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (9, 8, 'szt', 'l', 1.5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (10, 9, 'szt', 'l', 2);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (11, 10, 'szt', 'kg', 0.05);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (12, 11, 'szt', 'kg', 0.08);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (13, 12, 'szt', 'l', 0.5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (14, 12, 'szt', 'kg', 0.6);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (15, 13, 'szt', 'kg', 0.3);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (16, 13, 'szt', 'l', 0.25);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (17, 14, 'szt', 'l', 0.07);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (18, 15, 'szt', 'l', 0.5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (19, 16, 'szt', 'l', 0.5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (20, 17, 'szt', 'l', 0.7);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (21, 18, 'szt', 'kg', 0.35);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (22, 19, 'szt', 'kg', 1);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (23, 20, 'szt', 'kg', 1);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (24, 21, 'kg', 'szt', 5);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (25, 22, 'kg', 'szt', 4);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (26, 23, 'kg', 'szt', 6);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (27, 24, 'kg', 'szt', 8);
insert into units_of_measurement (id, item_id, stock_unit, stock_unit_alt, calculator)
values (28, 25, 'kg', 'szt', 7);


--find an avarage price of each group of product 
--and show how each item price differs from the avarage (within its item group)

SELECT 
	ITEM_NAME,
	SELLING_PRICE ,
	ABS(SELLING_PRICE - group_avarage) AS difference
FROM 
	(
	SELECT 
		ITEM_NAME,
		SELLING_PRICE ,
		ROUND(AVG(SELLING_PRICE) OVER (PARTITION BY ITEM_TYPE),2) AS group_avarage 
	FROM STORE.ITEMS 
	) ;











