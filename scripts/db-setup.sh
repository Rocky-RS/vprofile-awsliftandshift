#!/bin/bash
set -e

echo "========== Installing MySQL =========="
sudo apt install -y mysql-server

sudo systemctl start mysql
sudo systemctl enable mysql

echo "========== Configuring MySQL =========="
sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Admin@123';
CREATE DATABASE accounts;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin@123';
GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'%';
FLUSH PRIVILEGES;
EOF

echo "========== Importing database schema =========="
cd /tmp
git clone https://github.com/devopshydclub/vprofile-project.git vprofile-db

mysql -uadmin -padmin@123 accounts < vprofile-db/src/main/resources/db_backup.sql

echo "========== Database setup completed =========="

