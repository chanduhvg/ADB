SET SERVEROUTPUT ON;
DROP TABLE FavRestaurent;
DROP SEQUENCE food_seq;


CREATE SEQUENCE food_seq START WITH 1;
  CREATE TABLE FavRestaurent
    (
      Restaurant_ID     NUMBER(2) PRIMARY KEY,
      Restaurant_Name   VARCHAR2(30),
      Special_Item VARCHAR2(30),
      Item_Price   DECIMAL(10,2)
    );
INSERT
INTO FavRestaurent VALUES
  (
    food_seq.nextval,
    'Gopichand',
    'poutine',
    13.86
  );
INSERT
INTO FavRestaurent VALUES
  (
    food_seq.nextval,
    'Venkateswarao',
    'pizza',
    8.56
  );
INSERT
INTO FavRestaurent VALUES
  (
    food_seq.nextval,
    'Hari krishana',
    NULL,
    0.00
  );
INSERT
INTO FavRestaurent VALUES
  (
    food_seq.nextval,
    'sambasivarao',
    'burger',
    5.23
  );
INSERT
INTO FavRestaurent VALUES
  (
    food_seq.nextval,
    'pruthvi',
    'ice cream',
    2.0
  );  

SELECT * FROM FavRestaurent;

--> 1

CREATE OR REPLACE PROCEDURE getSpecialItem(    
place VARCHAR)
IS  
spItem VARCHAR(30);
BEGIN  
SELECT Special_Item  
INTO spItem  
FROM FavRestaurent  
WHERE Restaurant_Name = place;  
dbms_output.put_line('The special item at ' || place||' is '|| spItem);
EXCEPTION
WHEN NO_DATA_FOUND THEN  
dbms_output.put_line('I do not have special items at ' || place);
END;
/

--> 2

CREATE OR REPLACE FUNCTION findAveragePrice  
RETURN NUMBER
IS  
average NUMBER;
BEGIN  
SELECT AVG(Item_Price) INTO average FROM FavRestaurent;  
RETURN average;
END;
/

--> 3

CREATE OR REPLACE PROCEDURE printAveragePrice 
IS  
BEGIN    
dbms_output.put_line('The average price value is ' || findAveragePrice);  
END;
/

--> 4

CREATE OR REPLACE FUNCTION findMaxPrice  
RETURN NUMBER
IS  
maxval NUMBER;
BEGIN  
SELECT MAX(Item_Price) INTO maxval FROM FavRestaurent;  
RETURN maxval;
END;
/

--> 5

CREATE OR REPLACE PROCEDURE printMaxPrice 
IS    
item VARCHAR2(30);  
BEGIN    
SELECT Special_Item INTO item FROM FavRestaurent WHERE Item_Price=findMaxPrice;    
dbms_output.put_line('The name of the most expensive item is ' || item ||' with price '||FINDMAXPRICE);  
END;
/

EXECUTE printAveragePrice;
EXECUTE printMaxPrice;
EXEC getSpecialItem('Gopichand');