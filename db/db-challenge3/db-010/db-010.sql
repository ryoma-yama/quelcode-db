SELECT users.user_name AS ユーザー名,
  投稿日時,
  chats.chat_name AS チャットルーム名
FROM (
    SELECT p.chat_id,
      MAX(p.created_at) AS 投稿日時
    FROM posts p
      JOIN users u ON p.create_member_id = u.id
    WHERE p.is_deleted = 0
      AND u.is_deleted = 0
    GROUP BY p.chat_id
  ) AS latest
  JOIN posts ON latest.chat_id = posts.chat_id
  AND latest.投稿日時 = posts.created_at
  JOIN chats ON posts.chat_id = chats.id
  JOIN users ON posts.create_member_id = users.id
ORDER BY posts.chat_id;