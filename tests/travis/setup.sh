#!/bin/sh
mysql -e 'create database npo;'
echo 'DB_NAME = npo' > config.mk
echo 'DB_USER = npo' >> config.mk
echo 'DB_PASS = npo' >> config.mk
echo 'TW_WORLD = NL26' >> config.mk
echo 'TW_SERVER = NL' >> config.mk
