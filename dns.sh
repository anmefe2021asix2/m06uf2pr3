#!/bin/bash

if +[$EUID -ne 0]
then
	echo "Este script debe ser ejecutado como usuario root"
	exit 1
fi
clear
RGEX='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9](1,3)$'
echo -n "Inserta la primera direccion de DNS: "
read primDNS
echo -n "Inserta la segunda direccion de DNS: "
read seguDNS

if [[ $primDNS =~ $REGEX ]] && [[ $seguDNS =~ $REGEX ]]
then
	echo "# Direcciones correctas. Procedemos a crear el fichero"  > /etc/resolv.conf
	echo "search etpc.edu" >> /etc/resolv.conf
	echo "nameserver $primDNS" >> /etc/resolv.conf
	echo "nameserver $seguDNS" >> /etc/resolv.conf
	echo "nameserver 8.8.8.8" >> /etc/resolv.conf
	
else
	echo "Direcciones incorrectas. Ningun fichero sera modificado."
	exit 1
fi

exit 0