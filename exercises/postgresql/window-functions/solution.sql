WITH active_cases AS (
  SELECT responsible_doctor_id, COUNT(*) AS active_case_count
  FROM clinic.cases
  WHERE end_date IS NULL
    AND responsible_doctor_id IS NOT NULL
  GROUP BY responsible_doctor_id
)
SELECT
  responsible_doctor_id,
  active_case_count,
  DENSE_RANK() OVER (ORDER BY active_case_count DESC) AS active_case_rank
FROM active_cases
ORDER BY active_case_rank, responsible_doctor_id;
