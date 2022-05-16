SET SERVEROUTPUT ON ;
SET VERIFY OFF; 
drop table hospital;
create table hospital(id integer, name varchar2(2000), latitude number, longitude number, distance number);

insert into hospital values(41,'Dhaka Medical',23.7252,90.3975,-1);
insert into hospital values(42,'Birdem Hospital',23.7318, 90.4061,-1);
insert into hospital values(43,'Square Hospital',23.753,90.3815,-1);
insert into hospital values(44,'Ad-Din Medical',23.7484, 90.4055,-1);
insert into hospital values(45,'Labaid Specialized Hospital',23.7419, 90.3830,-1);

commit;

select * from hospital;
