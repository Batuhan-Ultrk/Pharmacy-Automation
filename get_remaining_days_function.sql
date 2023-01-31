create or replace FUNCTION get_remaining_days (
  p_medication_name IN MEDICATIONS.NAME%TYPE
) RETURN InventoryInfoList
AS
   
      v_records InventoryInfoList := InventoryInfoList(InventoryInfo(NULL, NULL, NULL, NULL, NULL, NULL));
      
      CURSOR c_inv(p_medication_name MEDICATIONS.NAME%TYPE) 
      IS 
      SELECT inv.INVENTORY_ID,inv.MEDICATION_ID,inv.QUANTITY,inv.EXPIRATION_DATE,med.NAME 
      FROM INVENTORY inv
      INNER JOIN MEDICATIONS med 
      ON
      med.MEDICATION_ID=inv.MEDICATION_ID WHERE med.NAME= p_medication_name;
      
      v_remaining_days NUMBER;

BEGIN
  
    
     FOR i IN c_inv(p_medication_name) LOOP
      
            v_remaining_days := TO_DATE(TO_CHAR(sysdate,'DD/MM/YYYY'), 'DD/MM/YYYY') 
               - TO_DATE(TO_CHAR(TO_TIMESTAMP(i.EXPIRATION_DATE,'DD/MM/YYYY HH24:MI:SS'),'DD/MM/YYYY'),'DD/MM/YYYY') ;
             
            v_records(v_records.LAST):=InventoryInfo(i.INVENTORY_ID,i.MEDICATION_ID,i.NAME,i.QUANTITY,i.EXPIRATION_DATE,v_remaining_days); 
        END LOOP;


 
 
    RETURN v_records;
    
      EXCEPTION WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('HATA '|| SQLCODE ||' '||SQLERRM);
    
  
    
END;