#!/bin/bash
echo "Ingrese el IP: "
read IP
sudo ufw deny from $IP
echo 
echo 
echo "IP Blockeada $IP Ok" 
