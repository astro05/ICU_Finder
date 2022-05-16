SET SERVEROUTPUT ON ;
SET VERIFY OFF; 
drop table hospital;
create table hospital(id integer, name varchar2(2000), latitude number, longitude number,distance number);

insert into hospital values(21,'Barishal Medical',22.6860803,90.3611367,-1);
insert into hospital values(22,'Islami Bank Hospital',22.6892059,90.3672266,-1);
insert into hospital values(23,'Razzak Memorial Clinic',22.703181,90.3444181,-1);
insert into hospital values(24,'South Bangla Appolo Hospital',22.6974245,90.3514629,-1);
insert into hospital values(25,'Sheba Clinic',22.6951987,90.3615748,-1);

commit;

select * from hospital;