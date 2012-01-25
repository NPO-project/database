#!/bin/sh
mysql -e 'create database npo;'
echo 'DB_NAME = npo' > config.mk
echo 'DB_USER = root' >> config.mk
echo 'DB_PASS = ' >> config.mk
echo 'TW_WORLD = NL26' >> config.mk
echo 'TW_SERVER = NL' >> config.mk
