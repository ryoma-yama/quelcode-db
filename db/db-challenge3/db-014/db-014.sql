BEGIN;
DELETE FROM chats_users
WHERE chats_users.user_id IN (
    SELECT id
    FROM users
    WHERE is_deleted = 1
  );
COMMIT;