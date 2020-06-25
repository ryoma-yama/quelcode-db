BEGIN;
UPDATE chats
SET is_file_permission = 0,
  modified_at = CURRENT_TIMESTAMP,
  modify_member_id = 1
WHERE id NOT IN (
    SELECT chat_id
    FROM chats_users
    WHERE user_id = 1
  )
  AND is_deleted = 0;
COMMIT;