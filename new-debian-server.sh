#!/bin/bash

# INIT
function pause(){
   read -t 17 -p "Press any key to continue..."
}
 
# INSTALL
clear
echo "Libs Upgrades"
echo "-------------"
# Apt(Nginx)
echo "deb http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \ | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
# Apt(PHP)
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
# Run()
apt update -y
apt upgrade -y
pause

clear
echo "Minimal Toolset"
echo "---------------"
apt install -y ca-certificates curl dnsutils git gnupg2 lsb-release software-properties-common vim-nox
pause

clear
echo "Firewall"
echo "--------"
apt install -y ufw
ufw allow OpenSSH
ufw enable
ufw status
pause

clear
echo "PHP 7.4"
echo "-------"
apt install -y \
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
pause

clear
echo "Nginx"
echo "-----"
apt install -y nginx
usermod -a -G www-data nginx
chown -R www-data /usr/share/nginx/html
systemctl start nginx
systemctl enable nginx
ufw allow proto tcp from any to any port 80,443
ufw status
pause

clear
