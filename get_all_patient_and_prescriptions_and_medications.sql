create or replace PROCEDURE get_all_patient_and_prescriptions_and_medications(p_id PATIENTS.PATIENT_ID%TYPE)
AS
  CURSOR cur_info(p_id PATIENTS.PATIENT_ID%TYPE) 
  IS
     SELECT 
     pat.PATIENT_ID,pat.FIRST_NAME,pat.LAST_NAME,pat.CONTACT_INFO,pat.MEDICAL_HISTORY,
     pre.PRESCRIPTION_ID,pre.MEDICATION_ID,pre.DOSAGE,pre.FREQUENCY,
     med.NAME,med.WARNINGS,med.CONTRAINDICATIONS
     FROM PATIENTS pat 
     INNER JOIN PRESCRIPTIONS pre ON pat.PATIENT_ID=pre.PATIENT_ID 
     INNER JOIN MEDICATIONS med ON med.MEDICATION_ID=pre.MEDICATION_ID
     WHERE pat.PATIENT_ID=p_id;

BEGIN

    FOR i IN cur_info(p_id) LOOP
        
        DBMS_OUTPUT.PUT_LINE('Patient Id: ' ||i.PATIENT_ID);
        DBMS_OUTPUT.PUT_LINE('Patient First Name: ' || i.FIRST_NAME);
        DBMS_OUTPUT.PUT_LINE('Patient Last Name: ' || i.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('Patient Contact Info: ' || i.CONTACT_INFO);
        DBMS_OUTPUT.PUT_LINE('Patient Medical History: ' || i.MEDICAL_HISTORY);
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('Prescriptions Id: ' || i.PRESCRIPTION_ID);
        DBMS_OUTPUT.PUT_LINE('Prescriptions Medication Id: ' || i.MEDICATION_ID);
        DBMS_OUTPUT.PUT_LINE('Prescriptions Dosage: ' || i.DOSAGE);
        DBMS_OUTPUT.PUT_LINE('Prescriptions Frequency: ' || i.FREQUENCY);
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('Medications Name: ' || i.NAME);
        DBMS_OUTPUT.PUT_LINE('Medications Warnings: ' || i.WARNINGS); 
        DBMS_OUTPUT.PUT_LINE('Medications Contraindications: ' || i.CONTRAINDICATIONS);
    
    END LOOP;
  
END;