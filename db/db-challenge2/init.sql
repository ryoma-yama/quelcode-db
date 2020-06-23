CREATE TABLE `users` (
      `id` int(11) PRIMARY KEY AUTO_INCREMENT,
      `email` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `user_name` varchar(100) NOT NULL,
      `profile` varchar(1000),
      `phone_number` varchar(13),
      `cell_number` varchar(13),
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL,
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `chats` (
      `id` int(11) PRIMARY KEY AUTO_INCREMENT,
      `chat_name` varchar(100) NOT NULL,
      `chat_description` varchar(1000),
      `is_file_permission` tinyint(1) NOT NULL DEFAULT 1,
      `is_direct_chat` tinyint(1) NOT NULL DEFAULT 0,
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL,
      `create_member_id` int(11) NOT NULL REFERENCES users(id),
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `modify_member_id` int(11) NOT NULL REFERENCES users(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `chats_users` (
      `user_id` int(11) NOT NULL REFERENCES users(id),
      `chat_id` int(11) NOT NULL REFERENCES chats(id),
      `joined_at` datetime NOT NULL,
      PRIMARY KEY(user_id, chat_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `posts` (
      `id` int(11) PRIMARY KEY AUTO_INCREMENT,
      `chat_id` int(11) NOT NULL REFERENCES chats(id),
      `post_message` varchar(1000) NOT NULL,
      `file_name` varchar(100),
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL,
      `create_member_id` int(11) NOT NULL REFERENCES users(id),
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `modify_member_id` int(11) NOT NULL REFERENCES users(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `tasks` (
      `id` int(11) PRIMARY KEY AUTO_INCREMENT,
      `chat_id` int(11) NOT NULL REFERENCES chats(id),
      `task_message` varchar(1000) NOT NULL,
      `charge_member_id` int(11) NOT NULL REFERENCES users(id),
      `due_at` datetime,
      `is_done` tinyint(1) NOT NULL DEFAULT 0,
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL,
      `create_member_id` int(11) NOT NULL REFERENCES users(id),
      `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `modify_member_id` int(11) NOT NULL REFERENCES users(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;