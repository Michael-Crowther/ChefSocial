-- This file should undo anything in `up.sql`
ALTER TABLE `recipes` ADD COLUMN `tags` TEXT;
ALTER TABLE `recipes` ADD COLUMN `source` TEXT;


