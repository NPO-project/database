include config.mk

SRC_DIR = src
BUILD_DIR = build

SQLEXEC = export PGPASSWORD=$(DB_PASS); psql -q --username $(DB_USER) -f
SQLBUILD = sed 's/{DBNAME}/$(DB_NAME)/g' \
	| sed 's/{PREFIX}/$(DB_PREFIX)_/g' \
	| sed 's/{WORLDPREFIX}/$(DB_PREFIX)_$(TW_SERVER)$(TW_WORLD)_/' >> $(BUILD_DIR)/todo.sql
USEMYSQL = 0

install: buildcreate execsql clean
uninstallworld: builddropworld execsql clean
uninstall: builddropworld builddropmain execsql clean

check: clean
ifeq (, $(and $(DB_NAME),$(DB_USER),$(DB_PASS),$(TW_WORLD),$(TW_SERVER)))
	@@echo 'incomplete config.mk' >&2 
	@@false
endif
	@@mkdir -p $(BUILD_DIR)

buildcreate: check
	@@cat $(SRC_DIR)/create_db.sql $(SRC_DIR)/create_main_tables.sql $(SRC_DIR)/create_world_tables.sql | $(SQLBUILD)

builddropworld: check
	@@cat $(SRC_DIR)/drop_world_tables.sql | $(SQLBUILD)

builddropmain:
	@@cat $(SRC_DIR)/drop_main_tables.sql | $(SQLBUILD)

execsql:
ifneq (0, $(USEMYSQL))
	@@cat $(BUILD_DIR)/todo.sql \ 
		| sed 's/"/`/g' \
		| sed 's/\\c/USE/g' \
		| sed '/^CREATE TYPE/d' \
		| sed '/^SET/d' \
		| sed 's/integer/int(11)/g' \
		| sed 's/member_role/ENUM(\x27ambassador\x27, \x27programmer\x27, \x27manager\x27, \x27social\x27)/g' \
		| sed 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/g' \
		| sed 's/NEXTVAL(\x27members_id_seq\x27)/AUTO_INCREMENT/g' \
		| sed '/CREATE SEQUENCE/d' \
		| sed '/^DROP TABLE/d' \
		| sed '/^DROP SEQUENCE/d' > $(BUILD_DIR)/todo.sql
	@@mysql --user=$(DB_USER) --password=$(DB_PASS) < $(BUILD_DIR)/todo.sql
else
	@@$(SQLEXEC) $(BUILD_DIR)/todo.sql
endif

clean:
ifneq (, $(wildcard "$(BUILD_DIR)/todo.sql"))
	@@rm $(BUILD_DIR)/todo.sql
endif
