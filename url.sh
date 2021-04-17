#!/bin/bash

function añade(){
	echo -n "Introduce una URL: "
	read URL
}

function comprueba(){
	curl --connect-timeout 5 $URL > /dev/null 2>&1
	
	if [[ "$?" -eq 0 ]]; then
		echo "Correcto"
	else	
		echo "Incorrecto"
		exit 1;
	fi	
}	

function navegador(){
	echo "Abriendo la siguiente url $URL en el navegador firefox"
	firefox $URL
}

function FUN(){
	añade
	comprueba
	navegador
}
FUN
