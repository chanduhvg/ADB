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


create or replace procedure salGradeCursor
is
    salGradeIn salGrade.grade%type;
    loSalIn salGrade.loSal%type;
    hiSalIn salGrade.hiSal%type;
    cursor selectSalaryGradesCursor is
        select grade, loSal, hiSal
        from salGrade;
begin
    dbms_output.put_line('Salary Grade Information');
    dbms_output.put_line('+++++++++++++++++++++++++++++++++++++++++++++++');
    open selectSalaryGradesCursor;
    loop
        fetch selectSalaryGradesCursor into salGradeIn, loSalIn, hiSalIn;
        exit when selectSalaryGradesCursor%notfound;
        dbms_output.put_line('Salary grade ' || SalGradeIn || ' has a minimum salary of ' ||
            loSalIn || ' and a maximum salary of ' || hiSalIn);
    end loop;
    dbms_output.put_line('+++++++++++++++++++++++++++++++++++++++++++++++');
    dbms_output.put_line('Number of salary grades: ' || selectSalaryGradesCursor%rowcount);
    close selectSalaryGradesCursor;
end;
/
execute salGradeCursor;