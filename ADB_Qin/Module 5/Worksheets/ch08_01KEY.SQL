-- These statements are included so that we can easily re-create
-- the tables by running this script at any time.
drop table student;
drop table faculty;

-- Problem 1: Run the script

-- Problem 2:
-- For union and intersection, the order of tables makes a difference in the columns you can use.
-- For minus, the order of the tables will also make a difference in the records returned.

select stuLastName from student
union
select facLastName from faculty;

select stuLastName from student
intersect 
select facLastName from faculty;

select stuLastName from student
minus
select facLastName from faculty;

select facLastName from faculty
minus
select stuLastName from student;

-- Problem 3:
select stuNum, stuLastName, facLastName 
from faculty, student
where faculty.facNum = student.facNum;

-- Problem 4:
select stuNum, stuLastName, facLastName
from faculty right join student 
on faculty.facNum = student.facNum;

-- Problem 5:
select stuNum, stuLastName, facLastName
from faculty left join student 
on faculty.facNum = student.facNum;

-- Problem 6:
select stuNum, stuLastName, facLastName
from faculty full join student 
on faculty.facNum = student.facNum;

COMMIT;

