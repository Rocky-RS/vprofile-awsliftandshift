#!/bin/bash
set -e

echo "=== Memcached Setup Started ==="

sudo apt update -y
sudo apt install -y memcached

echo "Configuring Memcached..."
sudo sed -i "s/-l 127.0.0.1/-l 0.0.0.0/" /etc/memcached.conf

sudo systemctl enable memcached
sudo systemctl restart memcached

echo "=== Memcached Setup Completed ==="

