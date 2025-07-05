CREATE SCHEMA IF NOT EXISTS clinic;

CREATE TABLE IF NOT EXISTS clinic.patients (
  patient_id BIGSERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  birth_date DATE NOT NULL,
  phone_number TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS clinic.doctors (
  doctor_id BIGSERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  specialty TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS clinic.cases (
  case_id BIGSERIAL PRIMARY KEY,
  patient_id BIGINT NOT NULL REFERENCES clinic.patients (patient_id),
  responsible_doctor_id BIGINT REFERENCES clinic.doctors (doctor_id),
  start_date DATE NOT NULL,
  end_date DATE,
  result_code VARCHAR(20)
);
