-- drop objects
drop sequence salGradeInsertAuditIDSeq;
drop sequence salGradeUpdateAuditIDSeq;
drop trigger salgradeinsert;
drop trigger salgradeupdate;
drop table salGradeInsertAudit;
drop table salGradeUpdateAudit;
drop table salGrade;

-- create salGrade table and fill with data
create table salGrade (
    grade number,
    losal number,
    hisal number,
    primary key (grade));
     
insert into salGrade values (1, 700, 1200);
insert into salGrade values (2, 1201, 1400);
insert into salGrade values (3, 1401, 2000);
insert into salGrade values (4, 2001, 3000);
insert into salGrade values (5, 3001, 9999);
 
-- create audit table to show when new data is inserted
-- into salGrade
create table salGradeInsertAudit
(salGradeInsertAuditID number(3),
dateOfInsert date,
insertingUser varchar2(10),
primary key (salGradeInsertAuditID));
 
-- create a sequence to generate id values for the audit table
create sequence salGradeInsertAuditIDSeq start with 1;
 
-- create a trigger to insert an entry into the audit table 
-- whenever a new row is inserted into salGrade;
create or replace trigger salGradeInsert
  before insert on salGrade
begin
  insert into salGradeInsertAudit values
    (salGradeInsertAuditIDSeq.nextval, sysdate, user);
end;
/
 
-- test the trigger by inserting a new value into salGrade
-- then displaying the values in salGrade and in the audit table
insert into salGrade values (6, 10000, 20000);
 
select * from salGrade;
select * from salGradeInsertAudit;
 
-- create audit table to show when rows in salGrade are updated;
create table salGradeUpdateAudit(
salGradeUpdateAuditID number(3),
dateOfUndate date,
updatingUser varchar2(10),
PKOfRowUpdated number,
oldLoSal number,
newLoSal number,
oldHiSal number,
newHiSal number,
primary key (salGradeUpdateAuditID),
foreign key (PKOFRowUpdated) references salGrade(grade));
 
-- create a sequence to generate id values for the audit table
create sequence salGradeUpdateAuditIDSeq start with 1;
 
-- create a trigger to insert an entry into the audit table 
-- whenever a row in salGrade is updated;
create or replace trigger salGradeUpdate
  before update on salGrade
  for each row
begin
  insert into salGradeUpdateAudit values
    (salGradeUpdateAuditIDSeq.nextval, sysdate, user, :old.grade, :old.loSal, 
        :new.loSal, :old.hiSal, :new.hiSal);
end;
/
 
-- test trigger
select * from salGrade;
 
update salGrade 
set loSal = loSal + 100,
hiSal = hiSal + 100;
 
select * from salGrade;
select * from salGradeUpdateAudit;

