#!/bin/bash
echo "  Ingrese el dominio a parkear: "
read DominioPark
echo.
echo.
echo "  Ingrese el dominio Padre: "
read DominioOrigianl
echo.
echo "<VirtualHost *:80>" > $DominioPark.conf
echo "	ServerName $DominioPark" >> $DominioPark.conf
echo "	ServerAlias www.$DominioPark" >> $DominioPark.conf
echo "	DocumentRoot /var/www/$DominioOrigianl/public_html" >> $DominioPark.conf
echo "" >> $DominioPark.conf
echo "	<Directory />" >> $DominioPark.conf
echo "		Options FollowSymLinks" >> $DominioPark.conf
echo "		AllowOverride None" >> $DominioPark.conf
echo "	</Directory>" >> $DominioPark.conf
echo "	<Directory /var/www/$DominioOrigianl/public_html>" >> $DominioPark.conf
echo "		Options -Indexes" >> $DominioPark.conf
echo "		AllowOverride All" >> $DominioPark.conf
echo "		Order allow,deny" >> $DominioPark.conf
echo "		allow from all" >> $DominioPark.conf
echo "	</Directory>" >> $DominioPark.conf
echo "" >> $DominioPark.conf
echo "	ErrorLog /var/www/$DominioOrigianl/error.log" >> $DominioPark.conf
echo "	CustomLog /var/www/$DominioOrigianl/access.log combined" >> $DominioPark.conf
echo "" >> $DominioPark.conf
echo "</VirtualHost>" >> $DominioPark.conf
sudo mv $DominioPark.conf /etc/apache2/sites-available/
sudo a2ensite $DominioPark.conf
clear
sudo service apache2 restart
echo 
echo 
echo "El Dominio: '$DominioPark' se ha agregado y apunta a '$DominioOrigianl' Ok"