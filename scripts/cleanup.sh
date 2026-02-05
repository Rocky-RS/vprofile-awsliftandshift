#!/bin/bash

echo "Stopping services..."
sudo systemctl stop nginx tomcat9 mysql memcached rabbitmq-server || true

echo "Cleanup completed."

