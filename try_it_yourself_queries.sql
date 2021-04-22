--chap 1
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

-- chap 2 

SELECT school, first_name, last_name
FROM teachers
ORDER BY school, last_name;

SELECT first_name, last_name, school, salary
FROM teachers
WHERE first_name LIKE 'S%' 
      AND salary > 40000;

SELECT last_name, first_name, school, hire_date, salary
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;

--chapter 3
--1. real
--2.varchar(50)
--3. you will get an error
CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column varchar(50)
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

-- chap 4

COPY imaginary_table 
TO 'C:\Users\Y520\Documents\postgreSQL\imaginary.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '#');
);

-- chap 5 
SELECT 3.14 * 5 ^ 2;

SELECT 3.14 * (5 ^ 2);

SELECT geo_name,
 state_us_abbreviation AS "st",
 (CAST (p0010006 AS numeric(8,1)) / p0010001) * 100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;


SELECT geo_name,
       state_us_abbreviation,
       p0010001 AS total_population,
       p0010005 AS american_indian_alaska_native_alone,
       (CAST (p0010005 AS numeric(8,1)) / p0010001) * 100
           AS percent_american_indian_alaska_native_alone
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY percent_american_indian_alaska_native_alone DESC;

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';

SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation;

--6

SELECT c2010.geo_name,
       c2010.state_us_abbreviation,
       c2000.geo_name
FROM us_counties_2010 c2010 LEFT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
WHERE c2000.geo_name IS NULL;

SELECT c2010.geo_name,
       c2000.geo_name,
       c2000.state_us_abbreviation
FROM us_counties_2010 c2010 RIGHT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
WHERE c2010.geo_name IS NULL;


SELECT median(round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 )) AS median_pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips;


SELECT percentile_cont(.5)
       WITHIN GROUP (ORDER BY round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 )) AS percentile_50th
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips;

SELECT c2010.geo_name,
       c2010.state_us_abbreviation,
       c2010.p0010001 AS pop_2010,
       c2000.p0010001 AS pop_2000,
       c2010.p0010001 - c2000.p0010001 AS raw_change,
       round( (CAST(c2010.p0010001 AS DECIMAL(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 ) AS pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
ORDER BY pct_change ASC;

--7
CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(100),
    album_title text,
    album_artist text,
    album_time interval,
    album_release_date date,
    album_genre varchar(40),
    album_description text
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text,
    song_artist text,
    album_id bigint
);

CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(100) NOT NULL,
    album_title text NOT NULL,
    album_artist text NOT NULL,
    album_release_date date,
    album_genre varchar(40),
    album_description text,
    CONSTRAINT album_id_key PRIMARY KEY (album_id),
    CONSTRAINT release_date_check CHECK (album_release_date > '1/1/1925')
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text NOT NULL,
    song_artist text NOT NULL,
    album_id bigint REFERENCES albums (album_id),
    CONSTRAINT song_id_key PRIMARY KEY (song_id)
);
----------------------------------------------------------------------------
SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
GROUP BY state_us_abbreviation;

COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20
     )
TO 'C:\Users\Y520\Documents\postgreSQL\us_counties_housing_export.txt'
WITH (FORMAT CSV, HEADER);



COPY (SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20)
TO 'C:\Users\Y520\Documents\postgreSQL\TIY.txt'
WITH (FORMAT CSV, HEADER)

--8


SELECT 
(sum(pls09.visits)-sum(pls14.visits)) AS diff
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0;

SELECT pls14.stabr,
sum(pls14.visits) AS visits_2014,
sum(pls09.visits) AS visits_2009,
round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr
ORDER BY pct_change DESC;


SELECT pls14.stabr,
sum(pls14.gpterms) AS gpterms_2014,
sum(pls09.gpterms) AS gpterms_2009,
round( (CAST(sum(pls14.gpterms) AS decimal(10,1)) - sum(pls09.gpterms))
	  /sum(pls09.gpterms) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.gpterms >= 0 AND pls09.gpterms >= 0
GROUP BY pls14.stabr
ORDER BY pct_change DESC;


SELECT pls14.obereg,
       sum(pls14.visits) AS visits_2014,
       sum(pls09.visits) AS visits_2009,
       round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
                    sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.obereg
ORDER BY pct_change DESC;


SELECT pls14.libname, pls14.city, pls14.stabr, pls14.statstru, pls14.c_admin, pls14.branlib,
       pls09.libname, pls09.city, pls09.stabr, pls09.statstru, pls09.c_admin, pls09.branlib
FROM pls_fy2014_pupld14a pls14 FULL OUTER JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.fscskey IS NULL OR pls09.fscskey IS NULL;


