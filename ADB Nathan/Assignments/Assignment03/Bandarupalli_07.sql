--1
INSERT  INTO Customer VALUES(100,'GOPICHAND','BANDARUPALLI');
INSERT  INTO Customer VALUES(101,'KRISHNA SUMANTH','KOYYALAMUDI');
INSERT  INTO Customer VALUES(102,'PRUTHVI','NASAKANTI');
INSERT  INTO Customer VALUES(103,'SWAROOP REDDY','GOTTIGUNDALA');
INSERT  INTO Customer VALUES(104,'PRASAD','GOLLA DURGA');
INSERT  INTO Customer VALUES(105,'CHANDANA PRIYA','VEMULAPALLI');

INSERT INTO POSRep VALUES(200,'SHIVA RAMA KRISHNA','VODALA');
INSERT INTO POSRep VALUES(201,'RAVITEJA','PAGIDOJU');
INSERT INTO POSRep VALUES(202,'YASHWANTH','DAMERA');
INSERT INTO POSRep VALUES(203,'ANNIE','SAMARPITHA');
INSERT INTO POSRep VALUES(204,'ALEKHYA','JADDU');
INSERT INTO POSRep VALUES(205,'SWAROOPA','TIRUMALA REDDY');

INSERT INTO Order_Table VALUES(300, TO_DATE('2020-01-01', 'YYYY-MM-DD'),'QUANTITY-2',100);
INSERT INTO Order_Table VALUES(301,TO_DATE('2020-04-01', 'YYYY-MM-DD'),'QUANTITY-5',103);
INSERT INTO Order_Table VALUES(302,TO_DATE('2020-01-04', 'YYYY-MM-DD'),'QUANTITY-3',105);


INSERT INTO Contact_Details VALUES(400,6605280001,'ABC@GMAIL.COM',101);
INSERT INTO Contact_Details VALUES(401,6605280021,'ABCD@GMAIL.COM',104);
INSERT INTO Contact_Details VALUES(402,6605280003,'ABCDE@GMAIL.COM',102);
INSERT INTO Contact_Details VALUES(403,6605280004,'ABCDEF@GMAIL.COM',103);
INSERT INTO Contact_Details VALUES(404,6605280005,'ABCDEFG@GMAIL.COM',102);
INSERT INTO Contact_Details VALUES(405,6605280006,'ABCDEFGH@GMAIL.COM',105);

INSERT INTO State VALUES(500,'MISSOURI','USA');
INSERT INTO State VALUES(501,'TEXAS','USA');
INSERT INTO State VALUES(502,'ANDHARA','INDIA');
INSERT INTO State VALUES(503,'MISSOURI','INDIA');
INSERT INTO State VALUES(504,'ILLINOIS','USA');
INSERT INTO State VALUES(505,'FLORIDA','USA');

INSERT INTO Product VALUES(600,'MOBILE','HIGH RESOLUTION',100.00);
INSERT INTO Product VALUES(601,'LAPTOP','HIGH RESOLUTION',101.00);
INSERT INTO Product VALUES(602,'PEPSI','HIGH RESOLUTION',102.00);
INSERT INTO Product VALUES(603,'PRINTER','HIGH RESOLUTION',103.00);
INSERT INTO Product VALUES(604,'DVD PLAYER','HIGH RESOLUTION',104.00);
INSERT INTO Product VALUES(605,'ALEX','HIGH RESOLUTION',105.00);
INSERT INTO Product VALUES(606,'WATCH','HIGH RESOLUTION',106.00);
INSERT INTO Product VALUES(607,'ROUTER','HIGH RESOLUTION',107.00);
INSERT INTO Product VALUES(608,'CAMERA','HIGH RESOLUTION',108.00);
INSERT INTO Product VALUES(609,'TV','HIGH RESOLUTION',109.00);

INSERT INTO POLine VALUES(700,1,1000,300,600);
INSERT INTO POLine VALUES(701,2,1001,301,601);
INSERT INTO POLine VALUES(702,3,1002,302,602);
INSERT INTO POLine VALUES(703,4,1003,301,603);
INSERT INTO POLine VALUES(704,5,1004,302,604);
INSERT INTO POLine VALUES(705,6,1005,300,605);
INSERT INTO POLine VALUES(706,7,1006,300,606);
INSERT INTO POLine VALUES(707,8,1007,301,607);
INSERT INTO POLine VALUES(708,9,1008,302,608);
INSERT INTO POLine VALUES(709,10,1009,302,609);

INSERT INTO Address VALUES(800,'NORTH',11,'MISSOURI',64468,500,100);
INSERT INTO Address VALUES(801,'WEST',12,'TEXAS',64462,501,101);
INSERT INTO Address VALUES(802,'EAST',13,'ANDHARA',64468,502,102);
INSERT INTO Address VALUES(803,'SOUTH',14,'MISSOURI',64468,503,103);
INSERT INTO Address VALUES(804,'NORTH WEST',15,'ILLINOIS',64463,504,104);
INSERT INTO Address VALUES(805,'NORTH EAST',16,'FLORIDA',64461,505,105);

--2 

SELECT orderId,SUM(totalcost) from POLine GROUP BY orderID;

--3
SELECT * FROM Customer,Contact_Details;

--4
UPDATE Product SET Price=2.50 WHERE productID=602;

--5

select Cust_FIRSTNAME,Cust_LASTNAME,mobileNumber,emailID from Customer join Contact_Details on Customer.customerID=Contact_Details.customerID;

--6
SELECT productName, price from Product 
FULL JOIN POLine ON  Product.productID = POLine.productID 
ORDER BY productName DESC;


--7
SELECT customerID FROM Address
INTERSECT
SELECT customerID FROM Customer;
--8
SELECT addr_id FROM Address
UNION
SELECT customerID FROM customer;

--9
--Cartesian
-- cross join generates  a cartesian product between the two tables, returning all possible combinations of all rows. It has no clause as each and every column will be joined to the source table and the data returned

select * from Customer,Contact_Details;



--Full Outer Join

--A full outer join is basically clubbing both left outer and right outer join. It returns all rows in both tables that match the where query and in cases where the on condition can't be satisfied for those rows it puts null values in for the unpopulated fields
select * from Customer full outer join Contact_Details on Customer.customerID = Contact_Details.CUSTOMERID;


--10a
--It is a correlated subquery

/*A correlated subquery is subquery that executes once for each row in the outer query.It will run the outer query first, and then it will run the inner subquery once
for each row returned in the outer subquery*/ 

/*For example, the following subquery will list all the product line sales in which the units
sold value is less than the average price value for that product (as opposed to the
average for all products.)
--select *
from product product1 where product1.price <
(select avg(price) 
from product product2 
where product2.productID = product1.productID);
The previous nested query will execute the inner subquery once to compute the average price
units for each product code returned by the outer query*/

--10b

--10 times.











