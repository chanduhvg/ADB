--1
select e.FIRST_NAME,e.LAST_NAME,d.department_name,l.city,l.state_province FROM employees e,departments d,locations l 
where e.department_id = d.department_id and d.location_id=l.location_id;

--2
select e.first_name as emp_fname,e.last_name as emp_lname,
m.first_name as man_fname,m.last_name as man_lname
from employees e,employees m where e.manager_id=m.employee_id ;

--3
select e.first_name as emp_fname,m.first_name as man_fname
from employees e left join employees m on e.manager_id=m.employee_id ;

--4
select e.first_name || e.last_name as emp_name,job_title, j.max_salary-e.salary as salary_difference
from employees e,jobs j where e.job_id = j.job_id;

--5
select d.department_id, d.department_name,count(e.employee_id) Noofemployees
from employees e,departments d where e.department_id=d.department_id
group by d.department_id, d.department_name order by department_id asc ;

--6
select d.department_id, d.department_name,SUM(e.salary) TotalSalary
from employees e,departments d where e.department_id=d.department_id
group by d.department_id, d.department_name order by department_id asc;

--7
select e.first_name || e.last_name as emp_name,j.job_title,salary as salary
from employees e,jobs j where e.job_id = j.job_id 
and salary in (select max(salary) from employees);

--8
select e.first_name || e.last_name as emp_name,j.job_title,salary
from employees e,jobs j where e.job_id = j.job_id 
and salary in (select min(salary) from employees);

--9
--> Correlated subquery relies on the external query and can not be done in isolation, but a non-correlated subquery or subquery does not rely on the external query and can be done by itself.
--> Non-Correlated Subquery: The internal query "select max(salary) from employees" below is not contingent on the external query it executes on its own, and only once.
-->       Ex: select fees from students S where fees in (select max(fees) from students);
--> Correlated Subquery: The inner query below depends on the value of the outer query salary "e1.salary" and runs several times within the inner query depending on the value of e2.salary to meet its minimum value and then retrieve the value from the database.
-->       Ex : select fees from students S1 where low = (select count(fees) from students S2 where S2.salary < S1.salary);

--10
--> UNION ALL is the same as UNION operator, except that UNION ALL selects all columns and does not delete duplicate rows-->  While using Union, The selected columns need to be of the same data type. With UNION, only distinct values are selected.

--11
--> A cross join generates  a cartesian product between the two tables, returning all possible combinations of all rows. It has no clause as each and every column will be joined to the source table and the data returned.
--> A full outer join is basically clubbing both left outer and right outer join. It returns all rows in both tables that match the where query and in cases where the on condition can't be satisfied for those rows it puts null values in for the unpopulated fields.