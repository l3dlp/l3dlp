#!/bin/bash

# INIT
function pause(){
   read -t 17 -p "Press any key to continue..."
}
 
# APT
sudo curl -sSL https://packages.sury.org/php/README.txt | sudo bash -x
sudo echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y openssl ca-certificates apt-transport-https wget curl dnsutils git gnupg2 htop lsb-release software-properties-common sshfs vim-nox

# SECURITY
sudo apt install -y ufw
sudo apt install -y fail2ban
sudo ufw allow OpenSSH
sudo ufw allow proto tcp from any to any port 80,443
sudo ufw enable

# PHP 7.4
sudo apt install -y \
php7.4-cli \
php7.4-fpm \
php7.4-common \
php7.4-apcu \
php7.4-apcu-bc \
php7.4-bcmath \
php7.4-curl \
php7.4-gd \
php7.4-gmp \
php7.4-igbinary \
php7.4-imagick \
php7.4-imap \
php7.4-intl \
php7.4-json \
php7.4-mailparse \
php7.4-mbstring \
php7.4-mysql \
php7.4-opcache \
php7.4-readline \
php7.4-soap \
php7.4-tidy \
php7.4-xmlrpc \
php7.4-xml \
php7.4-zip
sudo apt install php8.1 php8.1-fpm php8.1-cli -y

# MYSQL
sudo apt install mysql-client mysql-server 
