-- Your SQL goes here
ALTER TABLE `recipes` DROP COLUMN `ingredients`;
ALTER TABLE `recipes` DROP COLUMN `instructions`;
ALTER TABLE `recipes` DROP COLUMN `category`;
ALTER TABLE `recipes` ADD COLUMN `category` INTEGER NOT NULL DEFAULT 1;


CREATE TABLE `difficulties`(
	`id` INTEGER NOT NULL PRIMARY KEY,
	`name` TEXT NOT NULL
);

CREATE TABLE `ingredients`(
	`id` INTEGER NOT NULL PRIMARY KEY,
	`recipe_id` INTEGER NOT NULL,
	`name` TEXT NOT NULL
);

CREATE TABLE `instructions`(
	`id` INTEGER NOT NULL PRIMARY KEY,
	`recipe_id` INTEGER NOT NULL,
	`step_number` INTEGER NOT NULL,
	`description` TEXT NOT NULL
);

CREATE TABLE `categories`(
	`id` INTEGER NOT NULL PRIMARY KEY,
	`name` TEXT NOT NULL
);

