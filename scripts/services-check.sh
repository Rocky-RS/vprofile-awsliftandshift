#!/bin/bash

echo "========== Service Status Check =========="

echo -n "Nginx: "
systemctl is-active nginx || echo "NOT running"

echo -n "Tomcat: "
systemctl is-active tomcat || echo "NOT running"

echo -n "MySQL: "
systemctl is-active mysql || echo "NOT running"

echo -n "Memcached: "
systemctl is-active memcached || echo "NOT running"

echo -n "RabbitMQ: "
systemctl is-active rabbitmq-server || echo "NOT running"

echo "========== Check completed =========="

