CREATE TABLE Employees(
	emp_id bigserial CONSTRAINT emp_key PRIMARY KEY,
	first_name varchar(50),
	surname varchar(50),
	gender char,
	address varchar(100),
	email varchar(50),
	depart_id integer REFERENCES Department (depart_id),
	role_id integer REFERENCES Roles (role_id),
	salary_id integer REFERENCES Salaries (salary_id),
	overtime_id integer REFERENCES Overtime_hours (overtime_id)
);

CREATE TABLE Department(
	depart_id bigserial CONSTRAINT depart_key PRIMARY KEY,
	depart_name varchar(25),
	depart_city varchar(25)
);

CREATE TABLE Roles(
	role_id bigserial CONSTRAINT role_key PRIMARY KEY,
	role_name varchar(80)
);


CREATE TABLE Salaries(
	salary_id bigserial CONSTRAINT salary_key PRIMARY KEY,
	salary_pa numeric(20,2)
);

CREATE TABLE Overtime_hours(
	overtime_id bigserial CONSTRAINT overtime_key PRIMARY KEY,
	overtime_hours numeric(20,1)
);

INSERT INTO Employees (first_name, surname, gender, address, email,depart_id, role_id, salary_id, overtime_id)
VALUES
 ('Christine ', 'Jaramillo', 'F', '281 Glyn St Pretoria 0160','ChristineLJaramillo@rhyta.com',1,2,5,3),
 ('Richard ', 'Leader', 'M', '4799 Ersel Street Plano, TX 75074','JasonMHines@rhyta.com',1,1,3,1),
 ('Marcia ', 'Hobby', 'F', '579 Crown St Carletonville 2517','MarciaNHobby@rhyta.com',2,4,6,8),
 ('Joyce', 'Tucker', 'F', '522 Schoeman St Moreletapark 0072','JoycePTucker@armyspy.com',3,8,10,1),
 ('Agnes ', 'Anderson', 'F', '1307 Cheriton Dr Northdene 4147','AgnesJAnderson@armyspy.com',3,9,1,6),
 ('Marvin ', 'Clements', 'M', '2095 Market St Johannesburg 2132','MarvinLClements@teleworm.us',4,12,15,8),
 ('Douglas', 'Horn', 'M', '2494 Hoog St Brakpan 1540','DouglasEHorn@armyspy.com',5,15,18,7),
 ('Wesley ', 'Phillips', 'M', '1509 Market St Johannesburg 2136','WesleyLPhillips@rhyta.com',6,17,19,7),
 ('Ivy ', 'Richardson', 'F', '4 Church St Pretoria 0145','IvyCRichardson@armyspy.com',6,18,15,18),
 ('Grant ', 'Richmond', 'M', '1881 Wolmarans St Strathavon 2196','GrantRRichmond@rhyta.com',7,19,17,1),
 ('Fred ', 'Keiser', 'M', '1030 Bodenstein St Boksburg 1446','FredMKeiser@teleworm.us',8,24,16,3),
 ('Armanda ', 'White', 'F', '1749 Prospect St Pretoria 0039','ArmandaWWhite@dayrep.com',8,23,12,2);
 
INSERT INTO Department (depart_name, depart_city)
VALUES
 ('General Management', 'Johannesburg'),
 ('Public relations', 'Johannesburg'),
 ('Purchasing', 'Johannesburg'),
 ('Human Resources', 'Johannesburg'),
 ('Operations', 'Johannesburg'),
 ('Administration', 'Johannesburg'),
 ('Marketing', 'Johannesburg'),
 ('Financial', 'Johannesburg');

INSERT INTO Roles (role_name)
VALUES
 ('Figurehead'),
 ('Spokesperson'),
 ('Disseminator'),
 --
 ('Brand Ambassador'),
 ('Chapter Relations Administrator'),
 ('Content Manager'),
 --
 ('Commodity Manager'),
 ('Buyer'),
 ('Strategic Sourcing Director'),
 --
 ('Recruiter'),
 ('HR Analyst'),
 ('HR Generalist'),
 --
 ('Chief Operating Officer '),
 ('Vice President of Operations'),
 ('Operations Manager'),
 ----
 ('Administrative Assistant'),
 ('Office admin'),
 ('Administrator manager'),
 -----
 ('Marketing coordinator'),
 ('Marketing consultant'),
 ('Marketing manager'),
 -----
 ('Accounts Assistant'),
 ('Assistant Accountant'),
 ('Auditor');
 
INSERT INTO Salaries (salary_pa)
VALUES
(100000),
(150000),
(200000),
(250000),
(300000),
(350000),
(400000),
(450000),
(500000),
(550000),
(600000),
(650000),
(700000),
(750000),
(800000),
(850000),
(900000),
(950000),
(1000000);

INSERT INTO Overtime_hours (overtime_hours)
VALUES
(0),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

SELECT 
	employees.emp_id,
	employees.first_name,
	employees.surname,
	employees.address,
	employees.email,
	Department.depart_name,
	Department.depart_city,
	Roles.role_name,
	Salaries.salary_pa,
	overtime_hours.overtime_hours
FROM Employees INNER JOIN Department
ON Employees.depart_id = Department.depart_id
INNER JOIN Roles
ON Employees.role_id = Roles.role_id
INNER JOIN Salaries
ON Employees.salary_id = Salaries.salary_id
INNER JOIN Overtime_hours
ON Employees.overtime_id = Overtime_hours.overtime_id;


	
	
	
	
	
	
	