BEGIN;
UPDATE users
SET is_deleted = 1
WHERE phone_number IS NULL
  AND cell_number IS NULL;
COMMIT;