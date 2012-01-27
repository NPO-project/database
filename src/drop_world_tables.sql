\c {DBNAME};

SET client_min_messages TO FATAL;

/* Drop table certificates */
DROP TABLE IF EXISTS "{PREFIX}_certificates";

/* Drop table players */
DROP TABLE IF EXISTS "{PREFIX}_players";

/* Drop table tribes */
DROP TABLE IF EXISTS "{PREFIX}_tribes";

/* Drop table roles */
DROP TABLE IF EXISTS "{PREFIX}_roles";
