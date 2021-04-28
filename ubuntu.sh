#!/bin/sh

echo "# Install commons"
sudo apt update
sudo apt install -y curl \
    software-properties-common \
    vim \
    ca-certificates \
    apt-transport-https \
    gnupg-agent \
    libpng-dev \
    openssh-server

echo "# Install apache2"
sudo apt update
sudo apt install -y apache2
sudo systemctl disable apache2
sudo a2enmod rewrite

echo "# Install nginx"
sudo apt update
sudo apt install -y nginx
sudo systemctl disable nginx

echo "# Install PHP7.2"
sudo apt update
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y libapache2-mod-php7.2 \
    php7.2 \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    php7.2-gd \
    php7.2-json \
    php7.2-mbstring \
    php7.2-intl \
    php7.2-mysql \
    php7.2-xml \
    php7.2-zip \
    php7.2-cgi \
    php7.2-xsl \
    php7.2-fpm

echo "# Install composer"
sudo apt update
sudo curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo sh -c "echo 'precedence ::ffff:0:0/96 100' >> /etc/gai.conf"

echo "# Install mysql"
sudo apt update
sudo apt install -y mysql-server

echo "# Install ABD & Fastboot"
sudo apt update
sudo apt install -y android-tools-adb android-tools-fastboot

echo "# Install docker"
sudo apt update
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "# Install docker-compose"
sudo apt update
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "# Install git"
sudo apt update
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y git

echo "# Install NodeJS"
sudo apt update
sudo curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt install -y nodejs

echo "# Install Visual sutido code"
sudo apt update
sudo snap install --classic code

echo "# Install Chromium browser"
sudo apt update
sudo apt install -y chromium-browser

echo "# Install Postman"
sudo apt update
sudo snap install postman

echo "# Install Slack"
sudo apt update
sudo snap install slack --classic

echo "# Install Skype"
sudo apt update
sudo snap install skype --classic

echo "# Completed"
echo "# Rebooting"
sudo reboot
