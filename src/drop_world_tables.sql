\c {DBNAME};

SET client_min_messages TO FATAL;

/* Drop table certificates */
DROP TABLE IF EXISTS "{WORLDPREFIX}certificates";

/* Drop table players */
DROP TABLE IF EXISTS "{WORLDPREFIX}players";

/* Drop table tribes */
DROP TABLE IF EXISTS "{WORLDPREFIX}tribes";

/* Drop table roles */
DROP TABLE IF EXISTS "{WORLDPREFIX}roles";
