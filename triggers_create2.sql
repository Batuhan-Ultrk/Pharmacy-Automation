create or replace TRIGGER log_medications_change AFTER
INSERT OR UPDATE OR DELETE ON medications FOR EACH ROW
DECLARE
    message VARCHAR2(10);
BEGIN
            
            IF INSERTING THEN
            
                message:='INSERT';
                INSERT INTO LOG2(log_id,MEDICATION_ID,NAME,DOSAGE_FORM,WARNINGS,CONTRAINDICATIONS,message,log_time) 
                VALUES(otomatik_artis.NEXTVAL,:NEW.MEDICATION_ID,:NEW.NAME,:NEW.DOSAGE_FORM,:NEW.WARNINGS,:NEW.CONTRAINDICATIONS,message,sysdate);
            
            END IF;
            
            IF UPDATING THEN
                message:='UPDATE';
    
                INSERT INTO LOG2(log_id,MEDICATION_ID,NAME,DOSAGE_FORM,WARNINGS,CONTRAINDICATIONS,message,log_time) 
                VALUES(otomatik_artis.NEXTVAL,:OLD.MEDICATION_ID,:OLD.NAME,:OLD.DOSAGE_FORM,:OLD.WARNINGS,:OLD.CONTRAINDICATIONS,message,sysdate);
                
                       
                INSERT INTO LOG2(log_id,MEDICATION_ID,NAME,DOSAGE_FORM,WARNINGS,CONTRAINDICATIONS,message,log_time) 
                VALUES(otomatik_artis.NEXTVAL,
                NVL(:NEW.MEDICATION_ID,:OLD.MEDICATION_ID),
                NVL(:NEW.NAME,:OLD.NAME),
                NVL(:NEW.DOSAGE_FORM,:OLD.DOSAGE_FORM),
                NVL(:NEW.WARNINGS,:OLD.WARNINGS),
                NVL(:NEW.CONTRAINDICATIONS,:OLD.CONTRAINDICATIONS),
                message,
                sysdate);
            END IF;

            IF DELETING THEN
                message:='DELETE';
                 INSERT INTO LOG2(log_id,MEDICATION_ID,NAME,DOSAGE_FORM,WARNINGS,CONTRAINDICATIONS,message,log_time) 
                 VALUES(otomatik_artis.NEXTVAL,:OLD.MEDICATION_ID,:OLD.NAME,:OLD.DOSAGE_FORM,:OLD.WARNINGS,:OLD.CONTRAINDICATIONS,message,sysdate);
            END IF;


END;