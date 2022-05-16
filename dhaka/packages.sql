
SET SERVEROUTPUT ON;

drop package icupack;
CREATE OR REPLACE PACKAGE icupack AS

	FUNCTION distance( p_latitude1 number,
                       p_longitude1 number,
                       p_latitude2 number,
                       p_longitude2 number)
	RETURN NUMBER;
	
	PROCEDURE find_nearest_icu(i_type in number);
	
	
END icupack;
/

CREATE OR REPLACE PACKAGE BODY icupack AS

	function distance(
                p_latitude1 number,
                p_longitude1 number,
                p_latitude2 number,
                p_longitude2 number)
				return number
			    is
      earth_radius  number := 6371;
      pi_approx     number := 3.1415927/180; 
      lat_delta     number := (p_latitude2-p_latitude1)*pi_approx;
      lon_delta     number := (p_longitude2-p_longitude1)*pi_approx;
      arc           number := sin(lat_delta/2) * sin(lat_delta/2) +
                                  sin(lon_delta/2) * sin(lon_delta/2) * cos(p_latitude1*pi_approx) * cos(p_latitude2*pi_approx);
      begin
           return earth_radius * 2 * atan2(sqrt(arc), sqrt(1-arc));
    end distance;
 
	
	procedure find_nearest_icu(i_type in number)
	is
	       fni_id icu_details.id%type;  
           fni_name icu_details.name%type;  
           fni_category icu_details.category%type;
           fni_total icu_details.total%type;
           fni_vacancy icu_details.vacancy%type;
           fni_allotment icu_details.allotment%type;
           fni_distance icu_details.distance%type;		   
        CURSOR fni is
              	select id,name,category,total,vacancy,allotment,distance
				from icu_details;
          /*  select id,name,category,total,vacancy,allotment,distance from(
              select h.id,h.name,i.category,d.total,d.vacancy,d.allotment,h.distance
              from hospital@barishal h,details@barishal d,icu_type@barishal i
              where (h.id = d.hid and i.id = d.icuid and i.id = i_type) 
        union
              select h.id, h.name,i.category,d.total,d.vacancy,d.allotment,h.distance
              from hospital@dhaka h,details@dhaka d,icu_type@dhaka i
              where (h.id = d.hid and i.id = d.icuid and i.id = i_type) 
)
order by distance,vacancy desc , allotment ;
*/
	BEGIN  
         OPEN fni;
		   dbms_output.put_line(RPAD('ID',5,' ')
			|| RPAD('HOSPITAL NAME',30,' ')
			|| RPAD('ICU CATEGORY',20,' ')
			|| RPAD('TOTAL ICU',10,' ')
			|| RPAD('VACANCY',10,' ')
			|| RPAD('ALLOTMENT',10,' ')
			|| RPAD('DISTANCE',10,' ')
			);
           LOOP  
             FETCH fni into fni_id,fni_name,fni_category,fni_total,fni_vacancy,fni_allotment,fni_distance;  
             EXIT WHEN  fni%notfound; 
	           dbms_output.put_line(RPAD(fni_id,5,' ')
			|| RPAD(fni_name,30,' ')
			|| RPAD(fni_category,20,' ')
			|| RPAD(fni_total,10,' ')
			|| RPAD(fni_vacancy,10,' ')
			|| RPAD(fni_allotment,10,' ')
			|| RPAD(fni_distance,10,' ')
			);
           
            END LOOP;  
         CLOSE fni;  
    END find_nearest_icu;  
	
	
	
	
	
	
	
END icupack;
/