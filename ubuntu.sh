#!/bin/sh

echo "# Install common dependencies"
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl \
    software-properties-common \
    vim \
    ca-certificates \
    apt-transport-https \
    libpng-dev \
    openssh-server \
    gnupg2 \
    wget

# echo "# Install apache2"
# sudo apt update
# sudo apt install -y apache2
# sudo systemctl disable apache2
# sudo a2enmod rewrite

# echo "# Install nginx"
# sudo apt update
# sudo apt install -y nginx
# sudo systemctl disable nginx

# echo "# Install PHP7.2"
# sudo apt update
# sudo add-apt-repository ppa:ondrej/php -y
# sudo apt update
# sudo apt install -y libapache2-mod-php7.2 \
#     php7.2 \
#     php7.2-cli \
#     php7.2-common \
#     php7.2-curl \
#     php7.2-gd \
#     php7.2-json \
#     php7.2-mbstring \
#     php7.2-intl \
#     php7.2-mysql \
#     php7.2-xml \
#     php7.2-zip \
#     php7.2-cgi \
#     php7.2-xsl \
#     php7.2-fpm

# echo "# Install Composer"
# sudo apt update
# sudo curl -sS https://getcomposer.org/installer -o composer-setup.php
# sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# sudo sh -c "echo 'precedence ::ffff:0:0/96 100' >> /etc/gai.conf"

echo "# Install MySql"
sudo apt update
sudo apt install -y mysql-server

echo "# Install DBeaver"
sudo apt update
sudo snap install dbeaver-ce

# echo "# Install ABD & Fastboot"
# sudo apt update
# sudo apt install -y android-tools-adb android-tools-fastboot

echo "# Install Docker"
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}

echo "# Install Docker Compose"
sudo apt update
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

echo "# Install Git"
sudo apt update
sudo apt install -y git

echo "# Install NVM"
sudo apt update
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source ~/.bashrc
nvm install node

echo "# Install VS Code"
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
