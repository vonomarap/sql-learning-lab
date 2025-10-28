/* 1 task*/
CREATE TABLE test200 (
    id NUMBER
  , name1 VARCHAR2(20)
  , name2 VARCHAR2(20)
  , address1 VARCHAR2(40)
  , address2 VARCHAR2(40)
);

/* 2 task*/
UPDATE test200 SET &mutable_column = &value_ WHERE id = &number_id;
SET VERIFY OFF;
SET VERIFY ON;

/* 3 task*/
SELECT * 
FROM test200 
WHERE name1 = '&&symbol' AND name2 = '&symbol'
    AND address1 = '&&symbol2' AND address2 = '&symbol2';

/* 4 task*/
UNDEFINE symbol;
UNDEFINE symbol2






