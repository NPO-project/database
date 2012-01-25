CREATE DATABASE IF NOT EXISTS {DBNAME};

USE {DBNAME};

/* Create table tribes */
CREATE TABLE IF NOT EXISTS `{PREFIX}_tribes` (
	`id` int(11) NOT NULL,
	`name` varchar(24) NOT NULL,
	`tag` varchar(6) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

/* Create table players */
CREATE TABLE IF NOT EXISTS `{PREFIX}_players` (
	`id` int(11) NOT NULL,
	`name` varchar(24) NOT NULL,
	`tribe_id` int(11) NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`tribe_id`) REFERENCES {PREFIX}_tribes(`id`)
) ENGINE=InnoDB;

/* Create table certificates */
CREATE TABLE IF NOT EXISTS `{PREFIX}_certificates` (
	`player_id` int(11) NOT NULL,
	`date` timestamp NOT NULL,
	`end_date` timestamp NOT NULL,
	PRIMARY KEY (`player_id`, `date`),
	FOREIGN KEY (`player_id`) REFERENCES {PREFIX}_players(`id`)
) ENGINE=InnoDB;

