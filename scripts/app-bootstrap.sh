#!/bin/bash
set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Java, Git, Maven..."
sudo apt install -y openjdk-11-jdk git maven curl

echo "Creating tomcat user..."
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat || true

echo "Downloading Tomcat..."
cd /tmp
curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz

sudo mkdir -p /opt/tomcat
sudo tar xzvf apache-tomcat-9.0.75.tar.gz -C /opt/tomcat --strip-components=1

sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

echo "Creating Tomcat systemd service..."
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

echo "Cloning vProfile project..."
cd /tmp
git clone https://github.com/devopshydclub/vprofile-project.git
cd vprofile-project

echo "Building application..."
mvn clean package -DskipTests

echo "Deploying application..."
sudo rm -rf /opt/tomcat/webapps/*
sudo cp target/vprofile-v2.war /opt/tomcat/webapps/ROOT.war
sudo chown tomcat:tomcat /opt/tomcat/webapps/ROOT.war

echo "Starting Tomcat..."
sudo systemctl start tomcat

echo "Application bootstrap completed"

