CREATE TABLE `users` 
(
	`id` int NOT NULL UNIQUE AUTO_INCREMENT,
	`first_name` varchar(26) NOT NULL,
	`last_name` varchar(26) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` datetime ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
);

CREATE TABLE `books` 
(
	`id` int NOT NULL UNIQUE AUTO_INCREMENT,
	`gr_id` int NOT NULL,
	`user_id` int NOT NULL,
	`status` varchar(50),
	`rating` tinyint,
	`date_start` datetime,
	`date_end` datetime,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` datetime ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	CHECK (rating<=5),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	FOREIGN KEY (`status`) REFERENCES `read_status` (`status`)
);

CREATE TABLE `reviews` 
(
	`id` int NOT NULL UNIQUE AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`book_id` int NOT NULL,
	`gr_id` int NOT NULL,
	`title` varchar(50) NOT NULL,
	`content` varchar(3000) NOT NULL,
	`public` boolean NOT NULL,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` datetime ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
);

CREATE TABLE `playlists` 
(
	`id` int NOT NULL UNIQUE AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`gr_id` int NOT NULL,
	`public` boolean DEFAULT true,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` datetime ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `lists` 
(
	`id` int NOT NULL UNIQUE AUTO_INCREMENT,
	`user_id` int,
	`title` varchar(50),
	`public` boolean,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` datetime ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `list_books` 
(
	`id` int NOT NULL UNIQUE AUTO_INCREMENT,
	`gr_id` int,
	`list_id` int,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` datetime ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`)
);

CREATE TABLE `read_status` 
(
	`status` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`status`)
);
