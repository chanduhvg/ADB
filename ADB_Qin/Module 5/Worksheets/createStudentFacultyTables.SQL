drop table student;
drop table faculty;

CREATE SEQUENCE stuNumSeq START WITH 1000; 

create table faculty (
facNum		number,
facLastName	varchar2(15) not null,
facFirstName	varchar2(15) not null,
facPhone	varchar2(12),
primary key(facNum));

create table student ( 
stuNum 		number,
stuLastName	varchar2(15) not null,
stuFirstName	varchar2(15) not null,
stuPhone	varchar2(12),
facNum		number,
primary key(stuNum),
foreign key(facNum) references faculty(facNum));

create table studentMajor (
stuNum 		number,
major varchar2(15),
primary key(stuNum,major));



insert into faculty values(222, 'Anders', 'Connie', '222-222-2222');
insert into faculty values(444, 'Carson', 'Kit', 
'444-444-4444');
insert into faculty values(777, 'Thomas', 'Tina', '777-777-7777');

insert into student values(stuNumSeq.currval, 'Smith', 'Joe', '111-111-1111', 444);	
insert into studentMajor values(stuNumSeq.currval,'CS');
insert into studentMajor values(stuNumSeq.currval,'Math');
insert into student values(stuNumSeq.nextval, 'Anders', 'Connie', '222-222-2222', 777);
insert into studentMajor values(stuNumSeq.currval,'Eng');
insert into student values(stuNumSeq.nextval, 'Brown', 'Buster', '333-333-3333', 777);
insert into studentMajor values(stuNumSeq.currval,'CS');
insert into studentMajor values(stuNumSeq.currval,'Math');
insert into student values(stuNumSeq.nextval, 'Williams', 'Wilma', '444-444-4444', null);
insert into studentMajor values(stuNumSeq.currval,'CS');

commit;

SELECT * FROM student;
SELECT * FROM FACULTY;
SELECT * FROM studentMajor;
DELETE FROM student;



