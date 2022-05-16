SET SERVEROUTPUT ON ;
SET VERIFY OFF; 
drop table icu_type;
create table icu_type(id integer, category varchar2(2000));

insert into icu_type values(1,'NICU');
insert into icu_type values(2,'PICU');
insert into icu_type values(3,'CCU');
insert into icu_type values(4,'COVID');


commit;

select * from icu_type;
column category format a10;
