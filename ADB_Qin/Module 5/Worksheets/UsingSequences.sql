drop sequence phyID_seq;

create sequence phyID_seq start with 1000;

insert into physician values (phyID_seq.nextval, 'Andrews', 'Alice', '10-MAR-12');

insert into patient values('8901', 'Williams', 'Betty', phyID_seq.currval);