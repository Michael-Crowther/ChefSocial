-- Your SQL goes here
ALTER TABLE `users` ADD COLUMN `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
ALTER TABLE `users` ADD COLUMN `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;

CREATE TABLE `recipes`(
	`id` INTEGER NOT NULL PRIMARY KEY,
	`name` TEXT NOT NULL,
	`image_urls` TEXT NOT NULL,
	`ingredients` TEXT NOT NULL,
	`instructions` TEXT NOT NULL,
	`category` TEXT,
	`tags` TEXT,
	`prep_time` INTEGER,
	`cook_time` INTEGER,
	`total_time` INTEGER,
	`servings` INTEGER,
	`difficulty` INTEGER,
	`calories` INTEGER,
	`macronutrients` TEXT,
	`rating` FLOAT,
	`review_count` INTEGER,
	`source` TEXT,
	`author` TEXT,
	`notes` TEXT,
	`equipment` TEXT,
	`dietary_info` TEXT,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

