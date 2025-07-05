INSERT INTO clinic.patients (full_name, birth_date, phone_number)
VALUES
  ('Ivan Petrov', DATE '1993-02-14', '+100000001'),
  ('Anna Sidorova', DATE '1987-08-09', '+100000002');

INSERT INTO clinic.doctors (full_name, specialty)
VALUES
  ('Mariya Ivanova', 'Cardiology'),
  ('Oleg Smirnov', 'Therapy');

INSERT INTO clinic.cases (patient_id, responsible_doctor_id, start_date, end_date, result_code)
VALUES
  (1, 1, DATE '2025-06-01', DATE '2025-06-10', 'RECOVERED'),
  (2, 2, DATE '2025-06-02', NULL, 'ACTIVE');
