
drop table details;
create table details(hid integer, icuid integer,total integer,vacancy integer,allotment integer,distance number);

insert into details values(21,1,50,20,5,-1);
insert into details values(21,2,40,30,14,-1);
insert into details values(21,3,30,10,9,-1);
insert into details values(21,4,10,3,2,-1);

insert into details values(22,1,30,10,4,-1);
insert into details values(22,2,26,15,8,-1);
insert into details values(22,3,22,11,9,-1);
insert into details values(22,4,32,14,12,-1);

insert into details values(23,1,30,10,4,-1);
insert into details values(23,2,26,15,8,-1);
insert into details values(24,3,22,11,9,-1);
insert into details values(25,4,32,14,12,-1);

insert into details values(24,1,30,10,4,-1);
insert into details values(24,2,26,15,8,-1);
insert into details values(24,3,22,11,9,-1);
insert into details values(24,4,32,14,12,-1);

insert into details values(25,1,30,10,4,-1);
insert into details values(25,2,26,15,8,-1);
insert into details values(25,3,22,11,9,-1);
insert into details values(25,4,32,14,12,-1);

commit;

set pagesize 1000;
select * from details;

