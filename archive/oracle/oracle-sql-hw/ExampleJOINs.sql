/*NATURAL JOIN*/
SELECT 
      first_name
    , last_name
    , salary
    , department_id
    , department_name
    , manager_id
FROM employees 
NATURAL JOIN departments;

SELECT * FROM employees NATURAL JOIN countries;

SELECT * FROM employees NATURAL JOIN job_history;
-- ----------------------------------------------------------------------------


/*JOIN USING*/
SELECT 
      first_name
    , last_name
    , salary
    , department_id
    , department_name
    , e.manager_id
FROM employees e 
JOIN departments d 
USING(department_id);

SELECT * FROM regions JOIN countries USING(region_id);

SELECT 
      first_name
    , last_name
    , jh.job_id
    , start_date
    , end_date
FROM employees 
JOIN job_history jh 
USING(employee_id, department_id);
-- ----------------------------------------------------------------------------


/*JOIN ON*/
SELECT * FROM regions r JOIN countries c ON(r.region_id = c.region_id);

SELECT 
      first_name
    , last_name
    , jh.job_id
    , start_date
    , end_date
FROM employees e 
JOIN job_history jh ON(e.employee_id = jh.employee_id);

SELECT * FROM regions JOIN departments ON(region_id*10 = department_id);

SELECT 
      first_name
    , last_name
    , jh.job_id
    , start_date
    , end_date
FROM employees e 
JOIN job_history jh 
ON(e.employee_id = jh.employee_id 
    AND e.department_id = jh.department_id 
    AND salary > 10000);

SELECT 
      first_name
    , department_name
FROM employees e 
JOIN departments d 
ON(e.employee_id = d.manager_id);
-- ----------------------------------------------------------------------------


/*JOIN more*/
SELECT * FROM locations NATURAL JOIN regions NATURAL JOIN countries;

SELECT * FROM job_history;

SELECT * FROM locations 
JOIN countries USING(country_id) 
JOIN regions USING (region_id);

SELECT 
      first_name
    , last_name
    , jh.job_id
    , start_date
    , end_date
    , department_name
FROM employees e 
JOIN job_history jh ON(e.employee_id = jh.employee_id)
JOIN departments d ON(jh.department_id = d.department_id);

SELECT 
      first_name
    , last_name
    , jh.job_id
    , start_date
    , end_date
    , department_name
FROM employees e 
JOIN job_history jh USING(employee_id)
JOIN departments d ON(jh.department_id = d.department_id);

SELECT 
      department_name
    , MIN(salary)
    , MAX(salary)
FROM employees e 
JOIN departments d ON(e.department_id = d.department_id)
GROUP BY department_name 
ORDER BY department_name DESC;
-- ----------------------------------------------------------------------------


/*NONEQUIJOIN with ON*/
SELECT 
      first_name
    , salary
    , min_salary
    , max_salary
FROM employees e 
JOIN jobs j 
ON(e.job_id = j.job_id AND salary*2 < max_salary);

SELECT * FROM locations 
JOIN countries USING(country_id) 
JOIN regions USING (region_id);

SELECT 
      first_name
    , salary
    , min_salary
    , max_salary
FROM employees e 
JOIN jobs j ON(e.job_id = j.job_id  AND
               salary = max_salary);

SELECT 
      first_name
    , salary
    , min_salary
    , max_salary
FROM employees e 
JOIN jobs j ON(e.job_id = j.job_id  AND 
               salary < max_salary);

SELECT 
      first_name
    , salary
    , min_salary
    , max_salary
FROM employees e 
JOIN jobs j ON(e.job_id = j.job_id  AND 
               salary BETWEEN min_salary+2000 AND max_salary-3000);
-- ----------------------------------------------------------------------------


/*SELF JOIN*/
SELECT 
      emp1.employee_id
    , emp1.first_name
    , emp1.manager_id
    , emp2.first_name AS manager_name
FROM employees emp1
JOIN employees emp2 ON(emp1.manager_id = emp2.employee_id);

SELECT 
       emp2.first_name AS manager_name
     , COUNT(*)
FROM employees emp1
JOIN employees emp2 ON(emp1.manager_id = emp2.employee_id)
GROUP BY emp2.first_name 
ORDER BY count(*);
-- ----------------------------------------------------------------------------


/*LEFT OUTER JOIN*/
SELECT 
      employee_id
    , first_name
    , salary
    , department_name
FROM employees e
LEFT OUTER JOIN departments d ON(e.department_id = d.department_id);

SELECT 
      employee_id
    , first_name
    , salary
    , department_name
FROM departments d
LEFT OUTER JOIN employees e ON(e.department_id = d.department_id);

SELECT 
      employee_id
    , first_name
    , salary
    , department_name
FROM departments d
LEFT OUTER JOIN employees e ON(e.department_id = d.department_id)
WHERE department_name LIKE '%v%';

SELECT
      d.department_id
    , department_name
    , first_name
FROM departments d 
LEFT OUTER JOIN employees e ON(e.department_id = d.department_id)
WHERE first_name IS NULL;
-- ----------------------------------------------------------------------------


/*RIGHT OUTER JOIN*/
SELECT 
      employee_id
    , first_name
    , salary
    , department_name
FROM employees e
RIGHT OUTER JOIN departments d ON(e.department_id = d.department_id);

SELECT 
      employee_id
    , first_name
    , salary
    , department_name
FROM departments d
RIGHT OUTER JOIN employees e ON(e.department_id = d.department_id);

SELECT 
      employee_id
    , first_name
    , salary
    , department_name
FROM departments d
RIGHT OUTER JOIN employees e ON(e.department_id = d.department_id)
WHERE department_name LIKE '%v%';

SELECT
      d.department_id
    , department_name
    , first_name
FROM departments d 
RIGHT OUTER JOIN employees e ON(e.department_id = d.department_id)
WHERE first_name IS NULL;
-- ----------------------------------------------------------------------------


/*FULL OUTER JOIN*/
SELECT *
FROM employees e
FULL OUTER JOIN departments d ON(e.department_id = d.department_id);

SELECT *
FROM departments d
FULL OUTER JOIN employees e ON(e.department_id = d.department_id);

SELECT *
FROM departments d
FULL OUTER JOIN employees e ON(e.department_id = d.department_id)
WHERE department_name LIKE '%v%';

SELECT *
FROM departments d 
FULL OUTER JOIN employees e ON(e.department_id = d.department_id)
WHERE first_name IS NULL;
-- ----------------------------------------------------------------------------


/*CROSS JOIN*/
/* number of rows first_table * number of rows second_table = CROSS JOIN*/
SELECT *
FROM employees
CROSS JOIN departments;

/* 25 * 4 = 100 rows*/
SELECT *
FROM countries 
CROSS JOIN regions;

SELECT *
FROM countries 
CROSS JOIN regions
WHERE countries.region_id >= 2;

SELECT *
FROM departments
CROSS JOIN employees
WHERE department_name LIKE '%v%';

SELECT *
FROM departments 
CROSS JOIN employees
WHERE first_name IS NULL;
-- ----------------------------------------------------------------------------

/*Oracle JOIN*/
/*
INNER JOIN (IJ):
SELECT column(s) FROM table_1 t1, table_2 t2
    WHERE t1.column1 = t2.column2; */
SELECT
    first_name
  , last_name
  , salary
  , e.department_id
  , department_name
FROM 
    employees e
  , departments d
WHERE
    e.department_id = d.department_id;


/*
RIGHT OUTER JOIN (ROJ):
SELECT column(s) FROM table_1 t1, table_2 t2
    WHERE t1.column1(+) = t2.column2; */
SELECT 
    first_name
  , last_name
  , salary
  , e.department_id
  , department_name
FROM 
    employees e
  , departments d
WHERE
    e.department_id(+) = d.department_id;

/*
LEFT OUTER JOIN (LOJ):
SELECT column(s) FROM table_1 t1, table_2 t2
    WHERE t1.column1 = t2.column2(+); */
SELECT 
    first_name
  , last_name
  , salary
  , e.department_id
  , department_name
FROM 
    employees e
  , departments d
WHERE
    e.department_id = d.department_id(+);

/*
CROSS JOIN (CJ):
SELECT column(s) FROM table_1 t1, table_2 t2; */
SELECT * FROM countries, regions;

