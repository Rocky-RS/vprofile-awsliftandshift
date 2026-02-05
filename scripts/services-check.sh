#!/bin/bash

echo "=== Service Status Check ==="

systemctl status mysql 2>/dev/null | head -n 5
systemctl status tomcat9 2>/dev/null | head -n 5
systemctl status nginx 2>/dev/null | head -n 5
systemctl status memcached 2>/dev/null | head -n 5
systemctl status rabbitmq-server 2>/dev/null | head -n 5

