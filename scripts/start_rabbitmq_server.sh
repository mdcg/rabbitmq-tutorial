#!/bin/sh

sudo systemctl start rabbitmq-server.service
sudo systemctl enable rabbitmq-server.service
sudo rabbitmqctl status

# To access via browser: http://localhost:15672/