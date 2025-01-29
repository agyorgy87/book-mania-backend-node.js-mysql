#!/bin/bash
set -e
mysqld --initialize --user=mysql --datadir=/var/run/mysqld --initialize-insecure
mysqld --user=root --datadir=/var/run/mysqld & 
sleep 10
mysql -u root < bookmania_dump.sql
mysql -u root -e "
CREATE USER IF NOT EXISTS 'youruser'@'%' IDENTIFIED BY 'yourpassword';
GRANT SELECT, INSERT, DELETE, UPDATE ON *.* TO 'youruser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
"
npm run start