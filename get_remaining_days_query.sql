DECLARE 
    p_medication_name MEDICATIONS.NAME%TYPE:='&SEARCH';
    info INVENTORY%ROWTYPE;
    v_REMAINING_DAYS NUMBER;
    v_MED_NAME  MEDICATIONS.NAME%TYPE;

BEGIN
    
        SELECT INVENTORY_ID,MEDICATION_ID,QUANTITY,EXPIRATION_DATE INTO info FROM TABLE(CAST(get_remaining_days(p_medication_name) AS InventoryInfoList));
       
        SELECT MED_NAME INTO v_MED_NAME FROM TABLE(CAST(get_remaining_days(p_medication_name) AS InventoryInfoList));
       
        SELECT REMAINING_DAYS INTO v_REMAINING_DAYS FROM TABLE(CAST(get_remaining_days(p_medication_name) AS InventoryInfoList));
        
        DBMS_OUTPUT.PUT_LINE('Inventory Id: ' || info.INVENTORY_ID);
        DBMS_OUTPUT.PUT_LINE('Medication Id: ' || info.MEDICATION_ID);
        DBMS_OUTPUT.PUT_LINE('Medication Name: ' ||v_MED_NAME);
        DBMS_OUTPUT.PUT_LINE('Quantity: ' ||info.QUANTITY);
        DBMS_OUTPUT.PUT_LINE('Expiration Date: ' ||info.EXPIRATION_DATE);
        DBMS_OUTPUT.PUT_LINE('Remaining Days: ' ||v_REMAINING_DAYS);


END;
