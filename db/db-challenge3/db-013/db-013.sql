BEGIN;
UPDATE users
SET is_deleted = 1,
  modified_at = CURRENT_TIMESTAMP
WHERE phone_number IS NULL
  AND cell_number IS NULL;
COMMIT;