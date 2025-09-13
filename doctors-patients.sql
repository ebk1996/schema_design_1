-- Create Doctors/Patients database and connect
CREATE DATABASE doctors_patients_db;
\c doctors_patients_db

-- Doctors employed by the medical center
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100)
);

-- Patients seen by doctors
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE
);

-- Diseases that can be diagnosed
CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Visits: a patient sees a doctor, may be diagnosed with diseases
CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL REFERENCES patients(patient_id),
    doctor_id INT NOT NULL REFERENCES doctors(doctor_id),
    visit_date TIMESTAMP NOT NULL
);

-- Diagnoses: diseases diagnosed during a visit
CREATE TABLE diagnoses (
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL REFERENCES visits(visit_id),
    disease_id INT NOT NULL REFERENCES diseases(disease_id)
);