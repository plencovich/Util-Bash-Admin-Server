#!/bin/bash
echo "Ingrese el dominio a parkear: "
read DominioPark
echo "<VirtualHost *:80>" > $DominioPark.conf
echo "	ServerName $DominioPark" >> $DominioPark.conf
echo "	ServerAlias www.$DominioPark" >> $DominioPark.conf
echo "	DocumentRoot /var/www/$DominioPark/public_html" >> $DominioPark.conf
echo "" >> $DominioPark.conf
echo "	<Directory />" >> $DominioPark.conf
echo "		Options FollowSymLinks" >> $DominioPark.conf
echo "		AllowOverride None" >> $DominioPark.conf
echo "	</Directory>" >> $DominioPark.conf
echo "	<Directory /var/www/$DominioPark/public_html>" >> $DominioPark.conf
echo "		Options -Indexes" >> $DominioPark.conf
echo "		AllowOverride All" >> $DominioPark.conf
echo "		Order allow,deny" >> $DominioPark.conf
echo "		allow from all" >> $DominioPark.conf
echo "	</Directory>" >> $DominioPark.conf
echo "" >> $DominioPark.conf
echo "	ErrorLog /var/www/$DominioPark/error.log" >> $DominioPark.conf
echo "	CustomLog /var/www/$DominioPark/access.log combined" >> $DominioPark.conf
echo "" >> $DominioPark.conf
echo "</VirtualHost>" >> $DominioPark.conf
sudo mv $DominioPark.conf /etc/apache2/sites-available/
sudo a2ensite $DominioParkPark.conf
clear
sudo service apache2 restart
echo 
echo 
echo "El Dominio: '$DominioParkPark' se ha agregado Ok"