SELECT COUNT(*) AS 投稿数,
  chats.chat_name
FROM chats
  JOIN posts ON chats.id = posts.chat_id
  JOIN users ON posts.create_member_id = users.id
WHERE users.is_deleted = 0
  AND posts.is_deleted = 0
GROUP BY chats.chat_name
ORDER BY 投稿数 DESC;