create or replace PACKAGE BODY UnitePriceCal AS

    PROCEDURE Unite_price(p_id INVENTORY.MEDICATION_ID%TYPE , unitPrice NUMBER, salePrice NUMBER) AS
    CURSOR c_unitP(p_id INVENTORY.MEDICATION_ID%TYPE) IS SELECT INVENTORY_ID,MEDICATION_ID,QUANTITY,EXPIRATION_DATE FROM INVENTORY WHERE MEDICATION_ID=p_id;
   
    result NUMBER;
    
    BEGIN 

    FOR i IN c_unitP(p_id) LOOP
        
       result :=Unite_price_func(unitPrice ,i.QUANTITY,salePrice);
        DBMS_OUTPUT.PUT_LINE('Inventory Id: '||i.INVENTORY_ID);
        DBMS_OUTPUT.PUT_LINE('Medication Id: '||i.MEDICATION_ID);
        DBMS_OUTPUT.PUT_LINE('Expiration Date: '||i.EXPIRATION_DATE);
        DBMS_OUTPUT.PUT_LINE('Quantity: '||i.QUANTITY);
        DBMS_OUTPUT.PUT_LINE('Birim Fiyatý: '||unitPrice);
        DBMS_OUTPUT.PUT_LINE('Satýþ Fiyatý: '||salePrice);
        DBMS_OUTPUT.PUT_LINE('Tahmini Kar: '||result);
        
        END LOOP;   

    END;

    FUNCTION Unite_price_func(unitPrice NUMBER,quantity INVENTORY.QUANTITY%TYPE,salePrice  NUMBER)
    RETURN NUMBER
    IS
    result  NUMBER;
    BEGIN
        result :=(salePrice *quantity)-(unitPrice*quantity);
        RETURN result;
    END;

END UnitePriceCal;