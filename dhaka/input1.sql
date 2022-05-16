SET SERVEROUTPUT ON ;
SET VERIFY OFF; 


declare 
begin

DBMS_OUTPUT.PUT_LINE(CHR(10));
	DBMS_OUTPUT.PUT_LINE('Select Option: ');
	DBMS_OUTPUT.PUT_LINE('1. Find Nearest ICU');
	DBMS_OUTPUT.PUT_LINE('2. Update My ICU');
	DBMS_OUTPUT.PUT_LINE('3. Request ICU');

end;
/

ACCEPT hospital_id NUMBER PROMPT "Enter your Hospital ID = "
ACCEPT icu_type NUMBER PROMPT "ENTER ICU Type ID = "
ACCEPT enter_option NUMBER PROMPT "ENTER Option = "
ACCEPT icu_vacancy NUMBER PROMPT "ICU Vacancy in your Hospital = "
ACCEPT icu_allotment NUMBER PROMPT "ICU Request in Other Hospital ID = "

DECLARE
	h_id NUMBER;
	i_type NUMBER;
	op number;
	lat1 number;
	lon1 number;
	lat2 number;
	lon2 number;
	temp_id number;
	cid number;
	inum number;
	iallot number;
	iallot2 number;
	
	INVALID_OPTION exception;

BEGIN
    h_id := &hospital_id;
	i_type:= &icu_type;
	op:= &enter_option;
	inum := &icu_vacancy;
	iallot :=&icu_allotment;
	
	DBMS_OUTPUT.PUT_LINE(CHR(10));

    if op = 1 then
	    DBMS_OUTPUT.PUT_LINE(CHR(10));
		select latitude into lat1
		from hospital
		where id = h_id;
		select longitude into lon1
		from hospital
		where id = h_id;
		
 /*
		declare 
               CURSOR dis_cursor IS
	           select id,latitude,longitude,distance
			   from hospital_list
			   for update of distance NOWAIT; --lock
			
			
        BEGIN
            for list IN dis_cursor
	        LOOP
		        UPDATE hospitals_list
			    set distance= ROUND(icupack.distance(lat1,lon1,list.latitude,list.longitude),3)
			    WHERE CURRENT OF  dis_cursor;
 
			   
	        end loop;

        end;
*/		
		--explicit courser ---
    DECLARE  
           c_id hospital_list.id%type;  
           c_lat hospital_list.latitude%type;  
           c_lon hospital_list.longitude%type;
           c_d hospital_list.distance%type;   
        CURSOR c_dis is  
              SELECT id, latitude,longitude,distance
			  FROM hospital_list;  
    BEGIN  
         OPEN c_dis;  
         LOOP  
             FETCH c_dis into c_id, c_lat, c_lon,c_d;  
             EXIT WHEN  c_dis%notfound; 
	         c_d :=  ROUND(icupack.distance(lat1,lon1,c_lat,c_lon),3);

             UPDATE hospital@barishal
	         set distance@barishal= c_d
	         WHERE id@barishal = c_id;
	   
	         UPDATE hospital@dhaka
	         set distance@dhaka= c_d
	         WHERE id@dhaka = c_id;
			 
			  UPDATE hospital@rajshahi
	         set distance@rajshahi= c_d
	         WHERE id@rajshahi = c_id;
      
            END LOOP;  
            CLOSE c_dis;  
    END;  
     
	icupack.find_nearest_icu(i_type);

		  
	elsif op = 2 then
        DBMS_OUTPUT.PUT_LINE(CHR(10));
		
		update details
		set vacancy = inum,allotment = iallot
		where hid = h_id and icuid = i_type;
		
		 DBMS_OUTPUT.PUT_LINE('ICU Vacancy updated successfull');
		
		
		
    elsif op = 3 then
        DBMS_OUTPUT.PUT_LINE(CHR(10));	
		
		create or replace TRIGGER resricted_insert
before insert or update or delete
on 
begin
    if iallot2 > 20 then
	DBMS_OUTPUT.PUT_LINE('Too much request pending.');	
    END IF;
end;
/

		
		select allotment into iallot2
		from details
		where hid = iallot and icuid =i_type;
		
		update details
		set allotment = iallot2+1
		where hid = iallot and icuid = i_type;
		
		 DBMS_OUTPUT.PUT_LINE('ICU Request is successfull');	
		
	else
	   RAISE INVALID_OPTION;
	END IF;
	
	
	
	
	
	
	exception
        when INVALID_OPTION then
         dbms_output.put_line('Enter valid option. ');
         when no_data_found then
	     dbms_output.put_line('Data not found');

END;
/
commit;

--select * from icu_details;
