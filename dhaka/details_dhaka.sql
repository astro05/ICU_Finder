
drop table details;
create table details(hid integer, icuid integer,total integer,vacancy integer,allotment integer,distance number);

insert into details values(41,1,50,20,5,-1);
insert into details values(41,2,40,30,7,-1);
insert into details values(41,3,30,10,9,-1);
insert into details values(41,4,10,3,2,-1);

insert into details values(42,1,30,10,4,-1);
insert into details values(42,2,26,15,8,-1);
insert into details values(42,3,22,11,9,-1);
insert into details values(42,4,32,14,12,-1);

insert into details values(43,1,30,10,4,-1);
insert into details values(43,2,26,15,8,-1);
insert into details values(44,3,22,11,9,-1);
insert into details values(45,4,32,14,12,-1);

insert into details values(44,1,30,10,4,-1);
insert into details values(44,2,26,15,8,-1);
insert into details values(44,3,22,11,9,-1);
insert into details values(44,4,32,14,12,-1);

insert into details values(45,1,30,10,4,-1);
insert into details values(45,2,26,15,8,-1);
insert into details values(45,3,22,11,9,-1);
insert into details values(45,4,32,14,12,-1);

commit;

select * from details;

