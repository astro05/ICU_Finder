-- show detail only barishal ---

select h.id, h.name,i.category,d.total,d.vacancy,d.allotment
from hospital h,details d,icu_type i
where (h.id = d.hid and i.id = d.icuid)
;
set pagesize 1000;
column category format a10;
column name format a10;


------------all icu_details-----

drop view icu_details;
create or replace view icu_details as 
select * from(
              select h.id,h.name,i.category,d.total,d.vacancy,d.allotment,h.distance
              from hospital@barishal h,details@barishal d,icu_type@barishal i
              where (h.id = d.hid and i.id = d.icuid ) 
        union
              select h.id, h.name,i.category,d.total,d.vacancy,d.allotment,h.distance
              from hospital@dhaka h,details@dhaka d,icu_type@dhaka i
              where (h.id = d.hid and i.id = d.icuid ) 
		union
              select h.id, h.name,i.category,d.total,d.vacancy,d.allotment,h.distance
              from hospital@rajshahi h,details@rajshahi d,icu_type@rajshahi i
              where (h.id = d.hid and i.id = d.icuid )		
)
order by distance,vacancy desc , allotment ;
;

select * from icu_details;
/


----------view 1 all hospital_list ------------

drop view hospital_list;
create or replace view hospital_list as 
select * from(
              select h.id,h.latitude,h.longitude,h.distance
              from hospital@barishal h, details@barishal d
              where (h.id = d.hid) 
        union
              select h.id,h.latitude,h.longitude,h.distance
              from hospital@dhaka h, details@dhaka d
              where (h.id = d.hid) 
		union
              select h.id,h.latitude,h.longitude,h.distance
              from hospital@rajshahi h, details@rajshahi d
              where (h.id = d.hid) 	  
)
;

select * from hospital_list;
/


----------view 2 all hospital_list ------------
/*
drop view hospital_list;
create or replace view hospital_list as 
select * from(
              select h.id,h.latitude,h.longitude,h.distance
              from hospitals_list h;
)
;

select * from hospital_list;
/

*/

------ all hospitals_list------------
/*

drop table hospitals_list;
create table hospitals_list as 
            (
              select h.id,h.latitude,h.longitude,h.distance
              from hospital@barishal h, details@barishal d
              where (h.id = d.hid) 
        union
              select h.id,h.latitude,h.longitude,h.distance
              from hospital@dhaka h, details@dhaka d
              where (h.id = d.hid) 
)
;

select * from hospitals_list;

*/


commit;
/