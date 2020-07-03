--1
create table OS
(
os_id NUMBER PRIMARY KEY,
os_name varchar(20),
os_ver NUMBER
);
--Table OS created.


create table LAB
(
lab_id NUMBER PRIMARY KEY,
building Varchar(10),
room Varchar(10),
num_seats NUMBER
);
--Table LAB created.


Create Table COMPUTER
(
asset_tag NUMBER PRIMARY KEY,
os_id NUMBER REFERENCES OS(os_id),
lab_id NUMBER REFERENCES LAB(lab_id),
purchase_date varchar(15)
);
--Table COMPUTER created.

Create table SITE_LICENSE
(
lab_id NUMBER REFERENCES LAB(lab_id),
software_name varchar(10) PRIMARY KEY,
expiration_date varchar(10)
);
--Table SITE_LICENSE created.

--2

Insert INTO OS VALUES(101,'Debian Linux',10.4);
Insert INTO OS VALUES(102,'Microsoft Windows',10.0);
Insert INTO OS VALUES(103,'Andriod',11);
Insert INTO OS VALUES(104,'macOS',10.15);
Insert INTO OS VALUES(105,'Ubuntu',19.10);
Insert INTO OS VALUES(106,'Linux Mint',19.11);
Insert INTO OS VALUES(107,'Fedora',1.0);
Insert INTO OS VALUES(108,'centos',2.0);
Insert INTO OS VALUES(109,'RedHat',12.10);
Insert INTO OS VALUES(110,'SUSE',14.10);
Insert INTO OS VALUES(111,'Mageia',8.10);
Insert INTO OS VALUES(112,'Mandriva',12.10);
Insert INTO OS VALUES(113,'Arch',13.10);
Insert INTO OS VALUES(114,'Slakware Linux',11.10);
Insert INTO OS VALUES(115,'Puppy',16.10);
Insert INTO OS VALUES(116,'Tarak',13.10);
Insert INTO OS VALUES(117,'NTR',15.10);
-- All rows are inserted

Insert Into LAB  VALUES(201,'B121','R1001',60);
Insert Into LAB  VALUES(202,'B122','R1000',70);
Insert Into LAB  VALUES(203,'B123','R1003',65);

-- All rows are inserted

Insert Into COMPUTER VALUES(300,101,201,'03-MAY-2020');
Insert Into COMPUTER VALUES(301,102,202,'03-April-2020');
Insert Into COMPUTER VALUES(302,104,203,'04-JAN-2020');
Insert Into COMPUTER VALUES(303,106,201,'04-JUN-2020');
Insert Into COMPUTER VALUES(304,107,202,'04-FEB-2020');
Insert Into COMPUTER VALUES(305,109,203,'14-MARCH-2020');

-- All rows are inserted


INSERT INTO SITE_LICENSE VALUES(201,'gopi',12-02-2025);
INSERT INTO SITE_LICENSE VALUES(202,'krishna',12-03-2030);
INSERT INTO SITE_LICENSE VALUES(201,'hari',12-02-2035);
INSERT INTO SITE_LICENSE VALUES(203,'venky',12-02-2035);
INSERT INTO SITE_LICENSE VALUES(202,'pruthvi',12-02-2035);

-- All rows are inserted

--3.

ALTER TABLE LAB Modify building varchar(4);

--Table LAB altered.

--4.
UPDATE OS SET os_name= 'RHEL', os_ver= 8.2 where os_name='Debian Linux';
--1 row updated.


--5.
select building,room,purchase_date,os_name from LAB join COMPUTER on LAB.lab_id=COMPUTER.lab_id join OS on OS.os_id=COMPUTER.os_id order by building,room;

/*
BUIL ROOM       PURCHASE_DATE   OS_NAME            
---- ---------- --------------- --------------------
B121 R1001      03-MAY-2020     RHEL                
B121 R1001      04-JUN-2020     Linux Mint          
B122 R1000      04-FEB-2020     Fedora              
B122 R1000      03-April-2020   Microsoft Windows   
B123 R1003      14-MARCH-2020   RedHat              
B123 R1003      04-JAN-2020     macOS   
*/

--6.
Select LAB.lab_id,count(*) from LAB,COMPUTER where LAB.lab_id=COMPUTER.lab_id GROUP BY LAB.lab_id;
/*
      LAB_ID   COUNT(*)
---------- ----------
       201          2
       202          2
       203          2
*/

--7.
Commit;

-- commit complete

--8.
  
  Select * from OS;
/*
OS_ID OS_NAME                  OS_VER
---------- -------------------- ----------
       101 RHEL                        8.2
       102 Microsoft Windows            10
       103 Andriod                      11
       104 macOS                     10.15
       105 Ubuntu                     19.1
       106 Linux Mint                19.11
       107 Fedora                        1
       108 centos                        2
       109 RedHat                     12.1
       110 SUSE                       14.1
       111 Mageia                      8.1

     OS_ID OS_NAME                  OS_VER
---------- -------------------- ----------
       112 Mandriva                   12.1
       113 Arch                       13.1
       114 Slakware Linux             11.1
       115 Puppy                      16.1
       116 Tarak                      13.1
       117 NTR                        15.1
*/
  Select * from LAB;
/*
    LAB_ID BUIL ROOM        NUM_SEATS
---------- ---- ---------- ----------
       201 B121 R1001              60
       202 B122 R1000              70
       203 B123 R1003              65
*/
  Select * from COMPUTER;
/*
   ASSET_TAG        OS_ID    LAB_ID PURCHASE_DATE 
---------- ---------- ---------- ---------------
       300        101        201     03-MAY-2020    
       301        102        202     03-April-2020  
       302        104        203     04-JAN-2020    
       303        106        201     04-JUN-2020    
       304        107        202     04-FEB-2020    
       305        109        203     14-MARCH-2020  
*/
  Select * from SITE_LICENSE;
/*
    LAB_ID SOFTWARE_N EXPIRATION
---------- ---------- ----------
       201 gopi       -2015     
       202 krishna    -2021     
       201 hari       -2025     
       203 venky      -2025     
       202 pruthvi    -2025    
*/
  
--9.
  DROP TABLE SITE_LICENSE;
--Table SITE_LICENSE dropped.

  DROP TABLE COMPUTER;
-- Table COMPUTER dropped.

  DROP TABLE LAB;
--Table LAB dropped.

  DROP TABLE OS;
--Table OS dropped.
/*
ANSWER
SQL Server does not allow you to delete a table that is referenced by a foreign constraint. To delete this table, you must drop the referencing foreign key constraint or referencing table first. In this case, you have to drop the foreign key constraint in the  COMPUTER table or the  SITE_LICENSE table first before removing the LAB and OS table.
*/
--10
ROLLBACK;

--Rollback complete.

--11. 
  Select * from OS;
  Select * from LAB;
  Select * from COMPUTER;
  Select * from SITE_LICENSE;

--ANSWER 12.
/* Usually, when we roll back, the database restores to the previously committed state.
So, in this case, we must get the data when we try to display it in answer - 11. But, we won't!
This is because, some of the sql commands such as DDL commands (create, drop, or alter tables etc.)
cannot be rolled back. So, we get the "table or view does not exist" error when 
we tried to display the tables in answer - 11.*/

