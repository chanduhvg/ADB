drop table patient;
drop table physician;

create table physician
(
  physicianID     number,
  phyLastName        varchar2(15),
  phyFirstName       varchar2(15),
  dateOfPractice  date,
  primary key(physicianID));

create table patient
(
  patientID        varchar2(4),
  patLastName         varchar2(15),
  patFirstName        varchar2(15),
  primaryPhysician  number,
  primary key (patientID),
  foreign key (primaryPhysician) 
  references physician (physicianID));
  
insert into physician values
(111, 'Jones', 'Anna', to_date('01/15/1988', 'MM/DD/YYYY'));
insert into physician values
(222, 'Nichols', 'Janeth', to_date('03/17/2008', 'MM/DD/YYYY'));
insert into physician values
(333, 'Morrow', 'Daniel', to_date('12/01/2000', 'MM/DD/YYYY'));
insert into physician values
(444, 'Blair', 'Scott', to_date('10/10/1995', 'MM/DD/YYYY'));

insert into patient values
('1234', 'Bolton', 'Gary', 111);
insert into patient values
('9876', 'Athen', 'Janet', 444);
insert into patient values
('2345', 'Bradley', 'Bill', 222);
insert into patient values
('8765', 'Sharp', 'Becky', 222);
insert into patient values
('3456', 'Thomas', 'Doug', 222);
insert into patient values
('7654', 'Nash', 'Veda', 111);


commit;

SELECT * FROM patient;
SELECT * FROM physician;