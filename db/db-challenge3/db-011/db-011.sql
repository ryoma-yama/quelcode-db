BEGIN;
UPDATE tasks
SET is_done = 1
WHERE created_at BETWEEN '2020-4-26 09:00' AND '2020-4-26 11:30'
  AND is_deleted = 0
  AND modify_member_id = 1;
COMMIT;