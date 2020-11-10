#!/bin/bash

# ------------------------------------------------------------------------------
# Instalación de la pila LAMP
# ------------------------------------------------------------------------------

# Habilitamos el modo de shell para mostrar los comandos que se ejecutan
set -x

# Actualizamos la lista de paquetes
apt update

# Instalamos el servidor web Apache
apt install apache2 -y

# Instalamos el sistema gestor de base de datos
apt install mysql-server -y

# Instalamos los módulos necesarios de PHP
apt install php libapache2-mod-php php-mysql -y

# ------------------------------------------------------------------------------
# Inslación de herramientas adicionales
# ------------------------------------------------------------------------------

# Descargamos Adminer
mkdir /var/www/html/adminer
cd /var/www/html/adminer
wget https://github.com/vrana/adminer/releases/download/v4.7.7/adminer-4.7.7-mysql.php
mv adminer-4.7.7-mysql.php index.php

# Instalamos phpMyAdmin

apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y

# Instalacion de GoAccess

echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install goaccess
mkdir /var/www/html/stats
cp /home/ubuntu/defaul.conf /etc/apache2/sites-availables
# Instalamos la palicacion web
cd /var/www/html
rm -rf iaw-practica-lamp
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git
mv /var/www/html/iaw-practica-lamp/src/* /var/www/html

#importamos scrip
mysql -u root -p$DB_ROOT_PASSWD < /var/www/html/iaw-practica-lamp/db/database.sql

#eliminamos archivo index.htm
rm .rf /var/www/html/index.html
rm -rf /var/www/html/iaw-practica.lamp

#cambio de permisos
chown www-data:www-data * -R




