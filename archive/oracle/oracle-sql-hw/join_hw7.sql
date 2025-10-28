/* 1 task*/
SELECT 
    region_name
   ,COUNT(*)
FROM employees e
    JOIN departments d ON (e.department_id = d.department_id)
    JOIN locations l ON (d.location_id = l.location_id)
    JOIN countries c ON (l.country_id = c.country_id)
    JOIN regions r ON (c.region_id = r.region_id)
GROUP BY region_name;

SELECT * FROM jobs;

/* 2 task*/
SELECT 
    first_name
  , last_name
  , department_name
  , job_title
  , city
  , street_address
  , country_name
  , region_name
FROM employees e 
    JOIN departments d ON (e.department_id = d.department_id)
    JOIN locations l ON (d.location_id = l.location_id)
    JOIN countries c ON (l.country_id = c.country_id)
    JOIN regions r ON (c.region_id = r.region_id)
    JOIN jobs j ON (e.job_id = j.job_id);


/* 3 task*/
SELECT 
    emp2.first_name
  , COUNT(*)
FROM employees emp1
    JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
GROUP BY emp2.first_name
HAVING COUNT(*) > 6;

/* 4 task*/
SELECT 
    department_name
  , COUNT(*)
FROM departments 
    JOIN employees USING(department_id)
GROUP BY department_name
HAVING COUNT(*) > 30;

/* 5 task*/
SELECT department_name
FROM employees e
RIGHT JOIN departments d ON (e.department_id = d.department_id)
WHERE first_name IS NULL;

/* 6 task*/
SELECT emp.*
FROM employees emp
JOIN employees managers ON (emp.manager_id = managers.employee_id)
WHERE TO_CHAR(managers.hire_date, 'YYYY') = '2005'
    AND TO_CHAR(emp.hire_date, 'YYYY') < '2005';

SELECT TO_CHAR(TO_DATE('20-SEP-10'), 'YYYY') FROM dual;

/* 7 task*/
SELECT 
    country_name
  , region_name
FROM countries 
NATURAL JOIN regions;


/* 8 task*/
SELECT 
    first_name
  , last_name
  , salary
  , job_title
FROM employees e
JOIN jobs j ON (e.job_id = j.job_id AND salary < (min_salary + 1000));


/* 9 task*/
SELECT
    DISTINCT first_name
  , last_name
  , country_name
FROM employees e
FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
FULL OUTER JOIN countries c ON (l.country_id = c.country_id);


/* 10 task*/
SELECT 
    first_name
  , last_name
  , country_name
FROM employees
CROSS JOIN countries;


/* 11 task*/
SELECT
    region_name
  , COUNT(*)
FROM 
    employees e
  , departments d
  , locations l
  , countries c
  , regions r
WHERE 
    e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND l.country_id = c.country_id
    AND c.region_id = r.region_id
GROUP BY region_name;


/* 12 task*/
SELECT department_name
FROM 
    employees e
  , departments d
WHERE e.department_id (+) = d.department_id
    AND first_name IS NULL;




















