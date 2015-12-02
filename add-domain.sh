#!/bin/bash
echo "Ingrese el dominio: "
read Dominio
echo "Ingrese el usuario: "
read Usuario
sudo adduser $Usuario
sudo mkdir -p /var/www/$Dominio/public_html
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$Dominio.conf
sudo nano /etc/apache2/sites-available/$Dominio.conf
sudo a2ensite $Dominio.conf
sudo cp /var/www/html/newdomain.php /var/www/$Dominio/public_html/index.php
sudo cp /var/www/html/dominio.jpg /var/www/$Dominio/public_html/dominio.jpg
sudo ln -s /var/www/$Dominio/public_html/ /home/$Usuario/html
sudo chown -R $Usuario:$Usuario /var/www/$Dominio/public_html
sudo chmod -R 755 /var/www/$Dominio/
clear
sudo service apache2 restart
echo 
echo 
echo "El Dominio: '$Dominio' se ha creado Ok con el usuario: '$Usuario'." 
