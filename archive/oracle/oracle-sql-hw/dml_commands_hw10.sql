SELECT * FROM locations2;
/*1 task*/
CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);

/*2 task*/
INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (3, 'home 292', 'Milan', 'IT');
INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (2, '23 oLWow', 'Rome', 'IT');

/*3 task*/
COMMIT;

/*4 task*/
INSERT INTO locations2
VALUES (392, 'home 292', TO_CHAR('23892'), INITCAP('Milan'), 'paroams', UPPER('fr'));
INSERT INTO locations2 
VALUES (2282, '23 oLWow', TO_CHAR('20282'), INITCAP('Rome'), 'son2wln', UPPER('FR'));

/*5 task*/
COMMIT;

/* 6 task */
INSERT INTO locations2 (SELECT * FROM locations WHERE LENGTH(STATE_PROVINCE) > 9);

/* 7 task */
COMMIT;

/* 8 task */
CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);

/* 9 task */
INSERT ALL
    WHEN 2 = 2 
        THEN INTO locations2 
            VALUES (location_id, street_address, postal_code, city, state_province, country_id)
    WHEN country_id IN (SELECT country_id FROM countries WHERE region_id = 1)
        THEN INTO locations4europe (location_id, street_address, city, country_id)
            VALUES (location_id, street_address, city, country_id)
SELECT * FROM locations;


/* 10 task */
COMMIT;

/* 11 task */
UPDATE locations2 
SET postal_code = '23298' 
WHERE postal_code IS NULL; 

/* 12 task */
ROLLBACK;

/* 13 task */
UPDATE locations2 
SET postal_code = (SELECT postal_code FROM locations WHERE location_id = 2600) 
WHERE postal_code IS NULL; 

/* 14 task */
COMMIT;

/* 15 task */
DELETE locations2 WHERE country_id = 'IT';

/* 16 task */
SAVEPOINT first_sp;

/* 17 task */
UPDATE locations2 
SET street_address = 'Sezam st. 18' 
WHERE location_id > 2500;

/* 18 task */
SAVEPOINT second_sp;

/* 19 task */
DELETE locations2 WHERE street_address = 'Sezam st. 18';

/* 20 task */
ROLLBACK TO SAVEPOINT first_sp;

/* 21 task */
COMMIT;











