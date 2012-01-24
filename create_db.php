<?php
$con = mysql_connect("localhost","user_name","password");
if (!$con)
	{
	die('Could not connect: ' . mysql_error());
	}
mysql_select_db("db_name", $con);

// Create table tribes
mysql_query("CREATE TABLE `NPO_tribes` (
	`id` int(15) NOT NULL,
	`name` varchar(24) NOT NULL,
	`tag` varchar(6) NOT NULL,
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB") or die(mysql_error());

// Create table players
mysql_query("CREATE TABLE `NPO_players` (
	`id` int(15) NOT NULL,
	`name` varchar(24) NOT NULL,
	`tribe` int(15) NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`tribe`) REFERENCES NPO_tribes(`id`)
	) ENGINE=InnoDB") or die(mysql_error());

// Create table certificates
mysql_query("CREATE TABLE `NPO_certificates` (
	`player` int(15) NOT NULL,
	`date` int(12) NOT NULL,
	`end_date` int(12) NOT NULL,
	PRIMARY KEY (`player`),
	FOREIGN KEY (`player`) REFERENCES NPO_players(`id`)
	) ENGINE=InnoDB") or die(mysql_error());

mysql_close($con);
echo "Tabellen aangemaakt.";
?>
