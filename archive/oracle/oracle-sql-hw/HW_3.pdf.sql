/*First task*/
SELECT * FROM employees WHERE first_name = 'David';

/*Second task*/
SELECT * FROM employees WHERE job_id = 'FI_ACCOUNT';

/*Third task*/
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 50 AND salary > 4000;

/*Fourth task*/
SELECT * FROM employees
WHERE department_id IN(20, 30);

/*Fifth task*/
SELECT * FROM employees
WHERE first_name LIKE '_a%a';

/*Sixth task*/
SELECT * FROM employees 
WHERE department_id IN(50, 80) AND commission_pct IS NOT NULL
ORDER BY email;

/*Seventh task*/
SELECT * FROM employees
WHERE first_name LIKE '%n%n%';

/*Eighth task*/
SELECT * FROM employees 
WHERE first_name LIKE '_____%'
ORDER BY department_id DESC NULLS LAST;

/*Nineth task*/
SELECT * FROM employees 
WHERE (salary BETWEEN 3000 AND 7000) 
AND (commission_pct IS NULL) 
AND (job_id IN('PU_CLERK', 'ST_MAN', 'ST_CLERK'));

/*Tenth task*/
SELECT * FROM employees
WHERE first_name LIKE '%\%%' ESCAPE '\';

/*Eleventh task*/
SELECT job_id, first_name, salary
FROM employees
WHERE employee_id >= 120 AND job_id != 'IT_PROG'
ORDER BY job_id ASC, first_name DESC;

