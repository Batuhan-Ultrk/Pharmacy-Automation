CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    contact_info VARCHAR2(255) NOT NULL,
    medical_history VARCHAR2(255)
);

CREATE TABLE Medications (
    medication_id INTEGER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    dosage_form VARCHAR2(255) NOT NULL,
    warnings VARCHAR2(255),
    contraindications VARCHAR2(255)
);







CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    medication_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients (patient_id),
    FOREIGN KEY (medication_id) REFERENCES Medications (medication_id)
);

CREATE TABLE Inventory (
    inventory_id INTEGER PRIMARY KEY,
    medication_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    expiration_date DATE NOT NULL,
    FOREIGN KEY (medication_id) REFERENCES Medications (medication_id)
);



CREATE TABLE Prescriptions (
    prescription_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    medication_id INTEGER NOT NULL,
    dosage VARCHAR2(255) NOT NULL,
    frequency VARCHAR2(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients (patient_id),
    FOREIGN KEY (medication_id) REFERENCES Medications (medication_id)
);