#!/bin/bash
#https://www.rabbitmq.com/docs/install-rpm
# sudo vi /etc/yum.repos.d/rabbitmq.repo
#copy rabbitmq.repo and run script

sudo dnf update -y

sudo dnf install -y erlang rabbitmq-server

sudo systemctl enable rabbitmq-server

sudo systemctl start rabbitmq-server



