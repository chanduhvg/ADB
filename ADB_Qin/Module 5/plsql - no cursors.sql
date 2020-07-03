set serveroutput on;

drop table salGrade;

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


-- Find and print the average value of hisal in the table salGrade
create or replace procedure findAndPrintAvgHiSal
is
    averageHiSal number;
begin
    select avg(hiSal) into averageHiSal from salGrade;
    dbms_output.put_line('Average high salary is $' || averageHiSal);
end;
/
execute findAndPrintAvgHiSal;

-- Same as above, but use a function to calculate the avgHiSal, which can then be 
-- invoked by a procedure.
create or replace function avgHiSal
return number
is
    average number;
begin
    select avg(hisal) into average from salgrade;
    return average;
end;
/

-- Use this procedure to invoke the function avgHiSal and print the 
-- returned value
create or replace procedure printAvgHiSal
is
begin
    dbms_output.put_line('Average high salary is $' || avgHiSal);
end;
/

execute findandprintAvgHiSal;


SELECT * FROM student;
ALTER TABLE student ADD stufac number ;
SELECT * FROM faculty;

create procedure stufacsum(stuNum IN NUMBER,stufac OUT NUMBER)
IS
sumsf number;
BEGIN
  SELECT facNum FROM faculty WHERE facNum=stuNum;
END;  
/

EXECUTE stufacsum(111);
 
SELECT object_name from user_procedures;
  