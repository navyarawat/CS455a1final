#!/bin/bash

# Update Package Index
sudo apt update

# Install Apache2, MySQL, PHP
sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli

sudo mysql_secure_installation

# Allow to run Apache on boot up
sudo systemctl enable apache2

# Restart Apache Web Server
sudo systemctl start apache2

# Adjust Firewall
sudo ufw allow in "Apache Full"

# Allow Read/Write for Owner
sudo chmod -R o+w  /var/www/html/

# Create info.php for testing php processing
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
PASS = 160434navya

#sudo mysql
mysql -u root -p root <<MYSQL_SCRIPT
CREATE USER 'navya'@'localhost' IDENTIFIED BY '$PASS';
ALTER USER 'navya'@'localhost' IDENTIFIED BY '160434navya';
GRANT ALL PRIVILEGES ON *.* TO 'navya'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

sudo mysql < initS2.sql

