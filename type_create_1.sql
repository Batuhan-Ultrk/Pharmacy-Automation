create or replace TYPE PrescriptionInfo AS OBJECT (
    prescription_id INTEGER,
    patient_id INTEGER,
    medication_id INTEGER,
    dosage VARCHAR2(255),
    frequency VARCHAR2(255)
);
create or replace TYPE PrescriptionInfoList IS TABLE OF PrescriptionInfo;