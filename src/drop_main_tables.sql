\c {DBNAME};

SET client_min_messages TO FATAL;

DROP TABLE IF EXISTS "{PREFIX}members";
DROP TYPE IF EXISTS "member_role";
DROP SEQUENCE IF EXISTS "members_id_seq";
