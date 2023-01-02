create or replace FUNCTION get_prescription_info(p_prescription_id PRESCRIPTIONS.PRESCRIPTION_ID%TYPE)
RETURN PrescriptionInfoList
IS
    v_records PrescriptionInfoList := PrescriptionInfoList(PrescriptionInfo(NULL, NULL, NULL, NULL, NULL));
  
    CURSOR  v_cursor(p_prescription_id PRESCRIPTIONS.PRESCRIPTION_ID%TYPE) IS SELECT prescription_id, patient_id, medication_id, dosage, frequency
        FROM Prescriptions
        WHERE prescription_id = p_prescription_id ;
BEGIN

    
      FOR i IN v_cursor(p_prescription_id) LOOP
            v_records(v_records.LAST):=PrescriptionInfo(i.prescription_id,i.patient_id,i.medication_id,i.dosage,i.frequency); 
        END LOOP;

    RETURN v_records;
END;