CREATE OR REPLACE PACKAGE BODY CONTRAINDICATIONS_MEDICAL_HISTORY AS
 
PROCEDURE get_words_list (p_id IN PATIENTS.PATIENT_ID%TYPE)AS
  
        CURSOR c_pat(p_id PATIENTS.PATIENT_ID%TYPE) IS SELECT 
        pat.PATIENT_ID,pat.LAST_NAME,pat.MEDICAL_HISTORY,pres.MEDICATION_ID,med.CONTRAINDICATIONS
        FROM 
        PATIENTS pat
        INNER JOIN PRESCRIPTIONS pres ON pat.PATIENT_ID=pres.PATIENT_ID
        INNER JOIN MEDICATIONS med ON pres.MEDICATION_ID=med.MEDICATION_ID
        WHERE pat.PATIENT_ID=p_id;
        
      v_word VARCHAR2(255);
      v_count NUMBER:=1;
      message VARCHAR2(255);
BEGIN
        FOR i IN c_pat(p_id) LOOP
            v_count := REGEXP_COUNT(i.CONTRAINDICATIONS, '[^,]+');
                DBMS_OUTPUT.PUT_LINE('Patiend Id: '||i.PATIENT_ID);
                DBMS_OUTPUT.PUT_LINE('Last Name: '||i.LAST_NAME);
                DBMS_OUTPUT.PUT_LINE('Medical Id: '||i.MEDICATION_ID);
                DBMS_OUTPUT.PUT_LINE('Medical History: '||i.MEDICAL_HISTORY);
                DBMS_OUTPUT.PUT_LINE('Contraindications: '||i.CONTRAINDICATIONS);
                DBMS_OUTPUT.NEW_LINE;
            FOR j IN 1..v_count LOOP
                   v_word := REGEXP_SUBSTR(i.CONTRAINDICATIONS, '[^,]+', 1,j);
                
                    message:= get_words_list_func(v_word , i.MEDICAL_HISTORY);
            
            END LOOP;
           
            DBMS_OUTPUT.PUT_LINE('MESAJ: '||message);
        END LOOP;
END;   


FUNCTION get_words_list_func (p_input_string IN VARCHAR2, his VARCHAR2)RETURN VARCHAR2 AS

        konum NUMBER;
        e_invalide EXCEPTION;
        
BEGIN
        
            SELECT INSTR(LOWER(his),LOWER(p_input_string))INTO konum FROM DUAL;
            IF konum=0 THEN
                 RETURN 'HASTANIN GEÇMÝÞÝNDE BU ÝLACIN YAN ETKÝLERÝNE RASTLANMAMIÞTIR.';
            ELSE 
                    RAISE e_invalide;
                
            END IF;
END;
  
 END CONTRAINDICATIONS_MEDICAL_HISTORY;
 