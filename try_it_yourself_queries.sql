CREATE TABLE animals (
	id bigserial,
	animal varchar(50)
);

CREATE TABLE animal_specifics (
	id bigserial,
	animal varchar(50),
	animal_name varchar(50),
	weight numeric,
	arrival_date date
);

INSERT INTO animals (animal) VALUES
	('Lion'),
	('Elephant'),
	('Bear'),
	('Keagan'),
	('Snake'),
	('Monkey'),
	('Gorilla'),
	('Eagle'),
	('Dolphin'),
	('Honey Badger');
	
SELECT * FROM animals

INSERT INTO animal_specifics (animal, animal_name, weight, arrival_date) VALUES
	('Lion', 'Mafusa', 164, '2019-02-12'),
	('Elephant', 'Jeff', 6300, '2017-01-05'),
	('Bear', 'Fluffy', 110, '2012-09-02'),
	('Keagan', 'Dodsworth', 80, '2020-01-03'),
	('Snake', 'Spots', 1, '2019-05-15'),
	('Monkey', 'Bob', 4, '2015-04-09'),
	('Gorilla', 'Hercules', 200, '2020-05-03'),
	('Eagle', 'Hawkeye', 6, '2011-01-28'),
	('Dolphin', 'Morty', 10, '2016-12-15'),
	('Honey Badger', 'Stoffel', 3, '2011-09-04');
	
SELECT * FROM animal_specifics



CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column text
);

INSERT INTO char_data_types
VALUES
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi');
 
COPY char_data_types 
TO 'C:\Users\Y520\Documents\postgreSQL\typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');



CREATE TABLE number_data_types (
numeric_column numeric(20,5),
real_column real,
double_column double precision
);

INSERT INTO number_data_types
VALUES
	(.7, .7, .7),
	(2.13579, 2.13579, 2.13579),
	(2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;

SELECT
numeric_column * 10000000 AS "Fixed",
real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;



CREATE TABLE date_time_types (
timestamp_column timestamp with time zone,
interval_column interval
);

INSERT INTO date_time_types
VALUES
	('2018-12-31 01:00 EST','2 days'),
	('2018-12-31 01:00 -8','1 month'),
	('2018-12-31 01:00 Australia/Melbourne','1 century'),
	(now(),'1 week');
 
SELECT * FROM date_time_types;

SELECT
timestamp_column,
interval_column,
timestamp_column - interval_column AS new_date
FROM date_time_types;

--chapter 3 try it yourself
--1. real
--2.varchar(50)
--3. you will get an error

COPY imaginary_table 
TO 'C:\Users\Y520\Documents\postgreSQL\imaginary.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '#');

COPY (SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20)
TO 'C:\Users\Y520\Documents\postgreSQL\TIY.txt'
WITH (FORMAT CSV, HEADER)




