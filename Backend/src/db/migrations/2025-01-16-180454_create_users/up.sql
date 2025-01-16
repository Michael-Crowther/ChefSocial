-- Your SQL goes here
CREATE TABLE `users`(
	`id` INTEGER NOT NULL PRIMARY KEY,
	`name` TEXT NOT NULL,
	`user_name` TEXT NOT NULL,
	`display_name` TEXT NOT NULL,
	`email` TEXT NOT NULL,
	`password_hash` TEXT NOT NULL
);

