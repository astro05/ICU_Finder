
drop table details;
create table details(hid integer, icuid integer,total integer,vacancy integer,allotment integer,distance number);

insert into details values(61,1,70,40,5,-1);
insert into details values(61,2,30,36,7,-1);
insert into details values(61,3,40,12,9,-1);
insert into details values(61,4,60,31,2,-1);

insert into details values(62,1,30,11,4,-1);
insert into details values(62,2,26,12,8,-1);
insert into details values(62,3,22,18,9,-1);
insert into details values(62,4,32,17,12,-1);

insert into details values(63,1,30,14,4,-1);
insert into details values(63,2,26,16,8,-1);
insert into details values(64,3,22,15,9,-1);
insert into details values(65,4,32,14,12,-1);

insert into details values(64,1,30,16,4,-1);
insert into details values(64,2,26,11,8,-1);
insert into details values(64,3,22,10,9,-1);
insert into details values(64,4,32,13,12,-1);

insert into details values(65,1,30,17,4,-1);
insert into details values(65,2,26,16,8,-1);
insert into details values(65,3,22,14,9,-1);
insert into details values(65,4,32,15,12,-1);

commit;

select * from details;

