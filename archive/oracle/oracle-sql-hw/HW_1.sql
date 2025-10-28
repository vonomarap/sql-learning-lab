SELECT salary FROM employees;

SELECT first_name, salary*1.5, salary FROM employees;

SELECT start_date, start_date+8 FROM job_history;

SELECT start_date, end_date, (end_date - start_date)+7 FROM job_history;

SELECT 'My name is '||first_name||' and my surname is '||last_name AS "My name"
FROM employees;

SELECT * FROM employees;

SELECT 'My phone number '||phone_number||' and my email '||email
AS "For contacting"
FROM employees;

SELECT salary AS Salary, 'New year and Christmas bonus for employee '||salary*1.5
AS "Salary + bonus 50%"
FROM employees;

SELECT q'<It''s my wife>' AS Text
FROM dual;




