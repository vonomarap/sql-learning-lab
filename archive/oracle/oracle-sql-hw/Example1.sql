SELECT * FROM employees;

SELECT first_name, last_name, salary FROM employees WHERE salary = 17000;

SELECT * FROM departments WHERE location_id = 1919;
SELECT * FROM job_history WHERE job_id = 'ST_CLERK';
SELECT * FROM employees
WHERE 'Dr '||first_name||' '||last_name = 'Dr David Austin';

SELECT first_name, last_name, salary FROM employees WHERE salary < 9000;

SELECT * FROM employees WHERE first_name = 'Steven';

SELECT first_name, last_name, salary FROM employees
WHERE salary between 4000 and 10000;

SELECT * FROM JOB_HISTORY WHERE start_date BETWEEN '01-JAN-04' AND '31-DEC-06';
SELECT * FROM employees WHERE first_name BETWEEN 'A' AND 'C';


SELECT * FROM employees WHERE job_id LIKE 'IT\_%' ESCAPE '\';


SELECT * FROM employees WHERE NOT(job_id = 'SA_MAN');
SELECT * FROM employees WHERE last_name NOT LIKE 'C%';
SELECT * FROM employees WHERE commission_pct IS NOT NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL AND last_name NOT LIKE '%n';