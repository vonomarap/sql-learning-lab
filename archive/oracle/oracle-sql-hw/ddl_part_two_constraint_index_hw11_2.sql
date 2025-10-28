/* 1 task */
CREATE TABLE address (
    id NUMBER CONSTRAINT ad_id_un UNIQUE 
  , country VARCHAR2(20)
  , city VARCHAR2(30)
);

/* 2 task */
CREATE TABLE friends (
    id NUMBER
  , name VARCHAR2(20)
  , email VARCHAR2(20)
  , address_id NUMBER REFERENCES address(id) ON DELETE SET NULL
  , birthday DATE
  , CONSTRAINT check_name CHECK (LENGTH(name) > 3)
);

/* 3 task */
CREATE UNIQUE INDEX un_index ON friends(id);

/* 4 task */
ALTER TABLE friends 
ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

/* 5 task */
CREATE INDEX fr_email_in ON friends(email);

/* 6 task */
ALTER TABLE friends 
MODIFY (email CONSTRAINT fr_email_nn NOT NULL);

/* 7 task */
DROP TABLE friends;

/* 8 task */
DROP TABLE address;





































