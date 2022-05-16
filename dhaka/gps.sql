SET SERVEROUTPUT ON ;
SET VERIFY OFF; 

/*

drop FUNCTION distance;
CREATE OR REPLACE FUNCTION distance (Lat1 IN NUMBER,
                                     Lon1 IN NUMBER,
                                     Lat2 IN NUMBER,
                                     Lon2 IN NUMBER,
                                     Radius IN NUMBER DEFAULT 3963)
RETURN NUMBER IS
 -- Convert degrees to radians
 DegToRad NUMBER := 57.29577951;

BEGIN
  RETURN(NVL(Radius,0) * ACOS((sin(NVL(Lat1,0) / DegToRad) * SIN(NVL(Lat2,0) / DegToRad)) +
        (COS(NVL(Lat1,0) / DegToRad) * COS(NVL(Lat2,0) / DegToRad) *
         COS(NVL(Lon2,0) / DegToRad - NVL(Lon1,0)/ DegToRad))));
END;
/

*/
-----------------------------

create or replace
    function distance(
                p_latitude1 number,
                p_longitude1 number,
                p_latitude2 number,
                p_longitude2 number) return number deterministic is
      earth_radius  number := 6371;
      pi_approx     number := 3.1415927/180; 
      lat_delta     number := (p_latitude2-p_latitude1)*pi_approx;
     lon_delta     number := (p_longitude2-p_longitude1)*pi_approx;
     arc           number := sin(lat_delta/2) * sin(lat_delta/2) +
                                  sin(lon_delta/2) * sin(lon_delta/2) * cos(p_latitude1*pi_approx) * cos(p_latitude2*pi_approx);
   begin
     return earth_radius * 2 * atan2(sqrt(arc), sqrt(1-arc));
   end;
   /






declare
          num number;
 
begin
     --num := distance(23.748385,90.408696,23.747207,90.410327,6387.7);
	  num := distance(23.748385,90.408696,23.747207,90.410327);
 dbms_output.put_line(num);
end;
/



