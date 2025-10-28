/*1 task*/
SELECT 
    manager_id
  , TO_CHAR(null) job_id
  , TO_NUMBER(null) department_id
  , SUM(salary)
FROM employees
GROUP BY manager_id

UNION
SELECT 
    TO_NUMBER(null)
  , job_id
  , TO_NUMBER(null)
  , SUM(salary)
FROM employees
GROUP BY job_id

UNION
SELECT 
    TO_NUMBER(null)
  , TO_CHAR(null)
  , department_id
  , SUM(salary)
FROM employees
GROUP BY department_id;


/*2 task*/
SELECT department_id FROM employees WHERE manager_id = 100
MINUS
SELECT department_id FROM employees WHERE manager_id IN(145, 201);


/*3 task*/
SELECT 
    first_name
  , last_name
  , salary
FROM employees 
WHERE first_name LIKE '_a%'
UNION
SELECT 
    first_name
  , last_name
  , salary
FROM employees 
WHERE UPPER(last_name) LIKE '%S%'
ORDER BY salary DESC;


/*4 task*/
SELECT 
    location_id
  , postal_code
  , city
FROM locations 
WHERE country_id IN ( 
    SELECT country_id FROM countries WHERE country_name IN ('Germany', 'Italy'))
UNION ALL
SELECT 
    location_id
  , postal_code
  , city
FROM locations 
WHERE postal_code LIKE '%9%';

SELECT * FROM regions;

/*5 task*/
SELECT country_id id, country_name country, region_id region FROM countries 
WHERE LENGTH(country_name) > 8
UNION 
SELECT * FROM countries 
WHERE region_id !=(SELECT region_id FROM regions WHERE region_name = 'Europe')
ORDER BY country DESC;










































