create or replace PACKAGE UnitePriceCal  AS

     PROCEDURE Unite_price(p_id INVENTORY.MEDICATION_ID%TYPE , unitPrice NUMBER, salePrice NUMBER);

     FUNCTION Unite_price_func(unitPrice  NUMBER,quantity INVENTORY.QUANTITY%TYPE,salePrice  NUMBER) RETURN NUMBER;


END UnitePriceCal;