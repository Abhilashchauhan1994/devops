#!/bin/bash
sudo yum install epel-release -y #installing epel repo
sudo yum update -y #updating server 
sudo yum install wget -y #installing wget tool

#installing rabbitmq prerequestites
cd /tmp/
wget http://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-2.0-1.noarch.rpm
sudo yum -y install erlang socat  #installing erlang and socat

#installing rabbitmq
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
sudo yum install rabbitmq-server -y

#starting and enabling rabbitmq server
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server

#rabbitmq configuration
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator

#restarting rabbitmq
sudo systemctl restart rabbitmq-server