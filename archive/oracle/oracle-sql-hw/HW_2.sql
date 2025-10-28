SELECT * FROM regions; --First task.

SELECT * FROM employees; 
SELECT * FROM jobs;

/*Second task.*/
SELECT                                                         
'My name is '||first_name||' '||last_name AS "Name employee",  
department_id, salary
FROM employees;  

/*Third task.*/
SELECT employee_id, email, hire_date, hire_date-7 AS "One week before hire date"
FROM employees;

/*Fourth task.*/
SELECT first_name || '(' || job_id || ')' AS our_employees
FROM employees;

/*Fifth task.*/
SELECT DISTINCT first_name FROM employees;

/*Sixth task.*/
SELECT 
job_title, 'min = '||min_salary||', max = '||max_salary AS info,
max_salary AS max, max_salary*2 - 2000 AS new_salary
FROM jobs;

/*Seventh task.*/
SELECT q'<Peter's dog is very clever.>' FROM dual;

/*Eighth task.*/
SELECT 'Peter''s dog is very clever.' FROM dual;

/*Ninth task.*/
SELECT 100*365.25*24*60 FROM dual;




