#!/bin/bash
#updating apt in ubuntu
sudo apt update

#installing java on ubuntu as a dependency for Jenkins
sudo apt install default-jre
sudo apt install default-jdk

#installing Jenkins on ubuntu
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins

#setting up firewall for jenkins in ubuntu to access on url
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
