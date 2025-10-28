/*1 task*/
SELECT 
    department_id
  , MIN(salary) min_salary
  , MAX(salary) max_salary
  , MIN(hire_date) min_hire_date
  , MAX(hire_date) max_hire_date
  , COUNT(*) count
FROM employees
GROUP BY department_id
ORDER BY COUNT(*) DESC;
    

/*2 task*/
SELECT 
    SUBSTR(first_name, 1, 1) first_char
  , COUNT(*) count
FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(*) > 1
ORDER BY 2 DESC;


/*3 task*/
SELECT 
    department_id
  , salary
  , COUNT(*) count
FROM employees
GROUP BY department_id, salary;


/*4 task*/
SELECT 
    TO_CHAR(hire_date, 'Day') day
  , COUNT(*) count
FROM employees
GROUP BY TO_CHAR(hire_date, 'Day');


/*5 task*/
SELECT 
    department_id
  , COUNT(*) count
  , SUM(salary) sum_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30 AND SUM(salary) > 300000;


/*6 task*/
SELECT region_id 
FROM countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;


/*7 task*/
SELECT 
    job_id
  , ROUND(AVG(salary)) avg_salary
FROM employees
GROUP BY job_id;


/*8 task*/
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1;


/*9 task*/
SELECT 
    department_id
  , job_id
  , MIN(salary) min_salary
  , MAX(salary) max_salary
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000;


/*10 task*/
SELECT manager_id
FROM employees
WHERE COMMISSION_PCT IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;


/*11 task*/
SELECT ROUND(MAX(AVG(salary)), -3) max_avg_salary
FROM employees
GROUP BY department_id;
































