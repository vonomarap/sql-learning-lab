SELECT
  p.patient_id,
  p.full_name,
  COUNT(c.case_id) AS case_count
FROM clinic.patients AS p
LEFT JOIN clinic.cases AS c
  ON c.patient_id = p.patient_id
GROUP BY p.patient_id, p.full_name
ORDER BY case_count DESC, p.full_name;
