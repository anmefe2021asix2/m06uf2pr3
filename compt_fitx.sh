#!/bin/bash
comptador()
{
	local compte
	local fichero
	
	compte=0
	for fichero in $1/*
	do
		if [[ -s $fichero ]] &&  [[ -x $fichero ]]
		then
			(( compte++ ))		
		fi
	done
	echo "Numero de ficheros: $compte"
}

clear
echo -n "Escribe la direccion completa: "
read dir
comptador $dir

exit 20
