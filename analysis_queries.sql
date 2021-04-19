CREATE TABLE teachers (
 id bigserial,
 first_name varchar(25),
 last_name varchar(50),
 school varchar(50),
 hire_date date,
 salary numeric
);

SELECT first_name, last_name FROM teachers;

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
 ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
 ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
 ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
 ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
 ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
 
SELECT * FROM teachers;

INSERT INTO teachers (first_name, last_name, school, hire_date, salary) 
VALUES('Gianluca', 'Palmarozza', 'Jeppe HS for boys', '2020-04-19', 100000),
	('Keagan', 'Dodsworth', 'Jeppe HS for boys', '2020-02-01', 100),
	('Fabio', 'Pita', 'Jeppe HS for boys', '2022-06-08', 2);
	
SELECT last_name, first_name, salary FROM teachers;

SELECT DISTINCT school FROM teachers;

SELECT first_name, last_name, salary FROM teachers ORDER BY salary DESC;

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

Select * FROM teachers
WHERE first_name = 'Lee'

SELECT *
FROM teachers
WHERE salary >= 50 AND salary <=70000
ORDER BY salary ASC;

SELECT first_name, last_name
FROM teachers
WHERE last_name LIKE '_mith';

SELECT first_name, last_name
FROM teachers
WHERE last_name LIKE '%a';

SELECT *
FROM teachers
ORDER BY school , first_name;

SELECT first_name, last_name
FROM teachers
WHERE first_name LIKE 'S%' AND salary >= 40000;

SELECT * 
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;
