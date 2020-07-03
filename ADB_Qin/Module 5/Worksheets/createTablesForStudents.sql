drop table StudentMarks CASCADE CONSTRAINTS;
drop table StudentInfo CASCADE CONSTRAINTS;

create table StudentInfo ( 
StudentNum      number primary key,
StudentLastName varchar2(45) not null,
StudentFirstName    varchar2(45) not null,
stuPhone    varchar2(42),
Grade varchar2(42)
);

create table StudentMarks (
ID_PK number PRIMARY KEY,
StudentNum  number,
Subject varchar2(50),
Marks number,
FOREIGN KEY (StudentNum) REFERENCES StudentInfo(StudentNum)
);


insert into StudentInfo values(100, 'Smith', 'Joe', '111-111-1111',null);   
insert into StudentInfo values(110, 'Anders', 'Connie', '222-222-2222',null);
insert into StudentInfo values(120, 'Brown', 'Buster', '333-333-3333',null);
insert into StudentInfo values(125, 'Williams', 'Wilma', '444-444-4444',null);

INSERT INTO StudentMarks VALUES(1,100,'.net',90);
INSERT INTO StudentMarks VALUES(2,100,'Java',80);
INSERT INTO StudentMarks VALUES(3,100,'Nodejs', 70);
INSERT INTO StudentMarks VALUES(4,100,'Java',80);
INSERT INTO StudentMarks VALUES(5,110,'.net', 80);
INSERT INTO StudentMarks VALUES(6,120,'.net', 98 );
INSERT INTO StudentMarks VALUES(7,110,'Java', 90);
INSERT INTO StudentMarks VALUES(8,125,'Nodejs', 100);
INSERT INTO StudentMarks VALUES(9,120,'Java', 90);
INSERT INTO StudentMarks VALUES(10,125,'.net', 85);
