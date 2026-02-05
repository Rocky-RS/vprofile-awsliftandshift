#!/bin/bash
set -e

echo "=== RabbitMQ Setup Started ==="

sudo apt update -y
sudo apt install -y rabbitmq-server

sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server

echo "Creating RabbitMQ user..."
sudo rabbitmqctl add_user vprofile vprofilepass || true
sudo rabbitmqctl set_user_tags vprofile administrator
sudo rabbitmqctl set_permissions -p / vprofile ".*" ".*" ".*"

echo "=== RabbitMQ Setup Completed ==="

