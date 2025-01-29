-- This file should undo anything in `up.sql`
ALTER TABLE `recipes` DROP COLUMN `category`;
ALTER TABLE `recipes` ADD COLUMN `ingredients` TEXT NOT NULL;
ALTER TABLE `recipes` ADD COLUMN `instructions` TEXT NOT NULL;
ALTER TABLE `recipes` ADD COLUMN `category` TEXT;


DROP TABLE IF EXISTS `difficulties`;
DROP TABLE IF EXISTS `ingredients`;
DROP TABLE IF EXISTS `instructions`;
DROP TABLE IF EXISTS `categories`;
