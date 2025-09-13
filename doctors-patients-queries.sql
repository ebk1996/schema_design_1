-- Example queries for Doctors/Patients schema
-- 1. List all visits with doctor, patient, and date
SELECT v.visit_id, v.visit_date, d.name AS doctor, p.name AS patient
FROM visits v
JOIN doctors d ON v.doctor_id = d.doctor_id
JOIN patients p ON v.patient_id = p.patient_id;

-- 2. List all diseases diagnosed for a patient (e.g., patient_id = 1)
SELECT dis.name AS disease
FROM diagnoses diag
JOIN visits v ON diag.visit_id = v.visit_id
JOIN diseases dis ON diag.disease_id = dis.disease_id
WHERE v.patient_id = 1;

-- 3. Find all patients seen by a specific doctor (e.g., doctor_id = 1)
SELECT p.name AS patient
FROM visits v
JOIN patients p ON v.patient_id = p.patient_id
WHERE v.doctor_id = 1;

-- 4. Count visits per doctor
SELECT d.name AS doctor, COUNT(v.visit_id) AS visit_count
FROM doctors d
LEFT JOIN visits v ON d.doctor_id = v.doctor_id
GROUP BY d.name;

-- 5. List all doctors who diagnosed a specific disease (e.g., 'Asthma')
SELECT DISTINCT d.name AS doctor
FROM diagnoses diag
JOIN visits v ON diag.visit_id = v.visit_id
JOIN doctors d ON v.doctor_id = d.doctor_id
JOIN diseases dis ON diag.disease_id = dis.disease_id
WHERE dis.name = 'Asthma';
