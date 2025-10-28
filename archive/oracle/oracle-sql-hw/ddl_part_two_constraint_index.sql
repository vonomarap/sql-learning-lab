/*---------------------------------DDL part 2-----------------------------*/

/*--------------------------------CONSTRAINT----------------------------*/ 
/* 
    1) not null
    2) primary key
    3) foreign key
    4) check
    5) unique 
    
    
    object type INDEX
     (primary key and unique)
    */



/*----------------------------NOT NULL------------------------*/
SELECT * FROM students;
DROP TABLE students;
DROP TABLE faculties;

CREATE TABLE students (
    student_id INTEGER
  , name VARCHAR2(15)
  , course NUMBER CONSTRAINT stud_course_notnull NOT NULL
  , faculty_id INTEGER
);

CREATE TABLE students (
    student_id INTEGER
  , name VARCHAR2(15)
  , course NUMBER NOT NULL
  , faculty_id INTEGER
);

CREATE TABLE faculties (
    id NUMBER
  , name VARCHAR2(15)
);

INSERT INTO students 
VALUES (1, 'Fed', 4, 4);

/* Don't work*/
INSERT INTO students 
VALUES (2, 'Vlad', null, 2);

/* Don't work*/
INSERT INTO students (id, name, faculty_id) 
VALUES (3, 'Thomas', 4);


ALTER TABLE students MODIFY (course CONSTRAINT st_course_notnull NOT NULL);
ALTER TABLE students MODIFY (course NOT NULL);
ALTER TABLE students MODIFY (course NULL);

/* Don't work*/
ALTER TABLE students ADD CONSTRAINT st_c_notnull NOT NULL (course);


/*------------------------------*/

CREATE TABLE students (
    student_id INTEGER
  , name VARCHAR2(15)
  , course NUMBER DEFAULT 3
  , faculty_id INTEGER
);

/* Don't work*/
INSERT INTO students 
VALUES (2, 'Vlad', null, 2);

/* Work */
INSERT INTO students (id, name, faculty_id) 
VALUES (10, 'WHOw', 4);


CREATE TABLE students (
    student_id INTEGER
  , name VARCHAR2(15)
  , course NUMBER DEFAULT 3
  , faculty_id INTEGER
);

ALTER TABLE students MODIFY (course NULL);





/*----------------------------UNIQUE------------------------*/
DROP TABLE students;
SELECT * FROM students;

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_unique UNIQUE /* In line level*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
);

CREATE TABLE faculties (
    id NUMBER
  , name VARCHAR2(15)
);

INSERT INTO students VALUES (3, 'Thomas', 4, 282, 8.6, TO_DATE('18-SEP-2020'), 140);
INSERT INTO students VALUES (null, 'Thomas', 4, 282, 8.6, TO_DATE('18-SEP-2020'), 140);
INSERT INTO students VALUES (2, 'Vlad', 2, 2, 5.6, TO_DATE('1-SEP-2010'), 240);


CREATE TABLE students (
    student_id NUMBER
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
  , CONSTRAINT stt_id_unique UNIQUE(student_id) /* In table level*/
);

CREATE TABLE students (
    student_id NUMBER
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
  , UNIQUE(student_id) /* In table level*/
);

CREATE TABLE students (
    student_id NUMBER /*UNIQUE*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
);
ALTER TABLE students ADD CONSTRAINT st_id_unique UNIQUE(student_id);


INSERT INTO faculties VALUES(2, 'CS');
INSERT INTO faculties VALUES(1, 'Phiology');
INSERT INTO faculties VALUES(2, 'Economics');
SELECT * FROM faculties;
ALTER TABLE faculties ADD UNIQUE(id);

UPDATE faculties SET id = 3 WHERE name = 'CS';
DROP TABLE faculties;


ALTER TABLE students MODIFY (student_id CONSTRAINT st_unique UNIQUE);
ALTER TABLE faculties MODIFY (id UNIQUE);
ALTER TABLE students DROP CONSTRAINT st_unique;




/*----------------------------PRIMARY KEY------------------------*/
DROP TABLE students;
SELECT * FROM students;

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY /* UNIQUE and NOT NULL*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
);

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER CONSTRAINT fc_id_pk PRIMARY KEY /* it don't work*/
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
);

CREATE TABLE students (
    student_id NUMBER PRIMARY KEY
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
);

CREATE TABLE students (
    student_id NUMBER
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , avg_score NUMBER(5,2)
  , start_date DATE
  , scholarship INTEGER
  , CONSTRAINT st_id_pk PRIMARY KEY (student_id, name) /* Composition */
);

INSERT INTO students VALUES (3, 'Thomas', 4, 282, 8.6, TO_DATE('18-SEP-2020'), 140);
INSERT INTO students VALUES (null, 'Thomas', 4, 282, 8.6, TO_DATE('18-SEP-2020'), 140);
INSERT INTO students VALUES (2, 'Vlad', 2, 2, 5.6, TO_DATE('1-SEP-2010'), 240);

ALTER TABLE students MODIFY (id CONSTRAINT st_id_pk PRIMARY KEY);
ALTER TABLE students ADD CONSTRAINT st_id_pk PRIMARY KEY (student_id);




/*----------------------------FOREIGN KEY------------------------*/
DROP TABLE students;
DROP TABLE faculties;
SELECT * FROM students;

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY /* UNIQUE and NOT NULL*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER CONSTRAINT st_faculty_fk REFERENCES faculties(id) 
);

CREATE TABLE faculties (
    id NUMBER CONSTRAINT fc_id_pk PRIMARY KEY
  , name VARCHAR2(15)
);


INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Marketing');

INSERT INTO students (student_id, name, faculty_id) 
VALUES (1, 'Fed', 2);

/* Don't work*/
INSERT INTO students (student_id, name, faculty_id)
VALUES (2, 'Bert', 4);

INSERT INTO students (student_id, name, faculty_id)
VALUES (6, 'Bert', 1);


CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY /* UNIQUE and NOT NULL*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , CONSTRAINT st_faculty_fk FOREIGN KEY(faculty_id) REFERENCES faculties(id)
);

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY /* UNIQUE and NOT NULL*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , FOREIGN KEY(faculty_id) REFERENCES faculties(id)
);

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY /* UNIQUE and NOT NULL*/
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER
  , FOREIGN KEY(faculty_id) REFERENCES faculties
);

ALTER TABLE students MODIFY (CONSTRAINT fk faculty_id REFERENCES faculty(id)); /*Bad*/
ALTER TABLE students MODIFY (faculty_id CONSTRAINT fk REFERENCES faculty(id)); /*Better*/
ALTER TABLE students ADD CONSTRAINT fk FOREIGN KEY (faculty_id) 
REFERENCES faculties(id);


/*------------ON DELETE for FOREIGN KEY----------------*/
DROP TABLE students;
DROP TABLE faculties;
SELECT * FROM students;
SELECT * FROM faculties;

CREATE TABLE faculties (
    id NUMBER CONSTRAINT fc_id_pk PRIMARY KEY
  , name VARCHAR2(15)
);

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER REFERENCES faculties(id) ON DELETE CASCADE
);

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER REFERENCES faculties(id) ON DELETE SET NULL
);

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY
  , name VARCHAR2(15)
  , course NUMBER 
  , faculty_id INTEGER NOT NULL
  , CONSTRAINT fk FOREIGN KEY (faculty_id) REFERENCES faculties ON DELETE SET NULL
);

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Economics');
INSERT INTO faculties VALUES (3, 'Marketing');

INSERT INTO students VALUES (1, 'Vlad', 3, 2);
INSERT INTO students VALUES (2, 'Fed', 2, 1);
INSERT INTO students VALUES (3, 'Bert', 5, 2);

DELETE FROM faculties WHERE id = 2;

/* It don't work */
TRUNCATE TABLE faculties;
DROP TABLE faculties;



/*----------------------------CHECK CONSTRAINT------------------------*/
DROP TABLE students;
DROP TABLE faculties;

SELECT * FROM students;
SELECT * FROM faculties;

CREATE TABLE students (
    student_id NUMBER CONSTRAINT st_id_pk PRIMARY KEY
  , name VARCHAR2(15)
  , course NUMBER CONSTRAINT ch CHECK (course > 0 AND course < 6)
  , faculty_id INTEGER
  CONSTRAINT ch2 CHECK(course > id)
);

CREATE TABLE students (
    student_id NUMBER
  , name VARCHAR2(15)
  , email VARCHAR2(20) CHECK (INSTR(email, '@') > 0) CONSTRAINT un UNIQUE 
  , course NUMBER
  , faculty_id INTEGER
);

INSERT INTO students VALUES (1, 'Vlad', 'parmsl.com', 3, 2);
INSERT INTO students VALUES (2, 'Fed', 'feder@com.com', -2, 1);
INSERT INTO students VALUES (3, 'Bert', 'ded@gmail@oulook.com', 15, 2);

UPDATE students SET course = 10 WHERE student_id = 1;

ALTER TABLE students MODIFY (student_id CONSTRAINT ch CHECK (student_id >= 1));
ALTER TABLE students ADD CONSTRAINT ch2 CHECK (course < 20);

CREATE TABLE new_emps2 AS (SELECT * FROM employees);




/*----------------------------INDEX part 1 (B-TREE)------------------------*/
SELECT * FROM employees;

/* INDEXes types
    *B-TREE
    *BITMAP 
    
    
    B-TREE is effectively when:
    1) many rows
    2) number of rows in output / total number of rows = few
    3) many unique values
    4) WHERE or JOIN
    */
SELECT ROWID FROM employees WHERE first_name = 'John';
SELECT * FROM employees WHERE rowid = 'AAAR6sAAEAAAKrGAAt';



/*----------------------------INDEX part 2 (B-TREE)------------------------*/
/* CREATE {UNIQUE | BITMAP} INDEX
        schema.index_name ON schema.table_name (column1, column2, ...);
        
    DROP INDEX schema.index_name; */
        
SELECT * FROM students;
SELECT * FROM faculties;
DROP TABLE students;
DROP TABLE faculties;

CREATE INDEX index1 ON students(student_id);

CREATE TABLE students (
    student_id NUMBER
  , name VARCHAR2(15)
  , course NUMBER
  , faculty_id INTEGER
);

CREATE TABLE faculties (
    id NUMBER
  , name VARCHAR2(15)
);

INSERT INTO students VALUES (1, 'Fed', 3);
INSERT INTO students VALUES (2, 'Bert', 5);
INSERT INTO students VALUES (2, 'Alex', 1);

CREATE UNIQUE INDEX index_2 ON students (name);
CREATE INDEX index_3 ON students(student_id, name);

CREATE UNIQUE INDEX st_in_1 ON students(student_id);
CREATE UNIQUE INDEX f_in_1 ON faculties(id);
CREATE UNIQUE INDEX st_in_2 ON students(course);
CREATE INDEX st_in_3 ON students(name);


ALTER TABLE students ADD CONSTRAINT st_pk PRIMARY KEY (student_id);
ALTER TABLE students ADD CONSTRAINT st_un UNIQUE (course);
ALTER TABLE faculties ADD CONSTRAINT f_pk PRIMARY KEY (id);
ALTER TABLE students ADD CONSTRAINT st_fk FOREIGN KEY (faculty_id) 
REFERENCES faculties(id);


DROP INDEX st_in_1;
DROP INDEX st_in_3;



/*----------------------------BITMAP------------------------*/
/*
    BITMAP
    
    Sex:
    M -> 10101
    F -> 01010
    
    Course:
    1 -> 11000
    2 -> 00101
    3 -> 00010                       10101
                                     00101                          
    course_id = 2 AND sex = M  =>    00101
    
    BITMAP is effectively when:
    1) little unique values
    2) a large number of rows
    3) using boolean logic (AND, OR, NOT)
    */

CREATE BITMAP INDEX b_index_1 ON students(faculty_id);
SELECT * FROM v$version;
















