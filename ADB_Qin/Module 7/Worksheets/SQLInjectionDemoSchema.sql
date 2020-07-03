--this is a demo of sql injection

--1. create the schema and user account
--as sysdba
create user bankInfo identified by bankInfo;
grant all privileges to bankInfo;

--2. as bankInfo, create and populate the bank account tables
begin
   execute immediate 'drop table accounts';
exception
   when others then null;
end;
/
CREATE TABLE accounts (
  accountNumber varchar2(50) NOT NULL,
  active number(3) NOT NULL,
  accountName varchar2(30) NOT NULL,
  description varchar2(100) DEFAULT NULL,
  bankName varchar2(20) DEFAULT NULL,
  website varchar2(100) DEFAULT NULL,
  username varchar2(20) DEFAULT NULL,
  password varchar2(20) DEFAULT NULL,
  ownerNickname varchar2(20) DEFAULT NULL,
  notes varchar2(200) DEFAULT NULL,
  PRIMARY KEY (accountNumber),
  CONSTRAINT accountName UNIQUE  (accountName)
) ;

INSERT INTO accounts VALUES('4007',1,'Savings','Description','Bank Midwest','bankmw.com','myUser','myPassword', 'Bart', 'Notes');
INSERT INTO accounts VALUES ('10000100',1,'Checking','','Bank Midwest','bankmw.com','myUser','myPassword','Bartholomew','');
--can you add another 20 rows to this table?
-- dontknow' or 1=1--
dontknow' or 1=1 union select password from accounts--
begin
   execute immediate 'drop table categories';
exception
   when others then null;
end;
/
CREATE TABLE categories (
  name varchar2(50) NOT NULL,
  description varchar2(100) DEFAULT NULL,
  active number(3) NOT NULL,
  parentCategory varchar2(50) DEFAULT NULL,
  PRIMARY KEY (name)
 ,
  CONSTRAINT categories_ibfk_1 FOREIGN KEY (parentCategory) REFERENCES categories (name)
) ;

INSERT INTO categories VALUES ('Animals','',1,NULL);
INSERT INTO categories VALUES ('Auto','',1,NULL);
INSERT INTO categories VALUES ('Bank Charge','',1,NULL);
INSERT INTO categories VALUES ('Bank Withdrawal','',1,NULL);
INSERT INTO categories VALUES ('Beauty-Hygiene','',1,NULL);
INSERT INTO categories VALUES ('Camps','',1,NULL);
INSERT INTO categories VALUES ('Charity','',1,NULL);
INSERT INTO categories VALUES ('Clothing','',1,NULL);
INSERT INTO categories VALUES ('Communications','',1,NULL);
INSERT INTO categories VALUES ('Entertainment','',1,NULL);
INSERT INTO categories VALUES ('Farm','',1,NULL);
INSERT INTO categories VALUES ('Gifts','',1,NULL);
INSERT INTO categories VALUES ('Groceries','',1,NULL);
INSERT INTO categories VALUES ('House-Grounds','',1,NULL);
INSERT INTO categories VALUES ('Household Supplies','',1,NULL);
INSERT INTO categories VALUES ('Income - B','',1,NULL);
INSERT INTO categories VALUES ('Income - E','',0,NULL);
INSERT INTO categories VALUES ('Income - Farm','',1,NULL);
INSERT INTO categories VALUES ('Income - Interest','',1,NULL);
INSERT INTO categories VALUES ('Income - A','',1,NULL);
INSERT INTO categories VALUES ('Life Insurance','',1,NULL);
INSERT INTO categories VALUES ('Medical','',1,NULL);
INSERT INTO categories VALUES ('Non-income','',1,NULL);
INSERT INTO categories VALUES ('Office-Computer','',1,NULL);
INSERT INTO categories VALUES ('Postage','',1,NULL);
INSERT INTO categories VALUES ('Rentals','',1,NULL);
INSERT INTO categories VALUES ('School','',1,NULL);
INSERT INTO categories VALUES ('School-Kids','',0,NULL);
INSERT INTO categories VALUES ('Shoes','',1,NULL);
INSERT INTO categories VALUES ('Tax','',1,NULL);
INSERT INTO categories VALUES ('Utilities','',1,NULL);
INSERT INTO categories VALUES ('Work Expenses - Not reimbursed','',1,NULL);
INSERT INTO categories VALUES ('Work Reimbursements','',1,NULL);
INSERT INTO categories VALUES ('Bird','',1,'Animals');
INSERT INTO categories VALUES ('Cats','',1,'Animals');
INSERT INTO categories VALUES ('A','',1,'Medical');
INSERT INTO categories VALUES ('Dog','',1,'Animals');
INSERT INTO categories VALUES ('Karl','',1,'Medical');
INSERT INTO categories VALUES ('Electric','',1,'Utilities');
INSERT INTO categories VALUES ('Entertainment-Communications','Netflix, CableTV, etc.',1,'Communications');
INSERT INTO categories VALUES ('Exterior','',1,'House-Grounds');
INSERT INTO categories VALUES ('Federal','',1,'Tax');
INSERT INTO categories VALUES ('FlexPlan','Taken out of check, before taxes',1,'Medical');
INSERT INTO categories VALUES ('Fuel','',1,'Auto');
INSERT INTO categories VALUES ('Horse','',1,'Animals');
INSERT INTO categories VALUES ('Insurance - Home','',1,'House-Grounds');
INSERT INTO categories VALUES ('Insurance-Auto','',1,'Auto');
INSERT INTO categories VALUES ('Interior','',1,'House-Grounds');
INSERT INTO categories VALUES ('Internet','',1,'Communications');
INSERT INTO categories VALUES ('Just For Fun','Out on the Town',1,'Entertainment');
INSERT INTO categories VALUES ('L','',1,'Medical');
INSERT INTO categories VALUES ('Licensing','',1,'Auto');
INSERT INTO categories VALUES ('Lunch','',1,'School');
INSERT INTO categories VALUES ('Maintenance - Home','',1,'House-Grounds');
INSERT INTO categories VALUES ('Maintenance-Auto','',1,'Auto');
INSERT INTO categories VALUES ('Medicare','',1,'Tax');
INSERT INTO categories VALUES ('G','',1,'Medical');
INSERT INTO categories VALUES ('Premiums','',1,'Medical');
INSERT INTO categories VALUES ('Propane','',1,'Utilities');
INSERT INTO categories VALUES ('Property','',1,'Tax');
INSERT INTO categories VALUES ('SocSec','',1,'Tax');
INSERT INTO categories VALUES ('Telephone','',1,'Communications');
INSERT INTO categories VALUES ('Trash','',1,'Utilities');
INSERT INTO categories VALUES ('Travel','',1,'Entertainment');
INSERT INTO categories VALUES ('Water','',1,'Utilities');
INSERT INTO categories VALUES ('State','',1,'Tax');

begin
   execute immediate 'drop table documents';
exception
   when others then null;
end;
/
begin
   execute immediate 'drop table transaction_line';
exception
   when others then null;
end;
/
begin
   execute immediate 'drop table transactions';
exception
   when others then null;
end;
/
CREATE TABLE transactions (
  transID number(10) NOT NULL,
  accountNumber varchar2(50) NOT NULL,
  checkNumber varchar2(10) DEFAULT NULL,
  theDate date NOT NULL,
  toFrom varchar2(50) NOT NULL,
  bankStatus number(3) DEFAULT NULL,
  PRIMARY KEY (transID)
) ;


CREATE TABLE transaction_line (
  transID number(10) NOT NULL,
  lineNumber number(10) NOT NULL,
  categoryOrAccount varchar2(50) NOT NULL,
  description varchar2(100) DEFAULT NULL,
  amount number(9,2) DEFAULT NULL,
  transPair number(10) DEFAULT NULL,
  transLinePair number(10) DEFAULT NULL,
  PRIMARY KEY (transID,lineNumber),
  CONSTRAINT transaction_line_ibfk_1 FOREIGN KEY (transID) REFERENCES transactions (transID)
) ;


CREATE TABLE documents (
  path varchar2(100) NOT NULL,
  transID number(10) NOT NULL,
  description varchar2(100) DEFAULT NULL,
  active number(3) NOT NULL,
  PRIMARY KEY (path)
 ,
  CONSTRAINT documents_ibfk_1 FOREIGN KEY (transID) REFERENCES transactions (transID)
) ;


begin
   execute immediate 'drop table hawkeninfo';
exception
   when others then null;
end;
/
CREATE TABLE hawkeninfo (
  id number(10) NOT NULL,
  active number(3) DEFAULT NULL,
  createdByVersion number(5,2) DEFAULT NULL,
  modifiedByVersion number(5,2) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

INSERT INTO hawkeninfo VALUES (1,1,1.10,1.10);

begin
   execute immediate 'drop table scheduled_transaction_line';
exception
   when others then null;
end;
/
begin
   execute immediate 'drop table scheduled_transactions';
exception
   when others then null;
end;
/
CREATE TABLE scheduled_transactions (
  id number(10) NOT NULL,
  accountNumber varchar2(50) NOT NULL,
  nextDate date NOT NULL,
  toFrom varchar2(50) NOT NULL,
  timeInterval number(3) NOT NULL,
  frequency number(10) NOT NULL,
  PRIMARY KEY (id)
) ;


CREATE TABLE scheduled_transaction_line (
  id number(10) NOT NULL,
  lineNumber number(10) NOT NULL,
  categoryOrAccount varchar2(50) NOT NULL,
  description varchar2(100) DEFAULT NULL,
  amount number(9,2) DEFAULT NULL,
  transfer number(3) NOT NULL,
  PRIMARY KEY (id,lineNumber),
  CONSTRAINT scheduled_transaction_line_ibfk_1 FOREIGN KEY (id) REFERENCES scheduled_transactions (id)
) ;

--3. our program collects two forms of authentication (account number and username) from the user.
--the user enters these two items into the program and logs in.
--see BankDatabase.java, Login.java, and Driver.java
--and SQLInjection.docx