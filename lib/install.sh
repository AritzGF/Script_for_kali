#!/bin/bash
instalar(){
	# Nombre del programa a verificar
	PROGRAMA="$1"

	# Comprobar si el programa está instalado
	if ! command -v "$PROGRAMA" &> /dev/null; then
		clear
		echo -e "\033[1;33mEl programa '$PROGRAMA' no está instalado.\033[0m"
		sleep 1
		echo "Instalando $PROGRAMA..."
		sleep 1

		# Actualizar el índice de paquetes e instalar el programa
	 	sudo apt update
   	 	sudo apt install -y "$PROGRAMA"

   	 	# Confirmar si la instalación fue exitosa
   	 	if command -v "$PROGRAMA" &> /dev/null; then
			echo "-----------------------------------"
   	 		echo -e "\033[32m$PROGRAMA se instaló correctamente\033[0m."
			sleep 2
			clear
   	 	else
   	 		echo "Hubo un problema al instalar $PROGRAMA."
   	 		return 1
   		fi
	return 0
	fi

}

install(){
	# Program name 
	PROGRAM="$1"

	# Check if the program is installed
	if ! command -v "$PROGRAM" &> /dev/null; then
		clear
		echo -e "\033[1;33m'$PROGRAM' is not installed.\033[0m"
		sleep 1
		echo "Installing $PROGRAM..."
		sleep 1

		# Packege update and program installation
	 	sudo apt update
   	 	sudo apt install -y "$PROGRAM"

   	 	# Confirm that the installation was successfull
   	 	if command -v "$PROGRAM" &> /dev/null; then
			echo "-----------------------------------"
   	 		echo -e "\033[32m$PROGRAM was installed succesfully\033[0m."
			sleep 2
			clear
   	 	else
   	 		echo "There was a problem installing $PROGRAM."
   	 		return 1
   		fi
	return 0
	fi

}


