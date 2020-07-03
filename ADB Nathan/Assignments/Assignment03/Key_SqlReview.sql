- Question 1: creating tables
CREATE TABLE lab
(
  lab_id NUMBER PRIMARY KEY,
  building VARCHAR(20),
  room NUMBER,
  num_seats NUMBER
);

create table site_license
(
  lab_id NUMBER,
  software_name VARCHAR(20),
  expiration_date DATE,
  PRIMARY KEY (lab_id, software_name),
  CONSTRAINT lab_id_fk FOREIGN KEY (lab_id) REFERENCES lab(lab_id)
);

create table os
(
  os_id NUMBER PRIMARY KEY,
  os_name VARCHAR(20),
  os_ver NUMBER
);

create table computer
(
  asset_tag NUMBER PRIMARY KEY,
  os_id NUMBER,
  lab_id NUMBER,
  purchase_date DATE,
  CONSTRAINT os_comp_fk FOREIGN KEY (os_id) REFERENCES os(os_id),
  CONSTRAINT lab_comp_fk FOREIGN KEY (lab_id) REFERENCES lab(lab_id)
);

-- Q2
INSERT INTO os VALUES (1, 'Debian Linux', 10.4);
INSERT INTO os VALUES (2, 'MS Windows', 1903);
INSERT INTO os VALUES (3, 'MacOS', 10.1);

INSERT INTO lab VALUES (1, 'CH', 1400, 30);
INSERT INTO lab VALUES (2, 'CH', 1350, 25);
INSERT INTO lab VALUES (3, 'GS', 1100, 20);

INSERT INTO site_license VALUES (1, 'Adobe CC', '30-JUN-20');
INSERT INTO site_license VALUES (1, 'Oracle 12e', '20-JUN-21');
INSERT INTO site_license VALUES (3, 'Matlab', '30-Nov-20');

INSERT INTO computer VALUES (1, 3, 1, '01-JUN-18');
INSERT INTO computer VALUES (2, 3, 1, '01-JUN-18');
INSERT INTO computer VALUES (3, 2, 2, '01-JUN-19');
INSERT INTO computer VALUES (4, 2, 2, '01-JUN-19');
INSERT INTO computer VALUES (5, 1, 3, '01-JUN-17');
INSERT INTO computer VALUES (6, 1, 3, '01-JUN-17');

-- Q3
ALTER TABLE lab MODIFY building VARCHAR(4);

-- Q4
UPDATE os SET os_name='RHEL', os_ver=8.2 WHERE os_id=1;

-- Q5
SELECT building, room, purchase_date, os_name 
FROM lab, computer, os 
WHERE lab.lab_id = computer.lab_id AND computer.os_id = os.os_id
ORDER BY building, room ASC;

-- Q6
SELECT building, room, COUNT(asset_tag) 
FROM lab,computer WHERE lab.lab_id = computer.lab_id
GROUP BY building, room;

-- Q7
commit;

-- Q8
select * from lab;
select * from site_license;
select * from computer;
select * from os;

-- Q9
drop table computer;
drop table os;
drop table site_license;
drop table lab;
/* constraints mean that we cannot drop the tables in any order; they must respect the FK constraints and ref. integrity */
-- Q10
rollback;

-- Q11
select * from lab;
select * from site_license;
select * from computer;
select * from os;

-- Q12

/* Functions that alter (like DROP TABLE) the structure of the database cannot be rolled back;
Specifically they perform a commit before and after each command.
We get an error because we have destroyed the data in the database, and it can't be
recovered through a rollback*/