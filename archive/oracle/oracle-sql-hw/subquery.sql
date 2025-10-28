/*-------------------------------SUBQUERY------------------------------------*/

/* SINGLE-ROM SUBQUERIES */
/*SCALAR (return one value)*/
SELECT 
    first_name
  , last_name
  , salary 
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees)/5;

SELECT 
    first_name
  , last_name
  , salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT 
    first_name
  , last_name
  , salary
FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE employee_id = 180);

SELECT 
    first_name
  , last_name
  , salary
FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE employee_id > 190); /* Don't work*/ 

SELECT job_title 
FROM jobs j 
JOIN employees e ON (j.job_id = e.job_id)
GROUP BY job_title
HAVING AVG(salary) = (SELECT MAX(AVG(salary)) FROM employees GROUP BY job_id);
/*----------------------------------------------------------------------------*/



/* MULTIPLE-ROM SUBQUERIES */
SELECT 
    first_name
  , last_name
  , salary 
FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE min_salary > 8000);

SELECT 
    first_name
  , last_name
  , salary 
FROM employees
WHERE job_id NOT IN (SELECT job_id FROM jobs WHERE min_salary > 8000);

            
SELECT 
    first_name
  , last_name
  , salary 
FROM employees
WHERE salary > ANY(SELECT salary FROM employees WHERE department_id = 100);            
        
SELECT 
    first_name
  , last_name
  , salary 
FROM employees
WHERE salary < ANY(SELECT salary FROM employees WHERE department_id = 100);  


SELECT 
    first_name
  , last_name
  , salary
FROM employees 
WHERE salary > ALL(SELECT salary FROM employees WHERE department_id = 100);
        
SELECT 
    first_name
  , last_name
  , salary
FROM employees 
WHERE salary < ALL(SELECT salary FROM employees WHERE department_id = 100);
        

SELECT DISTINCT department_name 
FROM employees e 
JOIN departments d ON(e.department_id = d.department_id);
        
SELECT department_name 
FROM departments       
WHERE department_id IN (SELECT DISTINCT department_id FROM employees);
/*----------------------------------------------------------------------------*/       
     
       
            
/* CORRELATED SUBQUERIES */
SELECT
    first_name
  , last_name
  , salary
FROM employees  
WHERE salary > (SELECT AVG(salary) FROM employees);
            
SELECT
    e1.first_name
  , e1.last_name
  , e1.salary
FROM employees e1
WHERE salary > (SELECT AVG(e2.salary) 
                FROM employees e2 
                WHERE e2.department_id = e1.department_id);
/*----------------------------------------------------------------------------*/     
     
    
            
/* Examples */            
SELECT * FROM employees;

SELECT 
    first_name
  , last_name
  , salary
FROM employees
WHERE department_id IN
    (SELECT department_id FROM departments WHERE location_id IN
        (SELECT location_id FROM locations WHERE country_id =
            (SELECT country_id FROM countries WHERE country_name = 'United King')));
            
            
SELECT 
    first_name
  , last_name
  , salary
FROM employees
WHERE 
    job_id IN (SELECT job_id FROM jobs WHERE UPPER(job_title) LIKE '%MANAGER%')
AND salary > (SELECT AVG(salary) FROM employees);
            
            
SELECT 
    first_name
  , last_name
  , salary
FROM employees  
WHERE salary > ALL(SELECT salary FROM employees WHERE first_name = 'David');
/*----------------------------------------------------------------------------*/