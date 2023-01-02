DECLARE 
v_prescription_id PRESCRIPTIONS.PRESCRIPTION_ID%TYPE:=&ARAMA;
info PRESCRIPTIONS%ROWTYPE;

BEGIN
    
        SELECT * INTO info FROM TABLE(CAST(get_prescription_info(v_prescription_id) AS PrescriptionInfoList));

        DBMS_OUTPUT.PUT_LINE('Prescription ID: ' || info.PRESCRIPTION_ID);
        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || info.PATIENT_ID);
        DBMS_OUTPUT.PUT_LINE('Medication ID: ' ||info.MEDICATION_ID);
        DBMS_OUTPUT.PUT_LINE('Dosage: ' ||info.DOSAGE);
        DBMS_OUTPUT.PUT_LINE('Frequency: ' || info.FREQUENCY);

END;





