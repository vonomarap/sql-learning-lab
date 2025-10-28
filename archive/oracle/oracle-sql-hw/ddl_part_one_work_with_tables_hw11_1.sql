SELECT * FROM friends;

/*1 task*/
CREATE TABLE friends AS 
    (SELECT employee_id id, first_name name, last_name surname
     FROM employees 
     WHERE commission_pct IS NOT NULL);

/*2 task*/
ALTER TABLE friends 
ADD (email VARCHAR(30));

/*3 task*/
ALTER TABLE friends 
MODIFY (email VARCHAR(30) DEFAULT 'no email');

/*4 task*/
INSERT INTO friends (id, name, surname)
VALUES (392, 'Bert', 'Richter');

/*5 task*/
ALTER TABLE friends 
RENAME COLUMN id TO friends_id;

/* 6 task */
DROP TABLE friends;

/* 7 task */
CREATE TABLE friends (
    id NUMBER
  , name VARCHAR(20)
  , surname VARCHAR(20)
  , email VARCHAR(30)
  , salary NUMBER(20,2) DEFAULT 0
  , city VARCHAR(20)
  , birthday DATE DEFAULT ROUND(SYSDATE)
);

/* 8 task */
INSERT INTO friends 
VALUES (200, 'Fed', 'Richter', 'RICHTER', 2000.3, 
        'Rostov-On-Don', TO_DATE('20-AUG-22', 'DD-MON-YYYY'));

/* 9 task */
INSERT INTO friends (id, name, surname, email, city)
VALUES (200, 'Fed', 'Richter', 'RICHTER@mail.com', 'Rostov-On-Don');

/* 10 task */
COMMIT;

/* 11 task */
ALTER TABLE friends 
DROP COLUMN salary;

/* 12 task */
ALTER TABLE friends 
SET UNUSED COLUMN email;

/* 13 task */
ALTER TABLE friends 
SET UNUSED COLUMN birthday;

/* 14 task */
ALTER TABLE friends 
DROP UNUSED COLUMNS;

/* 15 task */
ALTER TABLE friends 
READ ONLY;

/* 16 task */
UPDATE firends 
SET email = 'no email'
WHERE email IS NOT NULL;

/* 17 task */
TRUNCATE TABLE friends;

/* 18 task */
DROP TABLE friends;