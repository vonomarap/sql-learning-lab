/*Input in CONVERSION function*/
SELECT LENGTH(123) FROM dual;

SELECT LENGTH(SYSDATE) FROM dual;

SELECT ADD_MONTHS('05*JAN*2020', 3) FROM dual;
SELECT ADD_MONTHS('05/JAN/2020', 3) FROM dual;
SELECT ADD_MONTHS('05-JAN-2020', 3) FROM dual;


/*===========================================================================*/
/*TO_CHAR(number to char):
TO_CHAR(number, format mask, nls_parameters) = T*/
SELECT TO_CHAR(18) FROM dual; /*18 of type VARCHAR*/

SELECT TO_CHAR(18, '99999') FROM dual; /*Output 18 of type VARCHAR*/
SELECT TO_CHAR(181818, '99999') FROM dual; /*Output ######*/
SELECT TO_CHAR(18, '099999') FROM dual; /*Output 000018*/
SELECT TO_CHAR(1818, '099999') FROM dual; /*Output 001818*/
SELECT TO_CHAR(18.42, '099999.999') FROM dual; /*Output 000018.420*/
SELECT TO_CHAR(18.42, '099999D999') FROM dual; /*Output 000018.420*/

SELECT TO_CHAR(1234567, '99,999,999') FROM dual; /*Output 1,234,567*/
SELECT TO_CHAR(1234567, '99G99G9G999') FROM dual; /*Output 1,23,4,567*/
SELECT TO_CHAR(18, '$0999') FROM dual; /*Output $0018*/

/*L is a local valute that you set at settings*/
SELECT TO_CHAR(18, 'L999') FROM dual; /*Output $18*/

/*MI is a symbol '-' */
SELECT TO_CHAR(-18, '999MI') FROM dual; /*Output 18-*/

/*PR is a symbol <number> */
SELECT TO_CHAR(-18, '09999PR') FROM dual; /*Output <00018>*/
SELECT TO_CHAR(18, '09999PR') FROM dual; /*Output 00018*/

/*S ??????? + ??? -  */
SELECT TO_CHAR(18, 'S09999') FROM dual; /*Output +00018*/
SELECT TO_CHAR(-18, 'S09999') FROM dual; /*Output -00018*/

SELECT 
    first_name, 
    salary*1.111111, 
    TO_CHAR(salary*1.111111, '$999,999.99'), 
    TO_CHAR(salary*1.111111, '$9,999.99')
FROM 
    employees;
/*===========================================================================*/


/*===========================================================================*/
/* TO_CHAR(date to char):
TO_CHAR(date, format mask, nls_parameters) = T*/
SELECT TO_CHAR('23-SEP-83') FROM dual; /*Output 23-SEP-83*/

/*Last number(s) of year */
SELECT TO_CHAR(SYSDATE, 'Y') FROM dual; /*Output 2*/
SELECT TO_CHAR(SYSDATE, 'YY') FROM dual; /*Output 22*/
SELECT TO_CHAR(SYSDATE, 'YYY') FROM dual; /*Output 022*/
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM dual; /*Output 2022*/

/*'RR' last two numbers of year */
SELECT TO_CHAR(SYSDATE, 'RR') FROM dual; /*Output 22*/

/*'YEAR' in format year */
SELECT TO_CHAR(SYSDATE, 'YEAR') FROM dual; /*Output TWENTY TWENTY-TWO*/
SELECT TO_CHAR(SYSDATE, 'year') FROM dual; /*Output twenty twenty-two*/
SELECT TO_CHAR(SYSDATE, 'Year') FROM dual; /*Output Twenty Twenty-Two*/

/*'MM'*/
SELECT TO_CHAR(SYSDATE, 'MM') FROM dual; /*Output 02*/

/*'MON'*/
SELECT TO_CHAR(SYSDATE, 'MON') FROM dual; /*Output FEB*/
SELECT TO_CHAR(SYSDATE, 'mon') FROM dual; /*Output feb*/
SELECT TO_CHAR(SYSDATE, 'Mon') FROM dual; /*Output Feb*/

/*'MONTH'*/
SELECT TO_CHAR(SYSDATE, 'MONTH') FROM dual; /*Output FEBRUARY*/
SELECT TO_CHAR(SYSDATE, 'month') FROM dual; /*Output february*/
SELECT TO_CHAR(SYSDATE, 'Month') FROM dual; /*Output February*/

SELECT hire_date, TO_CHAR(hire_date, 'Month') FROM employees; 

/*Output months translated on russian*/
SELECT 
    hire_date
  , TO_CHAR(hire_date, 'Month', 'NLS_DATE_LANGUAGE = RUSSIAN') 
FROM employees; 

SELECT 
    hire_date
  , TO_CHAR(hire_date, 'Month')||'Hello' 
FROM employees; 

SELECT 
    hire_date
  , TO_CHAR(hire_date, 'fmMonth')||'Hello' 
FROM employees; /*Delete space beetween months and 'Hello'*/

SELECT 
    first_name
  , hire_date 
FROM employees 
WHERE TO_CHAR(hire_date, 'fmMonth') = 'August'; 

/*'d', 'dD', 'ddd'*/
SELECT TO_CHAR(SYSDATE, 'd') FROM dual; /*Output day of week*/
SELECT TO_CHAR(SYSDATE, 'dD') FROM dual; /*Output day of month*/
SELECT TO_CHAR(SYSDATE, 'DDD') FROM dual; /*Output day of year*/

/*'DY' 3 letters from name day of week*/
SELECT TO_CHAR(SYSDATE, 'DY') FROM dual; /*Output TUE*/
SELECT TO_CHAR(SYSDATE, 'Dy') FROM dual; /*Output Tue*/
SELECT TO_CHAR(SYSDATE, 'dy') FROM dual; /*Output tue*/

/*'Day' full name day of week*/
SELECT TO_CHAR(SYSDATE, 'DAY') FROM dual; /*Output TUESDAY*/
SELECT TO_CHAR(SYSDATE, 'Day') FROM dual; /*Output Tuesday*/
SELECT TO_CHAR(SYSDATE, 'day') FROM dual; /*Output tuesday*/

/*'W' week of month*/
SELECT TO_CHAR(SYSDATE, 'w') FROM dual; /*Output 1*/
SELECT TO_CHAR(SYSDATE, 'W') FROM dual; /*Output 1*/
/*'WW' week of year*/
SELECT TO_CHAR(SYSDATE, 'ww') FROM dual; /*Output 05*/
SELECT TO_CHAR(SYSDATE, 'WW') FROM dual; /*Output 05*/

/*'W' quarter of year*/
SELECT TO_CHAR(SYSDATE, 'Q') FROM dual; /*Output 1*/
/*'CC' century */
SELECT TO_CHAR(SYSDATE, 'CC') FROM dual; /*Output 21*/


/*'AM, PM, A.M., P.M.' */
SELECT TO_CHAR(SYSDATE, 'A.M.') FROM dual; /*Output A.M.*/
/*'HH' */
SELECT TO_CHAR(SYSDATE, 'HH') FROM dual; /**/
/*'H24'*/
SELECT TO_CHAR(SYSDATE, 'HH24') FROM dual; /**/
/*'MI' minuts */
SELECT TO_CHAR(SYSDATE, 'MI') FROM dual; /**/
/*'SS' secunds*/
SELECT TO_CHAR(SYSDATE, 'SS') FROM dual; /**/
/*'SSSSS' secunds after midnight */
SELECT TO_CHAR(SYSDATE, 'SSSSS') FROM dual; 
/**/
SELECT TO_CHAR(SYSDATE, 'fmDAY!Mon?yyyy') FROM dual; /**/
/*'sp' is a spell and 'th'*/
SELECT TO_CHAR(SYSDATE, '"quarter "q" of "year"') FROM dual; /**/
SELECT TO_CHAR(SYSDATE, 'DDth " of " month') FROM dual; /*20TH of september*/
SELECT TO_CHAR(SYSDATE, 'YEAR') FROM dual; /**/
SELECT TO_CHAR(SYSDATE, 'yyyysp mmsp') FROM dual; /**/

SELECT TO_CHAR(SYSDATE, 'MIthsp') FROM dual; /*th and sp both*/

SELECT 
    'my colleague with ID = '||employee_id || 
    ' and job_id = ' || job_id || 
    ' joined us on ' || TO_CHAR(hire_date, 'fmDay "the "fmddTH "of "fmMonth YYYY')
FROM employees; /**/
/*===========================================================================*/



/*===========================================================================*/
/* TO_DATE(char to date):
TO_DATE(text, format mask, nls_parameters) = D*/

SELECT TO_DATE('23*SEP!83') FROM dual; /*Output 23-SEP-83*/
SELECT TO_CHAR(TO_DATE('23*SEP!83'), 'dd-mon-yyyy hh24:mi:ss') FROM dual; /*Output 23-sep-1983 00:00:00*/
SELECT TO_DATE('23-SEP-2022') FROM dual; /*Output 23-SEP-22*/

SELECT TO_DATE('18:40 2022!28-Sep', 'HH24:mi yyyy!dd-Mon') FROM dual; /*Output 28-SEP-22*/
SELECT TO_DATE('18:40 2022!Sep', 'HH24:mi yyyy!Mon') FROM dual; /*Output 01-SEP-22*/

SELECT 
        TO_CHAR(TO_DATE('15-Sep-20 17:18:38', 'dd-Mon-RR hh24:mi:ss'),
        'dd-Mon-RR hh24:mi:ss') 
FROM dual; /*Output 15-Sep-20 17:18:38*/

SELECT TO_DATE('18-SEP-10', 'fxDD-MON-YYYY') FROM dual; /*Output error*/

/*??? ????? ??????????? ? ???? TO_CHAR() ?????? ??????*/
SELECT * FROM employees WHERE hire_date > TO_DATE('01-JAN-05', 'dd-MON-RR'); 
SELECT TO_CHAR(TO_DATE('01-JAN-05', 'dd-MON-RR'), 'Month') FROM dual; 

SELECT TO_CHAR(TO_DATE('15?1983$18$17$19/09', 'hh24?YYYY$MI$SS$DD/mm'), 'dd-MON-yyyy hh24:mi:ss')
FROM dual;
/*===========================================================================*/



/*===========================================================================*/
/* TO_NUMBER(number to date):
TO_NUMBER(number, format mask, nls_parameters) = N*/

SELECT TO_NUMBER('$4555.77', '$9999999.999') FROM dual; /*Output 4555.77*/
SELECT TO_NUMBER('$4,555.77', '$9999,999.999') FROM dual; /*Output 4555.77*/
SELECT TO_NUMBER('<4555.77>', '9999999.999PR') FROM dual; /*Output -4555.77*/

SELECT TO_CHAR(3.17, '99.9') FROM dual; /*Output 3.2*/
SELECT TO_NUMBER('3.17', '99.9') FROM dual; /*Output error*/
SELECT TO_NUMBER('3.17', '99.99') FROM dual; /*Output error*/
/*===========================================================================*/
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    


/*===========================================================================*/
/* Nested(?????????) single-row functions*/

SELECT LENGTH(UPPER(SYSDATE)) FROM dual;
SELECT first_name, LENGTH(first_name), ROUND(123.3458827, LENGTH(first_name))
FROM employees;

SELECT 
    first_name, employee_id, 
    LENGTH(employee_id), 
    SUBSTR(first_name, LENGTH(employee_id)) AS substr_length,
    LENGTH(SUBSTR(first_name, LENGTH(employee_id))) AS "Length"
FROM 
    employees;
    
SELECT 
    TO_DATE('18-01-28', 'DD-MM-RR'), 
    TO_CHAR(TO_DATE('18-01-28', 'DD-MM-RR'), 'DAY'), 
    LENGTH(TO_CHAR(TO_DATE('18-01-28', 'DD-MM-RR'), 'fmDAY')) AS "Length"
FROM 
    dual;    
 
    
SELECT 
    first_name,
    last_name,
    TO_NUMBER(SUBSTR(phone_number, INSTR(phone_number, '.') + 1), '999.9999') 
* 10000 AS form_numb
FROM 
    employees
WHERE
    employee_id < 130;    
/*===========================================================================*/



/*===========================================================================*/
/* NVL(value, ifnull) */                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

SELECT NVL(18, 19) FROM dual; /* Output 18 */
SELECT NVL(null, 19) FROM dual; /* Output null */

SELECT first_name, NVL(commission_pct, 0) FROM employees;
SELECT first_name, NVL(SUBSTR(first_name, 6), 'name is too short') FROM employees;

SELECT 
    first_name, 
    commission_pct, 
    NVL(salary * commission_pct, 500) bonus
FROM 
    employees;
    
/*===========================================================================*/


/*===========================================================================*/
/* NVL2(value, ifnotnull, ifnull) */                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

SELECT NVL2(18, 19, 17) FROM dual; /* Output 19 */
SELECT NVL2(null, 19, 17) FROM dual; /* Output 17 */

SELECT 
    first_name, 
    NVL2(commission_pct, commission_pct, 0) 
FROM 
    employees;
/*---------------------------------------------------------------------------*/
SELECT 
    first_name, 
    NVL2(commission_pct, 'have pct', 'don''t have pct') 
FROM
    employees; 
/*===========================================================================*/



/*===========================================================================*/
/* NULLIF(value1, value2) */                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

SELECT NULLIF(18, 18) FROM dual; /* Output null */
SELECT NULLIF(18, 7) FROM dual; /* Output 18 */
SELECT NULLIF(18, 1||5) FROM dual; /* Output error */
SELECT NULLIF(1||5, 18) FROM dual; /* Output error */
SELECT NULLIF('15', 15) FROM dual; /* Output error */

SELECT NULLIF('18-JAN-28', '18/JAN/28') FROM dual; /* Output 18-JAN-28 */
SELECT NULLIF(TO_DATE('18-JAN-28'), TO_DATE('18/JAN/28')) FROM dual; /* Output null */

SELECT 
    country_id,
    country_name,
    SUBSTR(country_name, 1, 2),
    UPPER(SUBSTR(country_name, 1, 2)),
    NULLIF(country_id, UPPER(SUBSTR(country_name, 1, 2))),
    NVL2(NULLIF(country_id, UPPER(SUBSTR(country_name, 1, 2))), 'Sovpadeniya net',
'Sovpadeniya naydeno') AS equal
FROM
    countries; 
/*===========================================================================*/



/*===========================================================================*/
/* COALESCE(value1, value2, ..., valueN) */                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
SELECT COALESCE(1, null, 4) FROM dual; /* Output 1*/
SELECT COALESCE(null, null, 'ok', 'hello') FROM dual; /* Output ok*/
SELECT COALESCE(null, null, null, null) FROM dual; /* Output null*/
SELECT COALESCE(1, 4) FROM dual; /* COALESCE(value1, value2) = NVL(value1, value2)*/

SELECT 
    first_name,
    commission_pct,
    manager_id, 
    salary,
    COALESCE(commission_pct, manager_id, salary) info
FROM employees;
/*===========================================================================*/


/*===========================================================================*/
/* DECODE(expr, comp1, iftrue, comp2, iftrue2, ..., compN, iftrueN, iffalse)*/  
SELECT DECODE(3*4, 12, 'twelve') FROM dual; /*Output twelve*/
SELECT DECODE(3*4, 14, 'twelve') FROM dual; /*Output null*/
SELECT DECODE(3*4, 13, 'thriteen', 14, 'fourteen', 12, 'twelve') FROM dual; /*Output twelve*/

SELECT DECODE(3*4, 13, 'thriteen', 14, 'fourteen', 15, 'twelve', 'not equal') FROM dual; /*Output not equal*/
SELECT DECODE(null, 5, 'ok', null, 77) FROM dual; /*Output twelve*/
SELECT DECODE(2+2+2, 5, 'five', 18/3, 'six', 15-9, 'six2', 'not equal') FROM dual; /*Output six*/

SELECT 
    first_name,
    commission_pct,
    DECODE(commission_pct, null, 'not commission', 0.1, 'less', 0.4, 'bigger', 'middle')
FROM
    employees
WHERE 
    employee_id BETWEEN 149 and 189;
/*===========================================================================*/



/*===========================================================================*/
/* Simple CASE:
CASE expr
WHEN comp1 THEN iftrue1
WHEN comp2 THEN iftrue2
    ...............
WHEN compN THEN iftrueN
ELSE iffalse
END
*/  

SELECT 
CASE 3*8
WHEN 24 THEN 100
END
FROM dual; /*Output 100*/

SELECT 
CASE 3*9
WHEN 11 THEN 'eleven'
WHEN 15 THEN 'fiveteen'
WHEN 27 THEN 'twenty seven1'
WHEN 54/2 THEN 'twenty seven2'
END
FROM dual;

SELECT 
CASE 3*2
WHEN 15 THEN 'fiveteen'
WHEN 27 THEN 'twenty seven1'
WHEN 54/2 THEN 'twenty seven2'
END
FROM dual; /*Output null*/

SELECT 
CASE 3*2
WHEN 15 THEN 'fiveteen'
WHEN 27 THEN 'twenty seven1'
WHEN 54/2 THEN 'twenty seven2'
ELSE 'million'
END
FROM dual; /*Output million*/

SELECT first_name,
CASE LENGTH(first_name)
WHEN 4 THEN 'short name'
WHEN 5 THEN 'middle name'
WHEN 6 THEN 'long name'
WHEN 8 THEN 'very long name'
ELSE 'very very'
END
FROM employees; 
/*===========================================================================*/



/*===========================================================================*/
/* Searched CASE:
CASE 
WHEN cond1 THEN iftrue1
WHEN cond2 THEN iftrue2
    ...............
WHEN condN THEN iftrueN
ELSE iffalse
END
*/  

SELECT 
CASE
WHEN 3*8 = 24 THEN 100
END
FROM dual; /*Output 100*/

SELECT 
CASE 
WHEN 3*9 = 11 THEN 'eleven'
WHEN 3*9 = 15 THEN 'fiveteen'
WHEN 3*9 = 27 THEN 'twenty seven1'
WHEN 3*9 = 54/2 THEN 'twenty seven2'
END
FROM dual; /*Output twenty seven1*/

SELECT 
CASE 
WHEN 3*2 = 15 THEN 'fiveteen'
WHEN 'ok' = 'ok' THEN 'OK'
WHEN 54/2 = 35/7 THEN 'equal'
END AS case_statment
FROM dual; /*Output OK*/

SELECT 
CASE 
WHEN 3*2 = 15 THEN 'fiveteen'
WHEN 'ok' = 'OK' THEN 'OK'
WHEN 54/2 = 35/7 THEN 'equal'
END
FROM dual; /*Output null*/

SELECT
    first_name,
    salary,
    commission_pct,
    CASE
        WHEN LENGTH(first_name) <= 5 THEN 'Work number first'
        WHEN salary*10 > 1000000 THEN 'Work number second'
        WHEN commission_pct IS NOT NULL THEN 'Work number third'
        ELSE 'Don''t work anything'
    END case_statement
FROM employees;
/*===========================================================================*/



















































