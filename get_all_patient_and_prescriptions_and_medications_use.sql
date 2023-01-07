DECLARE

    p_id PATIENTS.PATIENT_ID%TYPE:=&SEARCH;

BEGIN
    get_all_patient_and_prescriptions_and_medications(p_id);
END;