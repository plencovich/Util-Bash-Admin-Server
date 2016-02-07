#!/bin/bash
echo "Ingrese el dominio: "
echo "Ejemplo: gianatiempo.com.ar"
read Dominio
echo "Ingrese el usuario: "
echo "Ejmplo: bartmdq"
read Usuario
sudo usermod -d /var/www/html/$Dominio -s /bin/false -G sftpuser $Usuario
sudo chown -R root:$Usuario /var/www/$Dominio/public_html
echo 
echo 
echo "Acceso habilitado a '$Usuario' en el dominio '$Dominio'" 