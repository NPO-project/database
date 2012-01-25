include config.mk

SRC_DIR = src
BUILD_DIR = build
DB_PREFIX = npo_${TW_SERVER}_${TW_WORLD}

SQLEXEC = mysql --user=$(DB_USER) --password=$(DB_PASS)
SQLBUILD = sed 's/{DBNAME}/$(DB_NAME)/' | sed 's/{PREFIX}/$(DB_PREFIX)/' > $(BUILD_DIR)/todo.sql

install: config buildcreate execsql clean
uninstall: config builddrop execsql clean

config:
ifeq (, $(and $(DB_NAME),$(DB_USER),$(DB_PASS),$(TW_WORLD),$(TW_SERVER)))
	@@echo 'incomplete config.mk' >&2 
	@@false
endif

buildcreate:
	@@mkdir -p build
	@@cat ${SRC_DIR}/create_db.sql | $(SQLBUILD)

builddrop:
	@@mkdir -p build
	@@cat ${SRC_DIR}/drop_db.sql | $(SQLBUILD)

execsql:
	@@$(SQLEXEC) < $(BUILD_DIR)/todo.sql

clean:
	@@rm -R ${BUILD_DIR}/*
