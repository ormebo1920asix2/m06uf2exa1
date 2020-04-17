#!/bin/bash

if (( $EUID != 0 )) 
	then echo "El scrip s'ha d'executar en root"
	exit 1
	
	else
	
	function opcio(){
	
		echo -n 'Vols continuar? (S - N) '
		read op
		
		if [[ $op == "S" ]]
		then
			main
		fi
		
		if [[ $op == "N" ]]
		then
			exit 5
		fi
	
	}
	
	function main(){
	clear
	
	echo -n "Escriu el directori a crear dins de /var:"
	read dir
	
	if [ -d /var/$dir ]
	then
		cp /etc/sshd/sshd_config /var/$dir
		cp /etc/cups/cupsd.conf /var/$dir
		echo "Fitxers copiats"
		opcio
	else
		echo "La carpeta no existeix"
	fi
	}
	
	main
fi
