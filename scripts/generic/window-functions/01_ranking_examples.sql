SELECT
  employee_id,
  department_id,
  salary,
  RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank,
  DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_salary_rank
FROM employees;
