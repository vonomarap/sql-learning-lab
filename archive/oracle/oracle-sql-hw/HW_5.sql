/*First task*/
SELECT * FROM employees 
WHERE LOWER(first_name) LIKE '%b%';

/*Second task*/
SELECT * FROM employees 
WHERE INSTR(LOWER(first_name), 'a', 1, 2) > 0;

SELECT * FROM employees 
WHERE LOWER(first_name) LIKE('%a%a%');

/*Third task*/
SELECT 
    department_name
  , SUBSTR(department_name, 1, INSTR(department_name, ' ') - 1) first_word
FROM departments
WHERE INSTR(department_name, ' ')  > 0;

/*Fourth task*/
SELECT first_name, SUBSTR(first_name, 2, LENGTH(first_name) - 2) name
FROM employees;

/*Fifth task*/
SELECT * 
FROM employees
WHERE 
    LENGTH(SUBSTR(job_id, INSTR(job_id, '_') + 1)) > 2
    AND SUBSTR(job_id, INSTR(job_id, '_') + 1) != 'CLERK';

/*Sixth task*/
SELECT * 
FROM employees
WHERE hire_date = TRUNC(hire_date, 'MM');

/*Seventh task*/
SELECT * 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

/*Eighth task*/
SELECT TO_CHAR(SYSDATE + 1, 'fm"Tomorrow is" DdspTH "of" Month YYYY')  FROM DUAL;


/*9 task*/
SELECT
    first_name
  , TO_CHAR(hire_date, 'fmddth "of" Month, YYYY') hire_date
FROM employees;


/* 10 task*/
SELECT 
    employee_id
  , first_name
  , TO_CHAR(salary + salary * 0.2, '$99,999.99') new_salary
FROM employees;

/* 11 task*/
SELECT 
    SYSDATE now
  , SYSDATE + 1 / (24 * 60 * 60) plus_second
  , SYSDATE + 1 / (24 * 60) plus_minut
  , SYSDATE + 1 / 24 plus_hour
  , SYSDATE + 1 plus_day
  , ADD_MONTHS(SYSDATE, 1) plus_month
  , ADD_MONTHS(SYSDATE, 12) plus_year
FROM dual;

/* 12 task*/
SELECT
    first_name
  , salary
  , (TO_NUMBER('$12,345.55', '$99,999.99') + salary) new_salary
FROM employees;

/* 13 task*/
SELECT
    first_name
  , hire_date
  , ROUND(MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:MI:SS DD YYYY'),
        hire_date)) number_months
FROM employees;

/* 14 task*/
SELECT
    first_name
  , salary
  , TO_CHAR(salary + salary * NVL(commission_pct, 0), '$99,999.99') full_salary
FROM employees;

/* 15 task*/
SELECT
    first_name
  , last_name
  , NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)),
        'different length', 'same length') match_name
FROM employees;

/* 16 task*/
SELECT
    first_name
  , commission_pct
  , NVL2(commission_pct, 'Yes', 'No') has_bonus
FROM employees;

/* 17 task*/
SELECT 
    first_name
  , COALESCE(commission_pct, manager_id, salary) feature
FROM employees;

/* 18 task*/
SELECT
    first_name
  , salary
  , CASE
        WHEN salary < 5000 THEN 'Low'
        WHEN salary >= 5000 AND salary < 10000 THEN 'Normal'
        WHEN salary >= 10000 THEN 'High'
    END salary_level
FROM employees;


/* 19 task*/
SELECT 
    country_name
  , DECODE(region_id, 
        1, 'Europe', 
        2, 'America', 
        3, 'Asia', 
        4, 'Africa',
        'Unknown') region
FROM countries;
SELECT * FROM regions;

/* 20 task */
SELECT 
    country_name
  , CASE region_id
        WHEN 1 THEN 'Europe'
        WHEN 2 THEN 'America'
        WHEN 3 THEN 'Asia'
        WHEN 4 THEN 'Africa'
        ELSE 'Unknown'
    END region
FROM countries;

/* 21 task */
SELECT 
    first_name
  , salary
  , CASE 
        WHEN salary < 10000 AND commission_pct IS NULL 
            THEN 'BAD'
        WHEN (salary BETWEEN 10000 AND 15000) OR (commission_pct IS NOT NULL)
            THEN 'NORMAL'
        WHEN salary >= 15000
            THEN 'GOOD'
    END worker_conditions
FROM employees;
  

























