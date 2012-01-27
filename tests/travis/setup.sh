#!/bin/sh
mysql --user root -e 'grant usage on *.* to npo@localhost identified by "npo";'
mysql --user root -e 'grant all privileges on npo.* to npo@localhost;'
psql -c 'CREATE USER npo WITH PASSWORD npo;' -U postgres
psql -c 'create database npo;' -U postgres
psql -c 'GRANT ALL PRIVILEGES ON DATABASE npo to npo;' -U postgres
echo 'DB_NAME = npo' > config.mk
echo 'DB_USER = npo' >> config.mk
echo 'DB_PASS = npo' >> config.mk
echo 'TW_WORLD = NL26' >> config.mk
echo 'TW_SERVER = NL' >> config.mk
