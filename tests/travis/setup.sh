#!/bin/sh
mysql -e 'create database npo;'
mysql -e 'grant usage on *.* to npo@localhost identified by "npo";'
mysql -e 'grant all privileges on npo.* to npo@localhost;'
echo 'DB_NAME = npo' > config.mk
echo 'DB_USER = root' >> config.mk
echo 'DB_PASS = npo' >> config.mk
echo 'TW_WORLD = NL26' >> config.mk
echo 'TW_SERVER = NL' >> config.mk
