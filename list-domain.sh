#!/bin/bash
clear
echo
echo  LISTADO DE DOMINIOS ACTIVADOS:
echo
du -shc /var/www/* > ~/listado-dominios
perl -pi -e "s[/var/www/][-> ]g" ~/listado-dominios
cat ~/listado-dominios
rm -f ~/listado-dominios
echo
echo