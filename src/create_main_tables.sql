\c {DBNAME}

SET client_min_messages TO FATAL;

/* Create member_role type */
CREATE TYPE member_role AS ENUM ('ambassador', 'programmer', 'manager', 'social', 'face');

/* Create sequence for members */
CREATE SEQUENCE {PREFIX}members_id_seq;

/* Create sequence for registrations */
CREATE SEQUENCE {PREFIX}registrations_id_seq;

/* Create table registrations */
CREATE TABLE "{PREFIX}registrations" (
    "id" integer NOT NULL DEFAULT NEXTVAL('{PREFIX}registrations_id_seq'),
    "playerName" varchar(50) NOT NULL,
    "email" varchar(100) NOT NULL,
    "name" varchar(100) NOT NULL,
    "date" timestamp DEFAULT NOW(),
    "function" member_role NOT NULL,
    "letter" varchar(1000) NOT NULL,
    PRIMARY KEY ("id")
);

/* Create table members */
CREATE TABLE "{PREFIX}members" (
    "id" integer NOT NULL DEFAULT NEXTVAL('{PREFIX}members_id_seq'),
    "registration_id" integer NOT NULL,
    "forum_member_id" integer NULL,
    "name" varchar(50) NOT NULL,
    "suspended" boolean NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("registration_id") REFERENCES "{PREFIX}registrations"("id")
);

