SELECT NOW();

SELECT CURRENT_DATE;

SELECT DATE_TRUNC('month', NOW());

INSERT INTO clinic.cases (patient_id, responsible_doctor_id, start_date, result_code)
VALUES (1, 1, CURRENT_DATE, 'ACTIVE')
RETURNING case_id;
