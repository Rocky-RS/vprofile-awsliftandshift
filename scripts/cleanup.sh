#!/bin/bash

echo "Stopping unnecessary services..."
sudo systemctl stop mysql || true
sudo systemctl stop memcached || true
sudo systemctl stop rabbitmq-server || true

echo "Cleaning temporary files..."
sudo rm -rf /tmp/*

echo "Cleanup completed"

