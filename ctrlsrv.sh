#!/bin/bash

function mostra_serveis(){
echo "Seleciona un dels serveis"
echo "1) Executa cups"
echo "2) Executa ssh"
echo "3) Executa apache2"
read opcio
	case $opcio in
	
		1)
			ctrl_cups
		;;
		2)
			ctrl_ssh
		;;
		3)
			ctrl_apache2
		;;
	esac
	
}

function ctrl_cups(){
	
	if [[ ! "$(/sbin/service cups status)" =~ "running" ]]
then
    service cups start
    fi
	echo -n "Vol sortir?   's' per si o 'n' per no: "
	read opcio
	case $opcio in
	
		s)
			exit 0
		;;
		n)
		mostra_serveis
		;;
		
	esac
}
function ctrl_ssh(){
	
	if [[ ! "$(/sbin/service ssh status)" =~ "running" ]]
then
    service ssh start
    fi
	echo -n "Vol sortir?   's' per si o 'n' per no: "
	read opcio
	case $opcio in
	
		s)
			exit 0
		;;
		n)
			mostra_serveis
		;;
		
	esac
}
function ctrl_apache2(){
	
	if [[ ! "$(/sbin/service apache2 status)" =~ "running" ]]
then
    service apache2 start
    fi
	echo -n "Vol sortir?   's' per si o 'n' per no: "
	read opcio
	case $opcio in
	
		s)
			exit 0
		;;
		n)
			mostra_serveis
		;;
		
	esac
}
mostra_serveis
exit 0
