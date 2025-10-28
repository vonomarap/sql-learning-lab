/*---------------------------------DDL part 3-----------------------------*/

/*--------------------------------VIEW----------------------------*/ 
/* 
    SIMPLE and COMPLEX
    
    Reasons for use are:
    1) Security
    2) Users can writing easy
    3) Reduces the number of mistakes
    4) It makes table and row names clearer.
    5) Performance 
*/
SELECT * FROM employees;


CREATE VIEW fin_emp AS (
    SELECT employee_id, job_id, salary FROM employees);

CREATE VIEW fin_emp2 AS (
    SELECT department_name, SUM(salary) sum_salary
    FROM employees e 
    JOIN departments d ON (e.department_id = d.department_id)
    GROUP BY department_name);
 
    
SELECT * FROM fin_emp;
SELECT * FROM fin_emp2;


CREATE VIEW emps_with_high_salary2 AS (
    SELECT first_name, last_name FROM employees WHERE salary >= 12000);
    
SELECT * FROM emps_with_high_salary2;
UPDATE employees SET salary = 14000 WHERE employee_id = 103;




/*---------------SIMPLE--------------*/ 
/* Can use DML commands

    * One table
    * No functions
    * No aggregation
*/
SELECT * FROM view_students;
SELECT * FROM students;

INSERT INTO students VALUES (2, 'Bert', 1, 3);
INSERT INTO students VALUES (1, 'Alex', 4, 1);
INSERT INTO students VALUES (3, 'Fed', 3, 5);

CREATE VIEW view_students AS (
    SELECT name, course FROM students);

INSERT INTO view_students VALUES ('Rich', 2);
UPDATE students SET student_id = 10 WHERE name = 'Rich';
DELETE FROM view_students WHERE course = 2;

DELETE FROM view_students WHERE name = 'Fed';

ALTER TABLE students MODIFY (student_id NULL);



/*---------------COMPLEX--------------*/ 
/* Cannot use DML commands

    * Join tables
    * Functions
    * Aggregation
*/
INSERT INTO fin_emp2 VALUES ('awojw', 101010); /* Don't work */
UPDATE fin_emp2 SET department_name = 'awojw' WHERE sum_salary > 5000; /* Don't work */
DELETE FROM fin_emps2; /* Don't work */



CREATE VIEW v102 AS (
    SELECT SUBSTR(name, 2) name, course FROM students);

SELECT * FROM v102;
INSERT INTO v102 VALUES ('fed', 2); /* Don't work */
DELETE FROM v102 WHERE name = 'lex'; /* Work */
UPDATE v102 SET course = 2 WHERE name = 'Fed'; /* Don't work */


CREATE VIEW v103 AS (
    SELECT DISTINCT name, course FROM students);
INSERT INTO v103 VALUES ('fed', 2); /* Don't work */
DELETE FROM v103 WHERE name = 'Bert'; /* Don't work */
UPDATE v103 SET course = 3 WHERE name = 'Fed'; /* Don't work */


CREATE VIEW v104 AS (
    SELECT student_id id, name n, course c FROM students);
INSERT INTO v104 VALUES (6, 'fed', 2); /* Work */
DELETE FROM v104 WHERE n = 'Bert'; /* work */
UPDATE v104 SET c = 3 WHERE n = 'fed'; /* Work */


CREATE VIEW v105 AS (
    SELECT rownum r, name n, course c FROM students);
SELECT * FROM v105;    
INSERT INTO v105 VALUES (16, 'Thomas', 2); /* Don't work */
DELETE FROM v105 WHERE n = 'fed'; /* Don't work */
UPDATE v105 SET c = 3 WHERE n = 'fed'; /* Don't work */




/*---------------CREATE VIEW--------------*/ 
/* CREATE OR REPLACE {FORCE | NOFORCE} VIEW schema.view_name (alias1, alias2,...)
    AS subquery
    WITH CHECK OPTION {CONSTRAINT constraint_name}
    WTTH READ ONLY {CONSTRAINT constraint_name};
*/
SELECT * FROM students;

INSERT INTO students VALUES (2, 'Bert', 1, 3);
INSERT INTO students VALUES (1, 'Alex', 4, 1);
INSERT INTO students VALUES (3, 'Fed', 3, 5);


CREATE OR REPLACE VIEW fin_emp2 AS SELECT * FROM students;
SELECT * FROM fin_emp2;


CREATE FORCE VIEW v201 AS SELECT * FROM students2;
SELECT * FROM v201;


CREATE VIEW v202 AS SELECT * FROM students WHERE course > 3;
SELECT * FROM v202;
INSERT INTO v202 VALUES (7, 'Kat', 1, 5);


SELECT * FROM v203;
CREATE VIEW v203 AS 
    (SELECT * FROM students WHERE course > 2) 
    WITH CHECK OPTION;
INSERT INTO v203 VALUES (11, 'Thomas', 3, 4);
UPDATE v203 SET course = 2 WHERE name = 'Thomas';


SELECT * FROM v204;
CREATE VIEW v204 AS 
    (SELECT * FROM students) 
    WITH READ ONLY;
INSERT INTO v204 VALUES (11, 'Thomas', 3, 4);
UPDATE v204 SET course = 2 WHERE name = 'Thomas';


SELECT * FROM v205;
CREATE VIEW v205 AS
    (SELECT * FROM students)
    WITH READ ONLY CONSTRAINT restriction_ro;
INSERT INTO v205 VALUES (11, 'Thomas', 3, 4);


SELECT * FROM v206;
CREATE VIEW v206 (a, b, c, d) AS 
    (SELECT * FROM students);
    
    
    
    
/*---------------ALTER VIEW--------------*/
/* ALTER view schema.view_name COMPILE; */
CREATE FORCE VIEW v31 AS 
    (SELECT name, last_name FROM students);
SELECT * FROM v31;

ALTER TABLE students ADD (last_name VARCHAR2(15));
ALTER VIEW v31 COMPILE;


DROP VIEW v31;

CREATE VIEW v32 AS 
    (SELECT * FROM v206);

SELECT * FROM v33;
CREATE VIEW v33 AS
     (SELECT *  FROM students WHERE student_id > 4);
     
     
     
     
     
/*--------------------------------SYNONYM----------------------------*/
/* SYNONYM
    -private (schema_name.synonym_name)
    -public (synonym_name)

    CREATE PUBLIC SYNONYM synonym_name
        FOR object_name;
        
    ALTER PUBLIC SYNONYM synonym_name COMPILE:
    
    DROP PUBLIC SYNONYM synonym_name;
*/
SELECT * FROM hr.employees;

CREATE SYNONYM syn1 FOR students; /*PRIVATE SYNONYM*/
SELECT * FROM syn1;
DELETE FROM syn1 WHERE student_id = 11;


CREATE PUBLIC SYNONYM syn1 FOR employees; /*PUBLIC SYNONYM*/

DROP PUBLIC SYNONYM syn1;


DROP TABLE students;
CREATE TABLE students (
    student_id INTEGER
  , name VARCHAR2(15)
  , course NUMBER DEFAULT 3
);

ALTER SYNONYM syn1 COMPILE; 




/*--------------------------------SEQUENCE----------------------------*/
/* CREATE SEQUENCE schema.sequence_name
    INCREMENT BY number             (3) -> 1, 4, 7, ...
    START WITH number               (100) -> 100, 103, 106, ...
    {MAXVALUE number | NOMAXVALUE}  (7) -> 1, 2, ... 6, 7.
    {MINVALUE number | NOMINVALUE}  (10) -> 20, 18, ... 12, 10.
    {CYCLE | NOCYCLE}               (4) -> 1, 2, 3, 4, 1, 2, 3, 4, ...
    {CACHE number | NOCACHE};       formerly generates numbers
*/

/*---------------Part 1--------------*/
CREATE SEQUENCE sn1;
SELECT sn1.NEXTVAL FROM dual;
SELECT sn1.CURRVAL FROM dual;

DROP TABLE students;
DROP TABLE faculties;

CREATE TABLE students (
    id NUMBER
  , name VARCHAR2(20)
  , course NUMBER
  , faculty_id INTEGER
);

CREATE TABLE faculties (
    id NUMBER
  , name VARCHAR2(20)
);


CREATE SEQUENCE seq_student;
CREATE SEQUENCE seq_faculty START WITH 20 INCREMENT BY 5;

INSERT INTO students VALUES (seq_student.NEXTVAL, 'Fed', 3, seq_faculty.CURRVAL);
INSERT INTO students VALUES (seq_student.NEXTVAL, 'Bert', 1, 25);
INSERT INTO faculties VALUES (seq_faculty.NEXTVAL, 'IT');
INSERT INTO faculties VALUES (seq_faculty.NEXTVAL, 'CS');
INSERT INTO faculties VALUES (seq_faculty.NEXTVAL, 'Philology');

SELECT * FROM students;
SELECT * FROM faculties;

CREATE SEQUENCE s2 INCREMENT BY 2 MAXVALUE 19;
SELECT s2.NEXTVAL FROM dual;

CREATE SEQUENCE s3 INCREMENT BY 2 MAXVALUE 19 CYCLE CACHE 3;
SELECT s3.NEXTVAL FROM dual;

CREATE SEQUENCE s4 START WITH 7 INCREMENT BY 4 MAXVALUE 19 CYCLE CACHE 3;
SELECT s4.NEXTVAL FROM dual;



CREATE TABLE students (
    id NUMBER PRIMARY KEY
  , name VARCHAR2(20)
);

CREATE SEQUENCE s5;
INSERT INTO students values (s5.NEXTVAL, 'Bert');
COMMIT;
INSERT INTO students values (s5.NEXTVAL, 'Fed');
ROLLBACK;
INSERT INTO students values (s5.NEXTVAL, 'Thomas');
COMMIT;

SELECT * FROM students;



/*---------------Part 2--------------*/
CREATE TABLE seq (
    n NUMBER
);
INSERT INTO seq VALUES (1);

/* Bad way */
INSERT INTO students VALUES ((SELECT n FROM seq), 'Bert');
UPDATE seq SET n = n+1;
COMMIT;

SELECT * FROM students;
SELECT * FROM seq;

/* ALTER SEQUENCE schema.sequence_name
    INCREMENT BY number             
    {MAXVALUE number | NOMAXVALUE}  
    {MINVALUE number | NOMINVALUE}  
    {CYCLE | NOCYCLE}               
    {CACHE number | NOCACHE};       formerly generates numbers
*/

ALTER SEQUENCE s5 INCREMENT BY 5;
INSERT INTO students values (s5.NEXTVAL, 'Richter');
INSERT INTO students values (s5.NEXTVAL, 'Winter');
INSERT INTO students values (s5.NEXTVAL, 'Thomas');

DROP SEQUENCE s5;


CREATE SEQUENCE s10;
SELECT s10.CURRVAL FROM dual;