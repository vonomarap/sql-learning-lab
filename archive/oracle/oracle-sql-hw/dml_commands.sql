
/*-------------------------------INSERT---------------------------------------*/
/*--SIMPLE--*/
INSERT INTO countries VALUES ('SW', 'Sweden', 1);
INSERT INTO countries VALUES ('NR', 'Norway', 1);

INSERT INTO countries (country_id, country_name, region_id) 
VALUES ('NR', 'Norway', 1);

INSERT INTO countries (country_id, country_name) 
VALUES ('PR', 'Portugal');

INSERT INTO countries (country_id, country_name, region_id) 
VALUES ('FL', 'Finland', 5); /* error not found id 5*/



/*--Functions--*/
SELECT * FROM regions;
SELECT * FROM employees;

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (211, 'Bertolt', 'BERTOLT', '18-SEP-2019', 'IT_PROG');

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
    VALUES (301, INITCAP('bertoltlws'), UPPER('bertoltl2'), 
    TO_DATE('18-SEP-2022', 'DD-MON-YYYY'), UPPER('it_prog'));
    
    
    
/*--SUBQUERY--*/
CREATE TABLE new_emps (
    emp_id INTEGER,
    name VARCHAR2(20),
    start_date DATE,
    job VARCHAR2(10)
);

INSERT INTO new_emps (emp_id, name, start_date)
   (SELECT employee_id, first_name, hire_date 
    FROM employees WHERE employee_id > 200);
    
INSERT INTO new_emps 
   (SELECT employee_id, first_name, hire_date, job_id
    FROM employees WHERE employee_id > 200);

SELECT * FROM new_emps;



/*--Insert in a few tables--*/
CREATE TABLE emps_with_high_salary (
    name VARCHAR2(20),
    salary INTEGER
);

CREATE TABLE emps_with_dept_100 (
    name VARCHAR(20),
    salary INTEGER
);

CREATE TABLE some_emps (
    name VARCHAR(20),
    salary INTEGER
);

INSERT ALL
    WHEN department_id = 100 
        THEN INTO emps_with_dept_100 VALUES (first_name, salary)
    WHEN salary > 15000 
        THEN INTO emps_with_high_salary (name) VALUES (last_name)
    WHEN 8+2 = 10 
        THEN INTO some_emps (name, salary) VALUES (first_name, salary)  
SELECT 
    first_name
  , last_name
  , salary
  , department_id
FROM employees 
WHERE LENGTH(first_name) > 5;

SELECT * FROM emps_with_dept_100;
SELECT * FROM emps_with_high_salary;
SELECT * FROM some_emps;



/*--Errors--*/
SELECT * FROM employees WHERE employee_id = 200;

INSERT INTO empl VALUES (5, 6); /* Table doesn't exist*/
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('ds', '23w', 1);




/*-------------------------------UPDATE---------------------------------------*/
/*--SIMPLE--*/
/* UPDATE table_name
   SET column(s) = value(s)
   WHERE condition(s); */
   
SELECT * FROM employees;

UPDATE employees SET salary = 10000 WHERE employee_id = 100;
UPDATE employees SET salary = salary*2 WHERE employee_id = 100;

UPDATE employees 
SET salary = 28000, job_id = 'IT_PROG' 
WHERE employee_id = 101;

UPDATE employees 
SET salary = 8000 
WHERE employee_id < 105;

UPDATE employees
SET salary = 20000
WHERE employee_id > 100000;

UPDATE employees
SET  salary = 100; /* Press 'Rollback' or F12*/

UPDATE employees
SET employee_id = null
WHERE employee_id = 100; /* It dosen't work*/



/*--SUBQUERY--*/
/* UPDATE table_name
   SET column(s) = subquery(s)
   WHERE column = subquery; */

UPDATE employees
SET salary = 5000 
WHERE department_id IN (
    SELECT department_id FROM departments WHERE department_name = 'Marketing');

UPDATE employees 
SET salary = (SELECT MAX(salary) FROM employees),
    hire_date = (SELECT MIN(start_date) FROM job_history)
WHERE employee_id = 300;

UPDATE employees
SET salary = (SELECT salary FROM employees WHERE employee_id = 5)
WHERE employee_id = 211;




/*-------------------------------DELETE---------------------------------------*/
/*--SIMPLE--*/
/* DELETE FROM table_name
   WHERE condition(s); */
SELECT * FROM new_emps;

INSERT INTO new_emps (
    SELECT employee_id, first_name, hire_date, job_id FROM employees);

DELETE FROM new_emps;
DELETE FROM new_emps
WHERE emp_id = 211;

DELETE FROM new_emps
WHERE job LIKE '%CLERK%' 
      OR name is null;


/*--SUBQUERY--*/
/* DELETE FROM table_name
   WHERE column = subquery; */
DELETE FROM new_emps
WHERE job IN (
    SELECT DISTINCT(job_id) FROM employees WHERE department_id IN (
        SELECT department_id FROM departments WHERE manager_id = 100));



/*-------------------------------MERGE---------------------------------------*/
/* 
MERGE INTO table_name1 t1
USING {table_name2|subquery} t2
ON (t1.column = t2.column)
    WHEN MATCHED THEN
      UPDATE SET column = value
      DELETE WHERE condition
    WHEN NOT MATCHED THEN
      INSERT(value1, value2)
      VALUES (column1, column2);
*/
DELETE FROM new_emps;

INSERT INTO new_emps (
    SELECT employee_id, first_name, hire_date, job_id 
    FROM employees 
    WHERE employee_id <= 110);

MERGE INTO new_emps ne
USING employees e
    ON (ne.emp_id = e.employee_id)
        WHEN MATCHED THEN
            UPDATE SET ne.start_date = SYSDATE
            DELETE WHERE ne.job LIKE '%IT%'
        WHEN NOT MATCHED THEN
            INSERT (emp_id, name, start_date, job)
            VALUES (employee_id, last_name, hire_date, job_id);
    
SELECT * FROM new_emps;    
    
    
    
/*-------------------------------Transactions---------------------------------*/  
/*   _________ACID__________
    * ATOMICITY - ???????????
    * CONSISTENCY - ???????????????
    * ISOLATION - ???????????????
    * DURABLE - ?????????????

        ______DDL______                          ______DML______                           
     Data Definition Language               Data Manipulation Language

                            ______DCL______
                         Data Control Language
                        
                        
                    ________TCL__________
                Transactional Control Language    
    Commands:
    *Commit    )  (commit and rollback) end up transactions
    *Rollback  ) 
    *Savepoint )  (savepoint help to rollback)
    
    
    ----------------------------------------------------------
    |   insert } -> transaction                              |
    ----------------------------------------------------------
    |   insert ]                                             |
    |   update |                                             |   
    |   delete | -> transaction                              |               
    |   insert ]                                             |  
    ----------------------------------------------------------
    
    
    1) DDL or DCL transaction is closing (Commit)
    2) Exit out tool(SQL Developer) ("commit" or "rollback")
    3) Session is killed (Rollback)
    4) DB crashes (Rollback)
*/


/*-------------------------------Commit---------------------------------*/
DELETE FROM new_emps;

INSERT INTO new_emps (
    SELECT employee_id, first_name, hire_date, job_id 
    FROM employees 
    WHERE employee_id <= 110);

MERGE INTO new_emps ne
USING employees e
    ON (ne.emp_id = e.employee_id)
        WHEN MATCHED THEN
            UPDATE SET ne.start_date = SYSDATE
            DELETE WHERE ne.job LIKE '%IT%'
        WHEN NOT MATCHED THEN
            INSERT (emp_id, name, start_date, job)
            VALUES (employee_id, last_name, hire_date, job_id);
    
    
SELECT * FROM new_emps;    
COMMIT; /* It is ending current transaction*/

DELETE FROM new_emps WHERE name = 'William';
COMMIT;

INSERT INTO new_emps VALUES (1000, 'Vlad', SYSDATE, 'IT_PROG');
UPDATE new_emps SET emp_id = 320 WHERE emp_id = 205;
DELETE FROM new_emps WHERE emp_id = 205;
COMMIT;


/*-------------------------------Rollback---------------------------------*/
/* ROLLBACK TO SAVEPOINT savepoint_name; */

DELETE FROM new_emps;
INSERT INTO new_emps (
    SELECT employee_id, last_name, hire_date, job_id FROM employees);
COMMIT;

SELECT * FROM new_emps;
DELETE FROM new_emps WHERE name = 'King';
ROLLBACK;

INSERT INTO new_emps VALUES (1000, 'Vlad', SYSDATE, 'IT_PROG');
UPDATE new_emps SET emp_id = 320 WHERE emp_id = 205;
DELETE FROM new_emps WHERE emp_id = 201;
ROLLBACK;

INSERT INTO new_emps (
    SELECT employee_id, first_name, hire_date, job_id 
    FROM employees 
    WHERE employee_id <= 110);


SELECT * FROM new_emps;
INSERT INTO new_emps VALUES (1000, 'Vlad', SYSDATE, 'IT_PROG');
UPDATE new_emps SET emp_id = 320 WHERE emp_id = 103;
DELETE FROM new_emps WHERE emp_id = 101;
ROLLBACK;


/*-------------------------------Savepoint---------------------------------*/
/* SAVEPOINT savepoint_name; */
SELECT * FROM new_emps;

INSERT INTO new_emps VALUES (1000, 'Vlad', SYSDATE, 'IT_PROG');
SAVEPOINT s1;
UPDATE new_emps SET emp_id = 320 WHERE emp_id = 103;
SAVEPOINT s2;
DELETE FROM new_emps WHERE emp_id = 101;
ROLLBACK;

ROLLBACK TO SAVEPOINT s2;
COMMIT;
ROLLBACK TO SAVEPOINT s1;
COMMIT;


/*-------------------------------AUTOCOMMIT---------------------------------*/
/* You don't use autocommit*/

/*  set autocommit on;
    set autocommit off; 
OR Tab Tools > Database > Advanced > Autocommit */


/*-----------------------------SELECT FOR UPDATE------------------------------*/
SELECT * FROM new_emps;
UPDATE new_emps SET emp_id = 1320 WHERE emp_id = 108;

SELECT * FROM new_emps FOR UPDATE;
UPDATE new_emps SET emp_id = 1500 WHERE emp_id = 103;



    