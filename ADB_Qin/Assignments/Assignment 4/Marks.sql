drop table studentaddress cascade constraints;
drop table students cascade constraints;
drop table courses cascade constraints;
drop table marks cascade constraints;

-- CREATING TABLE FOR STUDENTADDRESS
CREATE TABLE STUDENTADDRESS (
ADDRESS_ID NUMBER primary key,
STREET VARCHAR2(20),
CITY VARCHAR2(20),
STATE VARCHAR(20),
ZIPCODE NUMBER NOT NULL
)

-- INSERTING INTO STUDENTADDRESS
Insert into STUDENTADDRESS values (5045,'8178 Malesuada Rd','Maryville','MO','64468');
Insert into STUDENTADDRESS values (5046,'2947 Sed Street','Redmond','WA','98053');
Insert into STUDENTADDRESS values (3069,'921 Nunc St','San Diego','CA','90003');
Insert into STUDENTADDRESS values (5067,'8241 Leo. St','Kansas City','MO','64151');
Insert into STUDENTADDRESS values (5603,'897-1720 A, Ave','Des Moines','IA','50315');
Insert into STUDENTADDRESS values (5036,'9641 Leo. St','Kansas City','MO','64151');


-- CREATING TABLE FOR STUDENTS
CREATE TABLE STUDENTS (
STUDENT_ID NUMBER primary key ,
STUDENT_NAME VARCHAR2(30),
ADDRESS_ID NUMBER,
FOREIGN KEY (ADDRESS_ID) REFERENCES STUDENTADDRESS(ADDRESS_ID)
)

-- INSSERTING VALUES INTO STUDENTS TABLE
Insert into STUDENTS values (100123,'Captain america',5045);
Insert into STUDENTS values (100456,'hawk eye',5046);
Insert into STUDENTS values (100635,'iron man',3069);
Insert into STUDENTS values (100764,'black widow',5067);
Insert into STUDENTS values (100589,'Hulk',5603);
Insert into STUDENTS values (100111,'Quick silver',5036);
Insert into STUDENTS values (100555,'Thor',5045);
Insert into STUDENTS values (100666,'Deadpool',5067);


--CREATING COURSE TABLE
CREATE TABLE COURSES(
COURSE_ID NUMBER PRIMARY KEY,
COURSE_NAME VARCHAR2(20)
)

--INSERTING VALUES INTO COURSE TABLE
Insert into COURSES values (4466,'ADB');
Insert into COURSES values (4455,'Web Aps');
Insert into COURSES values (4477,'Java');

--CREATING MARKS TABLE
CREATE TABLE MARKS (
STUDENT_ID NUMBER,
COURSE_ID NUMBER,
MARKS NUMBER,
PRIMARY KEY (STUDENT_ID, COURSE_ID),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID)
)

-- INSERTING VALUES INTO MARKS TABLE
Insert into MARKS values (100123,4466,90);
Insert into MARKS values (100123,4455,79);
Insert into MARKS values (100123,4477,90);
Insert into MARKS values (100456,4455,60);
Insert into MARKS values (100456,4477,60);
Insert into MARKS values (100456,4466,50);
Insert into MARKS values (100589,4455,50);
Insert into MARKS values (100589,4466,100);
Insert into MARKS values (100589,4477,89);
Insert into MARKS values (100635,4477,80);
Insert into MARKS values (100635,4455,80);
Insert into MARKS values (100635,4466,80);
Insert into MARKS values (100764,4466,70);
Insert into MARKS values (100764,4477,80);
Insert into MARKS values (100764,4455,80);
Insert into MARKS values (100111,4466,94);
Insert into MARKS values (100111,4477,94);
Insert into MARKS values (100111,4455,84);
Insert into MARKS values (100555,4477,90);
Insert into MARKS values (100555,4455,82);
Insert into MARKS values (100555,4466,90); 
Insert into MARKS values (100666,4477,85);
Insert into MARKS values (100666,4455,81);
Insert into MARKS values (100666,4466,91);

COMMIT;

SELECT * FROM MARKS;


