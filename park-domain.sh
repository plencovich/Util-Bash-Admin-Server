#!/bin/bash
echo "Ingrese el dominio a parkear: "
read DominioPark
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$DominioPark.conf
sudo nano /etc/apache2/sites-available/$DominioPark.conf
sudo a2ensite $DominioPark.conf
clear
sudo service apache2 restart
echo 
echo 
echo "El Dominio: '$DominioPark' se ha agregado Ok"
