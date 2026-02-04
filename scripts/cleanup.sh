#!/bin/bash

echo "========== STOPPING SERVICES =========="
sudo systemctl stop tomcat nginx mysql memcached rabbitmq-server 2>/dev/null

echo "========== DISABLING SERVICES =========="
sudo systemctl disable tomcat nginx mysql memcached rabbitmq-server 2>/dev/null

echo "========== REMOVING PACKAGES =========="
sudo apt remove -y nginx mysql-server memcached rabbitmq-server tomcat* openjdk-11-* maven
sudo apt autoremove -y
sudo apt autoclean -y

echo "========== REMOVING TOMCAT FILES =========="
sudo rm -rf /opt/tomcat

echo "========== REMOVING TEMP PROJECT FILES =========="
sudo rm -rf /tmp/vprofile-project
sudo rm -rf /tmp/vprofile-db
sudo rm -rf /tmp/*

echo "========== CLEANING /etc/hosts =========="
sudo sed -i '/db01/d' /etc/hosts
sudo sed -i '/rmq01/d' /etc/hosts
sudo sed -i '/mc01/d' /etc/hosts

echo "========== CLEANUP COMPLETE =========="
echo "Local machine is clean now."

