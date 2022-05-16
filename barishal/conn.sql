
drop database link dhaka;

create database link dhaka
 connect to dhaka identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.0.199)
		 (PORT = 1722))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  




drop database link barishal;

create database link barishal
 connect to barishal identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.0.199)
		 (PORT = 1722))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  


drop database link rajshahi;

create database link rajshahi
 connect to rajshahi identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.109.128)
		 (PORT = 1821))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  


