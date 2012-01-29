\c {DBNAME};

SET client_min_messages TO FATAL;

DROP TABLE IF EXISTS "{PREFIX}members";
DROP TABLE IF EXISTS "{PREFIX}registrations";
DROP TYPE IF EXISTS "member_role";
DROP SEQUENCE IF EXISTS "{PREFIX}members_id_seq";
DROP SEQUENCE IF EXISTS "{PREFIX}registrations_id_seq"
