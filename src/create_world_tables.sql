\c {DBNAME};

SET client_min_messages TO FATAL;

/* Create table roles */
CREATE TABLE "{WORLDPREFIX}roles" (
	"member_id" integer NOT NULL,
	"role" member_role NOT NULL,
	PRIMARY KEY ("member_id", "role"),
	FOREIGN KEY ("member_id") REFERENCES {PREFIX}members("id")
);

/* Create table tribes */
CREATE TABLE "{WORLDPREFIX}tribes" (
	"id" integer NOT NULL,
	"name" varchar(24) NOT NULL,
	"tag" varchar(6) NOT NULL,
	PRIMARY KEY ("id")
);

/* Create table players */
CREATE TABLE "{WORLDPREFIX}players" (
	"id" integer NOT NULL,
	"name" varchar(24) NOT NULL,
	"tribe_id" integer NULL,
	PRIMARY KEY ("id"),
	FOREIGN KEY ("tribe_id") REFERENCES "{WORLDPREFIX}tribes"("id")
);

/* Create table certificates */
CREATE TABLE "{WORLDPREFIX}certificates" (
	"player_id" integer NOT NULL,
	"role_member_id" integer NOT NULL,
	"role_role" member_role NOT NULL,
	"date" timestamp NOT NULL,
	"end_date" timestamp NOT NULL,
	PRIMARY KEY ("player_id", "date"),
	FOREIGN KEY ("player_id") REFERENCES "{WORLDPREFIX}players"("id"),
	FOREIGN KEY ("role_member_id", "role_role") REFERENCES "{WORLDPREFIX}roles"("member_id", "role"),
	CHECK ("role_role"='ambassador')
);
