SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY avg_salary DESC;
