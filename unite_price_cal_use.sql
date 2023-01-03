DECLARE
	unitPrice NUMBER:=&BirimFiyati;
	salePrice NUMBER:=&salePrice ;
	p_id INVENTORY.MEDICATION_ID%TYPE:=&MedId;
BEGIN

  	  UnitePriceCal.Unite_price(p_id, unitPrice ,salePrice);
    
END;