BEGIN;
UPDATE chats c
  JOIN chats_users u ON c.id = u.chat_id
SET c.is_file_permission = 0
WHERE u.user_id <> 1
  AND c.is_deleted = 0
  AND c.modify_member_id = 1;
COMMIT;