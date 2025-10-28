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

/*ROUND(n, precision)*/
SELECT ROUND(3.15) FROM dual; /*Output 3*/
SELECT ROUND(3.15784, 1) FROM dual; /*Output 3.2*/
SELECT salary * 3.14, ROUND(salary * 3.14) FROM employees; 
SELECT ROUND(678156.18, -1) FROM dual; /*Output 678160*/
SELECT ROUND(678156.18, -4) FROM dual; /*Output 680.000*/
SELECT first_name, ROUND((SYSDATE-hire_date) * employee_id) bonus FROM employees; 

/*TRUNC(n, precision)*/
SELECT TRUNC(678.15618, 4) FROM dual; /*Output 678.1561*/
SELECT TRUNC(678.15618, 1) FROM dual; /*Output 678.1*/
SELECT TRUNC(678156.18, -4) FROM dual; /*Output 670.000*/
SELECT 
    first_name,
    ROUND((SYSDATE - hire_date) * employee_id) AS bonus1,
    TRUNC((SYSDATE - hire_date) * employee_id) AS bonus2
FROM employees; 

/*MOD(dividend, divisor)*/
SELECT MOD(7, 4) FROM dual; /*Output 3 */
SELECT MOD(4, 7) FROM dual; /*Output 4*/
SELECT MOD(9, 0) FROM dual; /*Output 9*/
SELECT MOD(0, 9) FROM dual; /*Output 0*/
SELECT MOD(37, 5) FROM dual; /*Output 2 */
SELECT MOD(-37, 5) FROM dual; /*Output -2*/
SELECT MOD(37, -5) FROM dual; /*Output 2*/

/*SYSDATE*/
SELECT * FROM JOB_HISTORY;
SELECT * FROM nls_session_parameters WHERE parameter = 'NLS_DATE_FORMAT';
/* If year is in range (0-49) then now century (17 = 2017)*/
/* If year is in range (50-99) then last century (88 = 1988)*/
/* If now year is 1988 and you see 17 then next century */
/* If now year is 1988 in range 87 then now century */
SELECT SYSDATE+6 FROM dual; /*Date + 6 days*/
SELECT SYSDATE+6.8 FROM dual; /*Date + 6 days and 19.2 hour*/
SELECT SYSDATE - hire_date FROM dual; /*Number days*/

/*MONTHS_BETWEEN(start_date, end_date) number months between*/
SELECT employee_id, MONTHS_BETWEEN(end_date, start_date) FROM job_history; 
SELECT MONTHS_BETWEEN('12-FEB-19', '05-JAN-19') FROM dual; /*Number 1. ...*/
SELECT MONTHS_BETWEEN('05-JAN-19', '12-FEB-19') FROM dual; /*Number -1. ...*/
SELECT MONTHS_BETWEEN('18-SEP-19', '17-SEP-19') FROM dual; /*Number 0.999(9)*/

/*ADD_MONTHS(date, number_of_months) number months between*/
SELECT end_date, ADD_MONTHS(end_date, 5) FROM job_history; 
SELECT end_date, ADD_MONTHS(end_date, -5) FROM job_history; 
SELECT end_date, ADD_MONTHS(end_date, 4.5) FROM job_history; /*Igoner number after point*/

SELECT  ADD_MONTHS('30-SEP-19', 1) FROM dual; /*Output 31-OCT-19*/
SELECT  ADD_MONTHS('30-DEC-19', 2) FROM dual; /*Output 29-FEB-20*/
SELECT * FROM employees WHERE MONTHS_BETWEEN('01-JAN-10', hire_date) > 60;

/*NEXT_DAY(date, day_of_the_week)*/
SELECT NEXT_DAY(SYSDATE, 2) FROM dual; /*07-FEB-22*/
SELECT NEXT_DAY(SYSDATE, 4) FROM dual; /*02-FEB-22*/
SELECT NEXT_DAY(SYSDATE, 'Wed') FROM dual; /*02-FEB-22*/
SELECT NEXT_DAY(SYSDATE, 'Wednesday') FROM dual; /*02-FEB-22*/
SELECT NEXT_DAY('31-DEC-22', 'MON')-7 FROM dual; 

/*LAST_DAY(date)*/
SELECT LAST_DAY(SYSDATE) FROM dual; /*28-FEB-22*/
SELECT LAST_DAY('01-APR-14') FROM dual; /*30-APR-14*/

/*ROUND(date, date precision format)*/
SELECT hire_date, ROUND(hire_date, 'CC') FROM employees WHERE employee_id IN (120, 121); /*round to century*/
SELECT hire_date, ROUND(hire_date, 'YYYY') FROM employees WHERE employee_id IN (120, 121); /*round to year*/
SELECT hire_date, ROUND(hire_date, 'Q') FROM employees WHERE employee_id IN (120, 121); /*round to quartal*/
SELECT hire_date, ROUND(hire_date, 'MM') FROM employees WHERE employee_id IN (120, 121); /*round to months*/
SELECT hire_date, ROUND(hire_date, 'DD') FROM employees WHERE employee_id IN (120, 121); /*round to day (from hour)*/
SELECT hire_date, ROUND(hire_date) FROM employees WHERE employee_id IN (120, 121); /*default round to day (from hour)*/

/*TRUNC(date, date precision format)*/
SELECT hire_date, TRUNC(hire_date, 'CC') FROM employees WHERE employee_id IN (120, 121); /*hewed to century*/
SELECT hire_date, TRUNC(hire_date, 'YYYY') FROM employees WHERE employee_id IN (120, 121); /*hewed to year*/
SELECT hire_date, TRUNC(hire_date, 'Q') FROM employees WHERE employee_id IN (120, 121); /*???????? to quartal*/
SELECT hire_date, TRUNC(hire_date, 'MM') FROM employees WHERE employee_id IN (120, 121); /*???????? to months*/
SELECT hire_date, TRUNC(hire_date, 'DD') FROM employees WHERE employee_id IN (120, 121); /*???????? to day (from hour)*/
SELECT hire_date, TRUNC(hire_date) FROM employees WHERE employee_id IN (120, 121); /*default ????????to day (from hour)*/



























