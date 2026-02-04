#!/bin/bash
set -e

echo "========== Updating system =========="
sudo apt update -y

echo "========== Installing base packages =========="
sudo apt install -y openjdk-11-jdk git maven curl nginx

echo "========== Installing Memcached =========="
sudo apt install -y memcached
sudo systemctl enable memcached
sudo systemctl start memcached

echo "========== Installing RabbitMQ =========="
sudo apt install -y rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server

echo "========== Configuring RabbitMQ user =========="
sudo rabbitmqctl add_user test test || true
sudo rabbitmqctl set_user_tags test administrator
sudo rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

echo "========== Creating Tomcat user =========="
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat || true

echo "========== Downloading Tomcat =========="
cd /tmp
curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz

sudo mkdir -p /opt/tomcat
sudo tar xzvf apache-tomcat-9.0.75.tar.gz -C /opt/tomcat --strip-components=1

sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

echo "========== Creating Tomcat systemd service =========="
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment=JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat

echo "========== Configuring Nginx as reverse proxy =========="
sudo tee /etc/nginx/sites-available/vprofile > /dev/null <<EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

sudo rm -f /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/vprofile /etc/nginx/sites-enabled/vprofile

sudo nginx -t
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "========== Cloning vProfile project =========="
cd /tmp
git clone https://github.com/devopshydclub/vprofile-project.git

echo "========== Building application =========="
cd vprofile-project
mvn clean package -DskipTests

echo "========== Deploying application =========="
sudo rm -rf /opt/tomcat/webapps/*
sudo cp target/vprofile-v2.war /opt/tomcat/webapps/ROOT.war
sudo chown tomcat:tomcat /opt/tomcat/webapps/ROOT.war

sudo systemctl restart tomcat
sudo systemctl restart nginx

echo "========== App bootstrap completed =========="

