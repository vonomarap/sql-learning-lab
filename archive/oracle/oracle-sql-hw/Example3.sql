SELECT first_name, LOWER(first_name) "First name" FROM employees;

SELECT LOWER('Hello JPoN') "First name" FROM dual;
SELECT LOWER('Hello '||' John' ) "First name" FROM dual;
SELECT * FROM employees WHERE LOWER(first_name) = 'david';
SELECT * FROM employees WHERE LOWER(first_name) LIKE '%en%';
SELECT LOWER(2-1+7) "First name" FROM dual;
SELECT * FROM employees WHERE UPPER(last_name) = 'KING';

/*INITCAP*/
SELECT INITCAP('first name, 65afr.dodo') FROM dual;
SELECT INITCAP(first_name) FROM employees;

/*CONCAT*/
SELECT CONCAT(salary*2, hire_date) FROM employees;
SELECT CONCAT('fir', 'fie') FROM dual;
SELECT CONCAT(55, 'fie') FROM dual;
SELECT CONCAT('today is ', SYSDATE) FROM dual;
SELECT CONCAT('Hello ', CONCAT('my ', 'friend')) FROM dual;
SELECT 'Hello ' || 'my ' || 'friend' FROM dual;

/*LENGTH*/
SELECT first_name, LENGTH(first_name) dlina FROM employees;
SELECT LENGTH('Paramonov   Vladislav') FROM dual;
SELECT country_name FROM countries WHERE LENGTH(country_name) > 8;
SELECT country_name FROM countries ORDER BY LENGTH(country_name);

/*LPAD - add characthers by left*/
SELECT LPAD('Paramonov   Vladislav', 38, '*') FROM dual;
SELECT LPAD(first_name, 20, '_|_') FROM employees;
SELECT RPAD(first_name, 10, ' ') || LPAD(salary, 8, ' ') AS Name_and_salary FROM employees;

/*RPAD - add characthers by right*/
SELECT RPAD('Paramonov   Vladislav', 38, '*') FROM dual;
SELECT RPAD('Paramonov', 8, '*') FROM dual; 
SELECT SYSDATE, RPAD(SYSDATE, 6, '!') FROM dual;

/*TRIM( {trailing|leading|both} trimstring from s)*/
SELECT TRIM(trailing 'q' from 'Vladqqqqq') FROM dual;
SELECT TRIM(leading '*' from '*****Vlad***') FROM dual;
SELECT TRIM(both '*' from '*****Vlad***') FROM dual;
SELECT TRIM(both '***' from '*****Vlad***') FROM dual; /*doesn't work*/
SELECT TRIM( ' ' from '   Vlad  ') FROM dual;
SELECT TRIM(' ' from '   Vlad  Paramonov ') FROM dual;
SELECT TRIM('   Vlad  Paramonov  ') FROM dual;
SELECT TRIM(both '8' from '8952834788') FROM dual;
SELECT TRIM(both 7 from 789528347887) FROM dual;

/*INSTR(s, search string, start position, Nth occurrence)*/
SELECT * FROM employees WHERE INSTR(job_id, 'PROG') = 4;
SELECT INSTR('Vlad Paramonov', 'V') FROM dual; /*Output 1*/
SELECT INSTR('Vlad Paramonov', 'v') FROM dual; /*Output 14*/

SELECT INSTR('Vlad Paramonov', 'V', 2) FROM dual; /*Output 0*/
SELECT INSTR('Vlad Paramonov', 'a', 4) FROM dual; /*Output 7*/

SELECT INSTR('Vlad Paramonov', 'a', 4, 1) FROM dual; /*Output 7*/
SELECT INSTR('Vlad Paramonov', 'a', 4, 2) FROM dual; /*Output 9*/
SELECT INSTR('Vlad Paramonov', 'a', 2, 2) FROM dual; /*Output 7*/
SELECT INSTR('Vlad Paramonov', 'a', 2, 3) FROM dual; /*Output 9*/

SELECT INSTR('Vlad Paramonov', 'W') FROM dual; /*Output 0*/
SELECT * FROM employees WHERE INSTR(hire_date, 'MAY') = 4;
SELECT * FROM employees WHERE INSTR(salary, '2') = 2;

/*SUBSTR(s, start position, numbers of characters)*/
SELECT email, SUBSTR(email, 4) FROM employees; 
SELECT email, SUBSTR(email, 4, 2) FROM employees; 
SELECT email, SUBSTR(email, 6, 2) FROM employees; 

SELECT SUBSTR('Hello, Vlad Paramonov', 8, 10) FROM dual; /*Output Vlad Param*/
SELECT SUBSTR('Hello, Vlad Paramonov', 8) FROM dual; /*Output Vladislav Paramonov*/
SELECT SUBSTR('Hello, Vlad Paramonov', 28) FROM dual; /*Output null*/

SELECT SUBSTR('Hello, Vlad Paramonov', -8, 5) FROM dual; /*Output aramo*/
SELECT SUBSTR('Hello, Vlad Paramonov', -9) FROM dual; /*Output Paramonov*/

SELECT salary, SUBSTR(salary, 2) FROM employees; 
SELECT hire_date, SUBSTR(hire_date, 4) FROM employees; 

/*REPLACE(s, search item, replacement item)*/
SELECT REPLACE('Hello, Vlad Paramonov, how are you', 'ar', '*%') FROM dual; /*Output Hello, Vlad P*%amonov, how *%e you*/
SELECT REPLACE('Hello, Vlad Paramonov, how are you', 'a', 'ARR') FROM dual; /*Output Hello, VlARRd PARRrARRmonov, how ARRre you*/
SELECT REPLACE('Hello, Vlad Paramonov, how are you', 'z', 'ARR') FROM dual; /*Output Hello, Vlad Paramonov, how are you*/
SELECT REPLACE('Hello, Vlad Paramonov, how are you', 'a') FROM dual; /*Output Hello, Vld Prmonov, how re you*/

SELECT salary, REPLACE(salary, 1, 9) FROM employees; 
SELECT hire_date, REPLACE(hire_date, '-', '.') FROM employees; 
