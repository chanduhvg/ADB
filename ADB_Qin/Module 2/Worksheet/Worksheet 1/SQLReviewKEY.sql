-- Problem 2
select custName, address, currBal
from customer
order by currBal desc;

-- Problem 3
select repNum, count(custNumber)
from customer
group by repNum;

-- Problem 4
select warehouseNum, count(partNum)
from part
group by warehouseNum;

-- Problem 5
select warehouseNum, sum(unitsOnHand)
from part 
group by warehouseNum;

-- Problem 6
select warehouseNum, count(partNum)
from part
group by warehouseNum
having count(partNum) > 2;

-- Problem 7
select custName, repName
from customer, slsrep
where customer.repNum = slsrep.repNum;

-- Problem 8
select custName
from customer
where custName like '%a%';

-- Problem 9
select custName
from customer
where custName like '%a%s';

-- Problem 10
select orderNum, customer.custName, slsrep.repName
from customer, slsrep, custorder
where custorder.custNumber = customer.custNumber
and customer.repNum = slsrep.repNum; 

-- for problems 11-13, see the script used to create and fill
-- the tables

-- Problem 14
delete from orderline
where partNum = 'cx11';

-- Problem 15
rollback;


