--Problem 1:  Run the script

-- Problem 2

create table studentMajor(
stuNum		integer,
major		varchar2(15),
primary key(stuNum, major),
foreign key(stuNum) references student(stuNum));

-- Problem 3

drop sequence stuNumSeq;
create sequence stuNumSeq
start with 1000;

-- Problem 4

delete from student;

-- Problem 5

insert into student values(stuNumSeq.nextval, 
'Smith', 'Joe', '111-111-1111', 444);	
insert into studentMajor values(stuNumSeq.currval, 'CS');
insert into studentMajor values(stuNumSeq.currval, 'Math');
insert into student values(stuNumSeq.nextval, 
'Anders', 'Connie', '222-222-2222', 777);
insert into studentMajor values(stuNumSeq.currval, 'Eng');
insert into student values(stuNumSeq.nextval, 
'Brown', 'Buster', '333-333-3333', 777);
insert into studentMajor values(stuNumSeq.currval, 'CS');
insert into studentMajor values(stuNumSeq.currval, 'Math');
insert into student values(stuNumSeq.nextval, 
'Williams', 'Wilma', '444-444-4444', null);
insert into studentMajor values(stuNumSeq.currval, 'CS');

commit;


