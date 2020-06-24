SELECT users.user_name,
  chats.chat_name,
  SUBSTRING(chats_users.joined_at, 1, 10) AS joined_at
FROM chats_users
  JOIN users ON chats_users.user_id = users.id
  JOIN chats ON chats_users.chat_id = chats.id
WHERE users.is_deleted = 0
  AND chats.is_deleted = 0
ORDER BY chats_users.joined_at;