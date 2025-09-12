-- Create Doctors/Patients database and connect
CREATE DATABASE doctors_patients_db;
\c doctors_patients_db

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Sample data insertion
INSERT INTO doctors (doctor_id, name, specialty) VALUES
    (1, 'Dr. Smith', 'Cardiology'),
    (2, 'Dr. Jones', 'Pediatrics');

INSERT INTO patients (patient_id, name, date_of_birth) VALUES
    (1, 'John Doe', '1980-05-15'),
    (2, 'Jane Roe', '1992-11-30');

INSERT INTO appointments (appointment_id, doctor_id, patient_id, appointment_date, reason) VALUES
    (1, 1, 1, '2025-09-15 10:00', 'Annual checkup'),
    (2, 2, 2, '2025-09-16 14:00', 'Flu symptoms');

-- Example Queries for Doctors/Patients DB
-- 1. List all appointments with doctor and patient info
SELECT a.appointment_id, a.appointment_date, a.reason, d.name AS doctor, p.name AS patient
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN patients p ON a.patient_id = p.patient_id;

-- 2. Find appointments for a specific doctor (e.g., 'Dr. Smith')
SELECT a.appointment_id, a.appointment_date, a.reason, d.name AS doctor, p.name AS patient
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN patients p ON a.patient_id = p.patient_id;
-- 3. Count patients per doctor
SELECT d.name AS doctor, COUNT(DISTINCT a.patient_id) AS patient_count
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;
-- Doctors-Patients ER Diagram SQL DDL
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATETIME,
    reason VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
