\c {DBNAME};

SET client_min_messages TO FATAL;

/* Create table roles */
CREATE TABLE "{PREFIX}_roles" (
	"member_id" integer NOT NULL,
	"role" member_role NOT NULL,
	PRIMARY KEY ("member_id", "role"),
	FOREIGN KEY ("member_id") REFERENCES members("id")
);

/* Create table tribes */
CREATE TABLE "{PREFIX}_tribes" (
	"id" integer NOT NULL,
	"name" varchar(24) NOT NULL,
	"tag" varchar(6) NOT NULL,
	PRIMARY KEY ("id")
);

/* Create table players */
CREATE TABLE "{PREFIX}_players" (
	"id" integer NOT NULL,
	"name" varchar(24) NOT NULL,
	"tribe_id" integer NULL,
	PRIMARY KEY ("id"),
	FOREIGN KEY ("tribe_id") REFERENCES {PREFIX}_tribes("id")
);

/* Create table certificates */
CREATE TABLE "{PREFIX}_certificates" (
	"player_id" integer NOT NULL,
	"role_member_id" integer NOT NULL,
	"role_role" member_role NOT NULL,
	"date" timestamp NOT NULL,
	"end_date" timestamp NOT NULL,
	PRIMARY KEY ("player_id", "date"),
	FOREIGN KEY ("player_id") REFERENCES "{PREFIX}_players"("id"),
	FOREIGN KEY ("role_member_id", "role_role") REFERENCES "{PREFIX}_roles"("member_id", "role"),
	CHECK ("role_role"='ambassador')
);
