CREATE INDEX IF NOT EXISTS idx_cases_patient_id
  ON clinic.cases (patient_id);

CREATE INDEX IF NOT EXISTS idx_cases_responsible_doctor_id
  ON clinic.cases (responsible_doctor_id);

CREATE INDEX IF NOT EXISTS idx_cases_start_date
  ON clinic.cases (start_date);

EXPLAIN ANALYZE
SELECT c.case_id, c.start_date, c.result_code
FROM clinic.cases AS c
WHERE c.patient_id = 1
ORDER BY c.start_date DESC;
