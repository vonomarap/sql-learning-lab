/* 1 task*/
SELECT * FROM emp1000;
CREATE TABLE emp1000 AS (
    SELECT 
        first_name
      , last_name
      , salary
      , department_id 
    FROM employees
);

/* 2 task*/
SELECT * FROM employees;
CREATE FORCE VIEW v1000 AS (
    SELECT 
        first_name
      , last_name
      , salary
      , department_name
      , e.city
    FROM emp1000 e 
    JOIN departments d ON (e.department_id = d.department_id)
);

/* 3 task*/
ALTER TABLE emp1000 
ADD (city VARCHAR2(20));

/* 4 task*/
ALTER VIEW v1000 COMPILE;

/* 5 task*/
CREATE SYNONYM syn1000 FOR v1000;

/* 6 task*/
DROP VIEW v1000;

/* 7 task*/
DROP SYNONYM syn1000;

/* 8 task*/
DROP TABLE emp1000;

/* 9 task*/
CREATE SEQUENCE seq1000 
    START WITH 12 
    INCREMENT BY 4 
    MAXVALUE 200 
    CYCLE;

/* 10 task*/    
ALTER SEQUENCE seq1000
    NOMAXVALUE
    NOCYCLE;

/* 11 task*/ 
SELECT * FROM employees;
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (seq1000.NEXTVAL, 'Richter', 'RICHTER', SYSDATE, 'IT_PROG');

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (seq1000.NEXTVAL, 'Fed', 'FEDFED', SYSDATE, 'IT_PROG');

/* 12 task*/ 
COMMIT;






































