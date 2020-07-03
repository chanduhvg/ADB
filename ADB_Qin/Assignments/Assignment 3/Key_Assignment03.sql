-- Answer - 1
-- Creating Time table:
CREATE TABLE Time
  (
    Time_ID NUMBER PRIMARY KEY,
    DAY     NUMBER,
    MONTH   NUMBER,
    Quarter NUMBER,
    YEAR    NUMBER
  );
  
-- Creating Branch table:
CREATE TABLE Branch
  (
    Branch_ID   NUMBER PRIMARY KEY,
    Branch_Name VARCHAR2(50),
    Branch_Type VARCHAR2(50)
  );
  
-- Creating Location table:
CREATE TABLE Location
  (
    Location_ID NUMBER PRIMARY KEY,
    Street      VARCHAR2(50),
    City        VARCHAR2(50),
    State       VARCHAR2(50),
    Country     VARCHAR2(50)
  );
  
-- Creating Item table:
CREATE TABLE Item
  (
    Item_ID       NUMBER PRIMARY KEY,
    Item_Name     VARCHAR2(50),
    Brand         VARCHAR2(50),
    Type          VARCHAR2(50),
    Supplier_Type VARCHAR2(50)
  );

-- Creating Sales table:
CREATE TABLE Sales
  (
    Time_ID      NUMBER,
    Branch_ID    NUMBER,
    Item_ID      NUMBER,
    Location_ID  NUMBER,   
    Units_Sold   NUMBER,
    Dollars_Sold NUMBER,
    PRIMARY KEY (Branch_ID, Time_ID, Item_ID, Location_ID),
    CONSTRAINT branch_sales_fk FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
    CONSTRAINT item_sales_fk FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID),
    CONSTRAINT location_sales_fk FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID),
    CONSTRAINT time_sales_fk FOREIGN KEY (Time_ID) REFERENCES TIME(Time_ID)
  );


-- Answer - 2
-- Inserting records into Time table:
INSERT INTO Time VALUES (122896, 28, 12, 4, 1996);
INSERT INTO Time VALUES (111019, 11, 10, 4, 2019);
INSERT INTO Time VALUES (040196, 01, 04, 2, 1996);

-- Inserting records into Branch table:
INSERT INTO Branch VALUES (978, 'Maryville Main Branch', 'Outlet');
INSERT INTO Branch VALUES (201, 'Kansas Down Town Branch', 'IStore');
INSERT INTO Branch VALUES (322, 'Anne Klein Store - Nebraska Outlets', 'Outlet');

-- Inserting records into Item table:
INSERT INTO Item VALUES (112, 'Hollister Cropped Tee', 'Hollister', 'Womens Cropped T - Shirt', 'Retailer');
INSERT INTO Item VALUES (182, 'Apple Airpods', 'Apple', 'Music Accessories', 'Electronics Wholesale Supplier');
INSERT INTO Item VALUES (997, 'Watch', 'Anne Klein', 'Ladies Accessories', 'Designer');

-- Inserting records into Location table:
INSERT INTO Location VALUES (1011, 'East Main Street', 'Maryville', 'Missouri', 'USA');
INSERT INTO Location VALUES (1012, 'Devon Street', 'Kansas City', 'Missouri', 'USA');
INSERT INTO Location VALUES (1013, 'Lincoln Street', 'Omaha', 'Nebraska', 'USA');

-- Inserting records into Sales table:
INSERT INTO Sales VALUES (122896, 201, 182, 1011, 30, 15000);
INSERT INTO Sales VALUES (111019, 322, 997, 1013, 5, 404.95);
INSERT INTO Sales VALUES (040196, 978, 112, 1012, 80, 557.6);


-- Answer - 3
/*Just like in other programming languages, in SQL also every data type has a maximum and 
minimum range. The NUMBER datatype in SQL has a min range of 38 and a max range of 38 and 
cannot be given a precission below 1 and above 30.*/

ALTER TABLE Sales
MODIFY Units_Sold NUMBER(50);

ALTER TABLE Sales
MODIFY Dollars_Sold NUMBER(38);


-- Answer - 4
UPDATE Item
SET Item_Name = 'Hat', Brand = 'Puma', Type = 'Ferrari'
WHERE Item_ID = 112;


-- Answer - 5
SELECT Branch_ID, Location_ID, Item_ID, Units_Sold, Dollars_Sold
FROM Sales
ORDER BY Item_ID desc;


-- Answer - 6
SELECT Location_ID, COUNT(Item_ID), SUM(Units_Sold), SUM(Dollars_Sold)
FROM Sales
GROUP BY Location_ID;


-- Answer - 7
COMMIT;


-- Answer - 8
SELECT * FROM Sales;
SELECT * FROM Time;
SELECT * FROM Branch;
SELECT * FROM Item;
SELECT * FROM Location;


-- Answer - 9
drop table Sales;
drop table Time;
drop table Branch;
drop table Item;
drop table Location;


-- Answer - 10
ROLLBACK;


-- Answer - 11
SELECT * FROM Sales;
SELECT * FROM Time;
SELECT * FROM Branch;
SELECT * FROM Item;
SELECT * FROM Location;


-- Answer - 12
/* Usually, when we roll back, the database restores to the previously committed state.
So, in this case, we must get the data when we try to display it in answer - 11. But, we won't!
This is because, some of the sql commands such as DDL commands (create, drop, or alter tables etc.)
cannot be rolled back. So, we get the "table or view does not exist" error when 
we tried to display the tables in answer - 11.



