#!/bin/bash

# Update the package list and install updates
echo "Updating package list and installing updates..."
sudo apt update && sudo apt upgrade -y

# Install Java (Jenkins requires Java)
echo "Installing Java..."
sudo apt install -y openjdk-11-jdk

# Verify Java installation
java -version

# Add the Jenkins Debian repository
echo "Adding Jenkins repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package list again
echo "Updating package list with Jenkins repository..."
sudo apt update

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install -y jenkins

# Enable and start Jenkins service
echo "Enabling and starting Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check Jenkins service status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins

# Output the initial Jenkins password location
echo "Jenkins installation completed!"
echo "Access Jenkins at: http://<your_server_ip>:8080"
echo "Find the initial administrator password at: /var/lib/jenkins/secrets/initialAdminPassword"
