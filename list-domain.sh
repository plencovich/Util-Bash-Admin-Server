#!/bin/bash
clear
echo
echo  LISTADO DE DOMINIOS ACTIVADOS:
echo
ls -F /var/www/ | grep '/$' > listado-dominios
tr '/' ' ' <listado-dominios |tee
rm -f listado-dominios
echo
echo
