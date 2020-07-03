drop table Customer cascade constraints;
drop table POSrep cascade constraints;
drop table Order_Table cascade constraints;
drop table Contact_Details  cascade constraints;
drop table State cascade constraints;
drop table Product  cascade constraints;
drop table POLine  cascade constraints;
drop table Address  cascade constraints;

Create table POSRep
(repID number PRIMARY KEY,
rep_LASTNAME varchar2(40),
rep_FIRSTNAME varchar2(40));

Create table Customer
(customerID number PRIMARY KEY,
Cust_LASTNAME varchar2(40),
Cust_FIRSTNAME varchar2(40));

Create table Order_Table
(orderID number PRIMARY KEY,
dateOfOrder date NOT NULL,
description varchar2(40),
customerID number references customer(customerID)
);

Create table Contact_Details
(contactID number PRIMARY KEY,
mobileNumber number,
emailID varchar2(25),
customerID number references customer(customerID)
);


create table State
(stateID number PRIMARY KEY,
state_name varchar2(30),
country varchar2(20)
);

create table Product
(productID number PRIMARY KEY,
productName varchar2(40),
description varchar2(40),
price number(5,2)
);

create table POLine
(lineID number PRIMARY KEY,
quantity number DEFAULT 1,
totalCost number,
orderID number references order_table(orderID),
productID number references product(productID)
);

create table Address
(addr_id number PRIMARY KEY,
street varchar2(30),
buildingNumber number,
city varchar2(40),
zipCode number NOT NULL,
stateID number References state(stateID),
customerID number References customer(customerID)
);
