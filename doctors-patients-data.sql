
-- Insert doctors
INSERT INTO doctors (name, specialty) VALUES ('Dr. Smith', 'Cardiology');
INSERT INTO doctors (name, specialty) VALUES ('Dr. Jones', 'Pediatrics');
INSERT INTO doctors (name, specialty) VALUES ('Dr. Lee', 'Dermatology');
INSERT INTO doctors (name, specialty) VALUES ('Dr. Patel', 'Neurology');

-- Insert patients
INSERT INTO patients (name, date_of_birth) VALUES ('John Doe', '1980-05-15');
INSERT INTO patients (name, date_of_birth) VALUES ('Jane Roe', '1992-11-30');
INSERT INTO patients (name, date_of_birth) VALUES ('Sam Kim', '1975-03-22');
INSERT INTO patients (name, date_of_birth) VALUES ('Alex Wu', '2000-07-19');

-- Insert diseases
INSERT INTO diseases (name) VALUES ('Hypertension');
INSERT INTO diseases (name) VALUES ('Asthma');
INSERT INTO diseases (name) VALUES ('Diabetes');
INSERT INTO diseases (name) VALUES ('Eczema');

-- Insert visits (assuming doctor_id and patient_id are 1-4)
INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES (1, 1, '2025-09-15 10:00');
INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES (2, 2, '2025-09-16 14:00');
INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES (3, 3, '2025-09-17 09:30');
INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES (4, 4, '2025-09-18 11:15');

-- Insert diagnoses (assuming visit_id and disease_id are 1-4)
INSERT INTO diagnoses (visit_id, disease_id) VALUES (1, 1);
INSERT INTO diagnoses (visit_id, disease_id) VALUES (2, 2);
INSERT INTO diagnoses (visit_id, disease_id) VALUES (3, 4);
INSERT INTO diagnoses (visit_id, disease_id) VALUES (4, 3);
