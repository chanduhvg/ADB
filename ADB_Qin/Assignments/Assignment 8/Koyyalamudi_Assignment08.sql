SET SERVEROUTPUT ON;
DROP TABLE MyFoodDestination;


CREATE SEQUENCE food_seq START WITH 1;
  CREATE TABLE MyFoodDestination
    (
      Place_ID     NUMBER(2) PRIMARY KEY,
      Place_Name   VARCHAR2(30),
      Special_Dish VARCHAR2(30),
      Dish_Price   DECIMAL(10,2)
    );
INSERT
INTO MyFoodDestination VALUES
  (
    food_seq.nextval,
    'kansas city',
    'poutine',
    13.86
  );
INSERT
INTO MyFoodDestination VALUES
  (
    food_seq.nextval,
    'st louis',
    'pizza',
    8.56
  );
INSERT
INTO MyFoodDestination VALUES
  (
    food_seq.nextval,
    'st joseph',
    NULL,
    0.00
  );
INSERT
INTO MYFOODDESTINATION VALUES
  (
    food_seq.nextval,
    'new york',
    'burger',
    5.23
  );
INSERT
INTO MYFOODDESTINATION VALUES
  (
    food_seq.nextval,
    'california',
    'ice cream',
    2.0
  );  

SELECT * FROM MyFoodDestination;

--> 1

CREATE OR REPLACE PROCEDURE getSpecialDish(    
place VARCHAR)
IS  
spDish VARCHAR(30);
BEGIN  
SELECT Special_Dish  
INTO spDish  
FROM MyFoodDestination  
WHERE Place_Name = place;  
dbms_output.put_line('The special dish in ' || place||' is '|| spDish);
EXCEPTION
WHEN NO_DATA_FOUND THEN  
dbms_output.put_line('The special dish in ' || place);
END;
/

--> 2

CREATE OR REPLACE FUNCTION FindAverage  
RETURN NUMBER
IS  
average NUMBER;
BEGIN  
SELECT AVG(Dish_Price) INTO average FROM MYFOODDESTINATION;  
RETURN average;
END;
/

--> 3

CREATE OR REPLACE PROCEDURE PrintAverage  
IS  
BEGIN    
dbms_output.put_line('The average value is ' || FindAverage);  
END;
/

--> 4

CREATE OR REPLACE FUNCTION FindMax  
RETURN NUMBER
IS  
maxval NUMBER;
BEGIN  
SELECT MAX(Dish_Price) INTO maxval FROM MYFOODDESTINATION;  
RETURN maxval;
END;
/

--> 5

CREATE OR REPLACE PROCEDURE PrintMax  
IS    
dish VARCHAR2(30);  
BEGIN    
SELECT Special_Dish INTO dish FROM MYFOODDESTINATION WHERE DISH_PRICE=FindMax;    
dbms_output.put_line('The name OF the dish with maximum price IS ' || dish ||' and the price is '||FINDMAX);  
END;
/


EXECUTE PRINTAVERAGE;
EXECUTE PrintMax;
EXEC getSpecialdish('st louis');