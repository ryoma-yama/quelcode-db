SELECT users.user_name AS ユーザー名,
  投稿日時,
  chats.chat_name AS チャットルーム名
FROM (
    SELECT chat_id,
      MAX(created_at) AS 投稿日時
    FROM posts
    WHERE is_deleted = 0
    GROUP BY chat_id
  ) AS latest
  JOIN posts ON latest.chat_id = posts.chat_id
  AND latest.投稿日時 = posts.created_at
  JOIN chats ON posts.chat_id = chats.id
  JOIN users ON posts.create_member_id = users.id
WHERE users.is_deleted = 0
ORDER BY posts.chat_id;