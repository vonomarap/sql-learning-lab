/*---------------------SINGLE AMPERSAND SUBSTITUTION----------------*/
SELECT first_name, last_name, salary
FROM employees
WHERE employee_id = &ID;

SELECT first_name, last_name, salary
FROM employees
WHERE employee_id = &abc;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = '&name';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = '&name'
    AND salary > &sal;



/*---------------------DOUBLE AMPERSAND SUBSTITUTION----------------*/
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&bukva%'
    AND last_name LIKE '%&bukva%';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&bukva2%'
    AND last_name LIKE '%&bukva2%';



SELECT first_name, last_name, &column 
FROM employees;

SELECT first_name, last_name, &column 
FROM employees
ORDER BY &column2;

SELECT first_name, last_name, &&column 
FROM employees
ORDER BY &column;


SELECT &continue;


SELECT &select_list
FROM &table_name
WHERE &conditions
ORDER BY &column3;


SELECT * FROM students;
UPDATE students SET &column4 = &value WHERE &condition;




/*---------------------DEFINE and UNDEFINE----------------*/
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&bukva2%'
    AND last_name LIKE '%&bukva2%';

UNDEFINE bukva2;

DEFINE;
DEFINE bukva2 = a;

SET DEFINE OFF;
SET DEFINE ON;




/*---------------------VERIFY----------------*/
/* sql languange commands
    sql client control commands */
SET VERIFY OFF;    
SET VERIFY ON;
    
    
    
    
    
    
    
    
    
    
