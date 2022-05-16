SET SERVEROUTPUT ON ;
SET VERIFY OFF; 
drop table hospital;
create table hospital(id integer, name varchar2(2000), latitude number, longitude number, distance number);

insert into hospital values(61,'Rajshahi Medical',24.3720239,88.5842372,-1);
insert into hospital values(62,'Shanta Hospital',24.3680239,88.5742372,-1);
insert into hospital values(63,'ADD Hospital',24.3780239,88.5892372,-1);
insert into hospital values(64,'National Medical',24.3700239,88.5642372,-1);
insert into hospital values(65,'Lalbag Hospital',24.3220239,88.5442372,-1);

commit;

select * from hospital;
