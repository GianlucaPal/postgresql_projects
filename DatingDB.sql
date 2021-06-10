CREATE TABLE profession (
	prof_id bigserial CONSTRAINT prof_id_key PRIMARY KEY,
	profession varchar (50) CONSTRAINT profession_unique UNIQUE
);


CREATE TABLE zip_code (
	zip_code varchar(4) CONSTRAINT zip_code_key PRIMARY KEY,
	city varchar (50),
	province varchar (50),
	CONSTRAINT chk_zip_code CHECK (LENGTH(zip_code)= 4)
);

CREATE TABLE status(
	status_id bigserial CONSTRAINT status_id_key PRIMARY KEY,
	status varchar (50)
);




CREATE TABLE my_contacts(
	contact_id bigserial CONSTRAINT contact_id_key PRIMARY KEY,
	last_name varchar(50),
	first_name varchar(50),
	phone varchar(12),
	email varchar(50),
	gender char,
	birthday date,
	prof_id integer REFERENCES profession (prof_id),
	zip_code varchar(4) REFERENCES zip_code (zip_code),
	status_id integer REFERENCES status (status_id)
);

CREATE TABLE Contact_Interest(
    contact_id integer REFERENCES My_Contacts (contact_id),
    interest_id integer REFERENCES Interests (interest_id));

CREATE TABLE Contact_seeking(
    contact_id integer REFERENCES My_Contacts (contact_id),
    seeking_id integer REFERENCES Seeking (seeking_id));

CREATE TABLE Interests (
    interest_id bigserial CONSTRAINT interest_key PRIMARY KEY,
    interest varchar(50));

CREATE TABLE Seeking(
    seeking_id bigserial CONSTRAINT seeking_key PRIMARY KEY,
    seeking varchar(50));

DROP TABLE Interests CASCADE;
DROP TABLE Seeking CASCADE;
DROP TABLE Contact_seeking CASCADE;
DROP TABLE Contact_Interest CASCADE;


INSERT INTO profession (profession)
VALUES 
('Zoologist'),
('Writer'),
('Wind Energy Engineer	'),
('Web Developer'),
('Waiter'),
('Visual Designer'),
('Veterinarian'),
('Urban Design'),
('Tutor'),
('Truck Driver'),
('Transportation Engineer'),
('Translator'),
('Tour Guide'),
('Testing Engineer'),
('Technology Architect'),
('Technician'),
('Technical Writer'),
('Technical Support'),
('Teacher'),
('Tailor'),
('Systems Analyst'),
('System Administrator'),
('Surveyor'),
('Surgeon'),
('Supervisor'),
('Stonemason'),
('Steel Worker'),
('Statistician'),
('Space Scientist'),
('Solar Energy Technician'),
('Software Developer'),
('Sociologist'),
('Software Architect'),
('Social Worker'),
('Small Business Owner'),
('Shop Salesperson'),
('Service Manager'),
('Service Attendant'),
('Scientist'),
('Salesperson'),
('Sales Manager'),
('Sales Engineer'),
('Robotics Engineer'),
('Rigger'),
('Restaurant Manager'),
('Miner'),
('Actor'),
('Accountant'),
('Agent'),
('Baker'),
('Civil Engineer');

INSERT INTO zip_code (zip_code, city , province)
VALUES 
('5284', 'East London', 'Eastern Cape' ),
('4821', 'Flagstaff', 'Eastern Cape' ),
('9780', 'Ga-Rapulana', 'Free State' ),
('9310', 'Bloemfontein', 'Free State' ),
('2508', 'Carletonville', 'Gauteng' ),
('1548', 'Brakpan', 'Gauteng' ),
('3978', 'Kwangkwanase', 'KwaZulu-Natal' ),
('4158', 'Phoenix', 'KwaZulu-Natal' ),
('1391', 'Phalaborwa', 'Limpopo' ),
('0784', 'Seshego', 'Limpopo' ),
('1301', 'Belfast', 'Mpumalanga' ),
('2211', 'Sundra', 'Mpumalanga' ),
('2571', 'Klerksdorp', 'North West' ),
('0313', 'Rustenburg', 'North West' ),
('8445', 'Postmasburg', 'Norhtern Cape' ),
('8253', 'Kamieskroon', 'Norhtern Cape' ),
('8201', 'Bitterfontein', 'Western Cape' ),
('7974', 'Cape Town', 'Western Cape' );

INSERT INTO status (status)
VALUES 
('Unspecified'),
('Single'),
('In a relationship'),
('Engaged'),
('Married'),
('In an open relationship'),
('Widowed'),
('Separated'),
('Divorced');

INSERT INTO my_contacts (last_name, first_name, phone, email, gender,birthday, prof_id, zip_code, status_id)
VALUES
('Barnes', 'Josephine', '084 611 2619', 'JosephineJBarnes@armyspy.com', 'F','1960-09-25',50, '9310',6 ),
('Tyler ', 'Jones', '082 108 2846', 'TylerDJones@jourrapide.com', 'M','1960-12-07',11, '4821',5 ),
('Rogers', 'Jeanne ', '084 801 1740', 'JeanneDRogers@jourrapide.com', 'F','1963-05-23',32, '8253',3 ),
('Schreiner', 'Hugh', '082 916 8685', 'HughKSchreiner@armyspy.com', 'M','1963-11-03',25, '1391', 9),
('Frost', 'Dorothy ', '084 767 5512', 'DorothyVFrost@armyspy.com', 'F','1964-03-23',3, '9780', 7),
('Palafox', 'Rodger ', '085 249 5508', 'RodgerLPalafox@teleworm.com', 'M','1966-10-01',36, '2508', 9),
('Angelier', 'Campbell ', '082 892 2883', 'CampbellLAngelier@teleworm.com', 'M','1967-12-18',43, '3978', 8),
('Duranseau', 'Elita', '084 226 7058', 'ElitaDuranseau@dayrep.com', 'F','1970-12-28',20, '7974', 3),
('Rochefort', 'Comforte', '082 522 4741', 'ComforteRochefort@jourrapide.com', 'F','1972-10-06',28, '4821', 2),
('Compagnon', 'David ', '083 811 4872', 'DavidCompagnon@armyspy.com', 'M','1976-04-27',13, '1301', 4),
('Barteaux', 'Legget ', '083 729 5677', 'LeggetBarteaux@rhyta.com', 'M','1977-11-28',34, '8445', 8),
('Déziel', 'Harbin ', '085 318 8615', 'HarbinDeziel@dayrep.com', 'M','1981-02-01',7, '5284', 6),
('Bourque', 'Robert ', '083 522 2832', 'RobertBourque@rhyta.com', 'M','1982-02-04',44, '8445', 6),
('Busque', 'Édouardo ', '085 898 3748', 'EdouardBusque@jourrapide.com', 'M','1982-03-05',25, '4158', 5),
('Bisson', 'Xavier ', '085 177 1446', 'XavierBisson@dayrep.com', 'M','1983-08-08',21, '9310', 8),
('Blais', 'Nicholas ', '085 631 0833', 'NicholasBlais@dayrep.com', 'M','1988-02-07',33, '9780', 7),
('Bériault', 'Noël ', '082 710 7787', 'NoelBeriault@rhyta.com', 'M','1988-03-14',26, '2211', 2),
('Masson', 'Théodore ', '085 543 8478', 'TheodoreMasson@rhyta.com', 'M','1991-12-18',10, '2508', 2),
('Godin', 'Alfred ', '082 599 3864', 'AlfredGodin@jourrapide.com', 'M','1995-03-29',18, '5284', 2),
('Narcisse', 'Ninette ', '084 746 9061', 'NinetteNarcisse@jourrapide.com', 'F','1999-10-24',14, '4158', 2),
('Bellemare', 'Angelique ', '083 250 5296', 'AngeliqueBellemare@teleworm.us', 'F','2001-06-01',6, '1548', 2);

INSERT INTO seeking (seeking)
VALUES 
('Male'),
('Female');

INSERT INTO interests (interest)
VALUES 
('Board games'),
('Bodybuilding'),
('Chess'),
('Gambling'),
('Golf'),
('Investing'),
('Martial arts'),
('Meditation'),
('Mountain biking'),
('Parachuting'),
('Running/Jogging'),
('Singing'),
('Acting'),
('Crafts'),
('Dancing'),
('Musical instrument'),
('Origami'),
('Painting'),
('Photography'),
('Pottery'),
('Reading'),
('Jigsaw puzzles'),
('Tennis'),
('Archery'),
('Backgammon'),
('Basketball'),
('Car restoration'),
('Cooking'),
('Landscaping'),
('Lego building'),
('Robotics'),
('Skydiving'),
('Swimming'),
('Yoga'),
('Football'),
('Mountain climbing'),
('Paragliding'),
('Rock climbing'),
('Coding'),
('Drawing'),
('Fishing'),
('Hunting'),
('Video games'),
('Cycling'),
('Hiking'),
('Travelling'),
('Surfing'),
('Amateur astronomy'),
('Marathon running'),
('Sailing');

INSERT INTO contact_interest (contact_id, interest_id)
VALUES
(1,30),
(1,45),
(2,23),
(2,38),
(3,31),
(3,39),
(4,44),
(4,7),
(5,2),
(5,11),
(6,36),
(6,28),
(7,20),
(7,14),
(8,34),
(8,35),
(9,18),
(9,37),
(10,42),
(10,47),
(11,30),
(11,18),
(12,3),
(12,26),
(13,8),
(13,50),
(14,29),
(14,44),
(15,32),
(15,49),
(16,20),
(16,41),
(17,48),
(17,16),
(18,11),
(18,34),
(19,35),
(19,22),
(20,36),
(20,43),
(21,37),
(21,48);

INSERT INTO contact_seeking(contact_id,seeking_id)
VALUES 
(1,1),
(2,2),
(3,1),
(4,2),
(5,1),
(6,2),
(7,2),
(8,1),
(9,1),
(10,2),
(11,2),
(12,2),
(13,2),
(14,2),
(15,2),
(16,2),
(17,2),
(18,1),
(19,1),
(20,2),
(21,2);

SELECT 
	my_contacts.contact_id,
	my_contacts.last_name,
	my_contacts.first_name,
	my_contacts.phone,
	my_contacts.email,
	my_contacts.gender,
	my_contacts.birthday,
	profession.profession,
	zip_code.city,
	zip_code.province,
	status.status,
	interests.interest,
	seeking.seeking
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT JOIN contact_seeking 
ON my_contacts.contact_id = contact_seeking.contact_id
LEFT JOIN interests
ON interests.interest_id = contact_interest.interest_id
LEFT JOIN seeking
ON seeking.seeking_id = contact_seeking.seeking_id
LEFT JOIN profession
ON profession.prof_id = my_contacts.prof_id
LEFT JOIN zip_code
ON zip_code.zip_code = my_contacts.zip_code
LEFT JOIN status
ON status.status_id = my_contacts.status_id
	
