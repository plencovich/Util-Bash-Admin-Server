#!/bin/bash
echo "Ingrese el dominio: "
read Dominio
echo "Ingrese el usuario: "
read Usuario
sudo adduser $Usuario
sudo mkdir -p /var/www/$Dominio/public_html
echo "<VirtualHost *:80>" > $Dominio.conf
echo "	ServerName $Dominio" >> $Dominio.conf
echo "	ServerAlias www.$Dominio" >> $Dominio.conf
echo "	DocumentRoot /var/www/$Dominio/public_html" >> $Dominio.conf
echo "" >> $Dominio.conf
echo "	<Directory />" >> $Dominio.conf
echo "		Options FollowSymLinks" >> $Dominio.conf
echo "		AllowOverride None" >> $Dominio.conf
echo "	</Directory>" >> $Dominio.conf
echo "	<Directory /var/www/$Dominio/public_html>" >> $Dominio.conf
echo "		Options -Indexes" >> $Dominio.conf
echo "		AllowOverride All" >> $Dominio.conf
echo "		Order allow,deny" >> $Dominio.conf
echo "		allow from all" >> $Dominio.conf
echo "	</Directory>" >> $Dominio.conf
echo "" >> $Dominio.conf
echo "	ErrorLog /var/www/$Dominio/error.log" >> $Dominio.conf
echo "	CustomLog /var/www/$Dominio/access.log combined" >> $Dominio.conf
echo "" >> $Dominio.conf
echo "</VirtualHost>" >> $Dominio.conf
sudo mv $Dominio.conf /etc/apache2/sites-available/
sudo a2ensite $Dominio.conf
sudo cp /var/www/html/newdomain.php /var/www/$Dominio/public_html/index.php
sudo cp /var/www/html/dominio.jpg /var/www/$Dominio/public_html/dominio.jpg
sudo ln -s /var/www/$Dominio/pubic_html/ /home/$Usuario/html
sudo chown -R $Usuario:$Usuario /var/www/$Dominio/public_html
sudo chmod -R 755 /var/www/$Dominio/
clear
service apache2 restart
echo 
echo 
echo "El Dominio: '$Dominio' se ha creado Ok con el usuario: '$Usuario'." 