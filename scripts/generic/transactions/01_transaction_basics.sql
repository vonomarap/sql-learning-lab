BEGIN;

UPDATE accounts
SET balance = balance - 250
WHERE account_id = 10;

UPDATE accounts
SET balance = balance + 250
WHERE account_id = 20;

COMMIT;
