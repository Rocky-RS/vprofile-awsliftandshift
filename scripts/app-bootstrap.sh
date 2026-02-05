#!/bin/bash
set -e

echo "=== App EC2 Bootstrap Started ==="

sudo apt update -y

echo "Installing Java..."
sudo apt install -y openjdk-11-jdk

echo "Installing Tomcat..."
sudo apt install -y tomcat9 tomcat9-admin

echo "Installing Nginx..."
sudo apt install -y nginx

echo "Starting services..."
sudo systemctl enable tomcat9 nginx
sudo systemctl start tomcat9 nginx

echo "Configuring firewall..."
sudo ufw allow 80
sudo ufw allow 8080 || true

echo "=== App EC2 Bootstrap Completed ==="

