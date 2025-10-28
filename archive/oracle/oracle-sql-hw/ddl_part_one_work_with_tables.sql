/*--------------------------------DDL part 1.------------------------------*/
SELECT * FROM dba_objects;
SELECT * FROM user_objects;

SELECT object_type, COUNT(object_type) FROM user_objects
GROUP BY object_type 
ORDER BY object_type;

SELECT object_type, COUNT(object_type) FROM all_objects
GROUP BY object_type 
ORDER BY object_type;

SELECT table_name FROM user_tables;
SELECT column_name, data_type, nullable FROM user_tab_columns
WHERE table_name = 'DEPARTMENTS';

/* DB OBJECTS
    -TABLE
    -VIEW
    -SYNONYM
    -INDEX
    -SEQUENCE
    -and others*/




/*--------------------------------USERS and SCHEMA----------------------------*/
/* SCHEMA - ????? */

/* schema_name.object_name is full name of objects */

/* -user SYS is a owner data_dictionary(???????????? ??????? ??????) 
      You must not use DML commands and can use DDL commands
   -user SYSTEM for ???????????????? ???? ? ???????????.
    
    ____Rules for DATABASE OBJECTS names_____
    1) 1 - 30 symbols
    2) Reserved words (FROM, WHERE, SELECT and e.t.)
    3) Names must be start with a-z
    4) Can use "_", "$", "#" 
    5) a ---Automate convert in---> A 
    
    
 */
CREATE TABLE "3abc def" (
    id NUMBER
);
 
SELECT * FROM "3abc def";

/*  -Separated NAMESPACE for TABEL, VIEW, SEQUENCE, PRIVATE SYNONYM 
    -Separated NAMESPACE for INDEX
    -Separated NAMESPACE for CONSTRAINT
    -Separated PUBLIC NAMESPACE for PUBLIC SYNOYM */
    
/* Others data type:
    -TIMESTAMP WITH TIMEZONE
    -TIMESTAMP WITH LOCAL TIMEZONE
    -INTERVAL YEAR TO MONTH
    -INTERVAL DAY TO SECOND
    -CLOB - Character Large Object
    -BLOB - Binary Large Object
    -LONG 
    -ROWID - row id*/




/*--------------------------------CREATE TABLE-------------------------------*/
/* CREATE TABLE (schema.)table (ORGANIZATION HEAP) 
   (column_name datatype (DEFAULT expr), 
    column_name datatype (DEFAULT expr),
     ...); */

CREATE TABLE students (
    student_id INTEGER,
    name VARCHAR2(15),
    start_date DATE DEFAULT ROUND(SYSDATE),
    scholarship NUMBER(6,2),
    avg_score NUMBER(4,2) DEFAULT 5
) ORGANIZATION HEAP;

SELECT * FROM students;

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (1, 'Bert', TO_DATE('18-OCT-22'), 1500.2, 8.9);
INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (2, 'Fed', TO_DATE('30-OCT-22'), 2000.2, 9.9);
INSERT INTO students (student_id, name, scholarship)
VALUES (3, 'Alex', 200.9);
COMMIT;



/*---------------------------CREATE TABLE with SUBQUERY------------------------*/
/* CREATE TABLE schema.table 
   AS subquery*/

CREATE TABLE new_emps2 
AS (SELECT employee_id, first_name, last_name, salary, department_id 
    FROM employees); 

SELECT * FROM new_emps2;


CREATE TABLE new_dep 
AS (SELECT 
         department_name
        ,MAX(salary) max_salary
        ,MIN(salary) min_salary 
    FROM employees e JOIN departments d
    ON (e.department_id = d.department_id) 
    GROUP BY department_name);

SELECT * FROM new_dep;


CREATE TABLE regions2 AS (SELECT * FROM regions WHERE 5=6); /*For creating a sturcture of table*/
SELECT * FROM regions2;



/*----------------------------------ALTER TABLE--------------------------------*/
/*ADD*/
SELECT * FROM students;
ALTER TABLE students ADD (course NUMBER DEFAULT 3);

/*MODIFY*/
ALTER TABLE students MODIFY (avg_score NUMBER(5,3));
ALTER TABLE students MODIFY (start_date DATE DEFAULT null);

INSERT INTO students (student_id, name) 
VALUES (4, 'Richter');

/*DROP COLUMN*/
ALTER TABLE students DROP COLUMN scholarship;
ALTER TABLE departments DROP COLUMN department_id; /*Don't work */

/* SET/DROP UNSED COLUMN */
ALTER TABLE students SET UNUSED COLUMN start_date;
SELECT start_date FROM students; 
ALTER TABLE students DROP UNUSED COLUMNS;

/*RENAME*/
ALTER TABLE students RENAME COLUMN student_id TO id; 

/*READ ONLY*/
ALTER TABLE students READ ONLY;
DELETE FROM students WHERE id = 1;

/*DROP*/
DROP TABLE students;



/*---------------------------------TRUNCATE TABLE-----------------------------*/
TRUNCATE TABLE students;
/* delete data from table AND DON'T DELETE structure of a table */


/*-----------------------------------DROP TABLE-------------------------------*/
DROP TABLE students;
/* delete data from table AND DELETE structure of a table */

DROP TABLE departments; /* Don't work as It have linked columns (CONSTRAINTS)*/









