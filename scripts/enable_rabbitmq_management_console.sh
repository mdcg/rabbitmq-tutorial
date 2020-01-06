#!/bin/sh

# Enable the RabbitMQ management console so that you can monitor
# the RabbitMQ server processes from a web browser:
sudo rabbitmq-plugins enable rabbitmq_management
sudo chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/

# Next, you need to setup an administrator user account for accessing
# the RabbitMQ server management console. In the following commands,
# "mqadmin" is the administrator's username, "mqadminpassword" is the password.
# Remember to replace them with your own.
sudo rabbitmqctl add_user mqadmin mqadminpassword
sudo rabbitmqctl set_user_tags mqadmin administrator
sudo rabbitmqctl set_permissions -p / mqadmin ".*" ".*" ".*"