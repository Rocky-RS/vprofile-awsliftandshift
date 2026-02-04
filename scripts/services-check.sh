#!/bin/bash

echo "Checking Tomcat..."
systemctl is-active tomcat || echo "Tomcat NOT running"

echo "Checking MySQL..."
systemctl is-active mysql || echo "MySQL NOT running"

echo "Checking Memcached..."
systemctl is-active memcached || echo "Memcached NOT running"

echo "Checking RabbitMQ..."
systemctl is-active rabbitmq-server || echo "RabbitMQ NOT running"

echo "Service check completed"

