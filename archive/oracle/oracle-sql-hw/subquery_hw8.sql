/* 1 task*/
SELECT * 
FROM employees 
WHERE LENGTH(first_name) = (SELECT MAX(LENGTH(first_name)) FROM employees);

/* 2 task*/
SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

/* 3 task*/
SELECT city 
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (l.location_id = d. location_id)
GROUP BY city
HAVING SUM(salary) = (
    SELECT MIN(SUM(salary)) 
    FROM employees e
    JOIN departments d ON (e.department_id = d.department_id)
    JOIN locations l ON (l.location_id = d. location_id)
    GROUP BY city);

/* 4 task*/
SELECT * 
FROM employees
WHERE manager_id IN (SELECT employee_id 
                    FROM employees 
                    WHERE salary > 15000);

/* 5 task*/
SELECT * 
FROM departments
WHERE department_id NOT IN (SELECT DISTINCT department_id 
                            FROM employees
                            WHERE department_id IS NOT NULL);
                            
/* 6 task*/
SELECT *
FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT manager_id
                          FROM employees
                          WHERE manager_id IS NOT NULL);
                          
/* 7 task*/
SELECT *
FROM employees
WHERE employee_id IN (SELECT manager_id
                      FROM employees 
                      WHERE manager_id IS NOT NULL
                      GROUP BY manager_id
                      HAVING COUNT(employee_id) > 6);
                    
/* 7 task */
SELECT *
FROM employees e
WHERE (SELECT COUNT(*)
        FROM employees
        WHERE manager_id = e.employee_id) > 6;
                  
/* 8 task*/
SELECT *
FROM employees
WHERE employee_id IN (SELECT employee_id
                      FROM employees e
                      JOIN departments d ON (e.department_id = d.department_id)
                      WHERE d.department_name = 'IT');
                      
/* 8 task*/
SELECT *
FROM employees
WHERE department_id IN (SELECT deparment_id
                        FROM departments
                        WHERE department_name = 'IT');

/* 9 task*/
SELECT *
FROM employees
WHERE hire_date < TO_DATE('01.01.2005', 'DD.MM.YYYY')  
    AND manager_id IN (SELECT employee_id 
                        FROM employees 
                        WHERE TO_CHAR (hire_date, 'YYYY') = '2005');

/* 10 task*/
SELECT *
FROM employees e
JOIN jobs j ON (e.job_id = j.job_id)
WHERE LENGTH(job_title) > 15 
    AND manager_id IN (SELECT employee_id
                        FROM employees
                        WHERE TO_CHAR(hire_date, 'MM') = '01');


























