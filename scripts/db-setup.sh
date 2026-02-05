#!/bin/bash
set -e

DB_NAME="vprofile"
DB_USER="admin_vp"
DB_PASS="admin_vp"

echo "=== DB EC2 Setup Started ==="

sudo apt update -y
sudo apt install -y mysql-server

echo "Starting MySQL..."
sudo systemctl enable mysql
sudo systemctl start mysql

echo "Configuring database and user..."
sudo mysql <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Allowing remote MySQL access..."
sudo sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

echo "=== DB EC2 Setup Completed ==="

