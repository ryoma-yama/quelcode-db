SELECT `id`,
  `chat_name`,
  `chat_description`,
  CASE
    `is_file_permission`
    WHEN '1' then '許可'
    ELSE '禁止'
  END AS `ファイル送信`,
  `is_direct_chat`,
  `is_deleted`,
  `created_at`,
  `create_member_id`,
  `modified_at`,
  `modify_member_id`
FROM `chats`
WHERE `is_deleted` = 0
  AND `chat_description` LIKE '%ダイレクトチャット'
ORDER BY `chats`.`id`;