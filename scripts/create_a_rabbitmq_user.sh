#!/bin/sh

# By default RabbitMQ creates a user named "guest" with password "guest”.
# You can also create your own administrator account on RabbitMQ server using
# following commands. Change 'mqadminpassword' to your own password.
sudo rabbitmqctl add_user mqadmin mqadminpassword 
sudo rabbitmqctl set_user_tags mqadmin administrator
sudo rabbitmqctl set_permissions -p / mqadmin ".*" ".*" ".*"