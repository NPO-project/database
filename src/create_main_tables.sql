\c {DBNAME}

SET client_min_messages TO FATAL;

/* Create member_role type */
CREATE TYPE member_role AS ENUM ('ambassador', 'programmer', 'manager', 'social');

/* Create sequence for members */
CREATE SEQUENCE {PREFIX}members_id_seq;

/* Create table members */
CREATE TABLE "{PREFIX}members" (
	"id" integer NOT NULL DEFAULT NEXTVAL('{PREFIX}members_id_seq'),
	"forum_members_id" integer NULL,
	"name" varchar(50) NOT NULL,
	"suspended" boolean NOT NULL DEFAULT FALSE,
	PRIMARY KEY ("id")
);
