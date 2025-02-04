#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/config/config.env"
source "${DIR}/data/tables/Tablas.sh"
source "${DIR}/lib/config.sh"
source "${DIR}/lib/install.sh"

#Funcion Saludo
saludo(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=lolcat
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------


	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=toilet
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------


	clear
	toilet --metal -f mono12 HELLO
	cat <<EOF
             *     ,MMM8&&&.            *
                  MMMM88&&&&&    .
                 MMMM88&&&&&&&
     *           MMM88&&&&&&&&
                 MMM88&&&&&&&&
                 'MMM88&&&&&&'
                   'MMM8&&&'      *
          |\___/|
         =) ^Y^ (=            .              '
          \  ^  /
           )=*=(       *
EOF
	echo "          /     \ "
	echo "          |     | "
	echo "         /| | | |\ "
	echo "         \| | |_|/\ "
	echo "  _/\_/\_//_// ___/\_/\_/\_/\_/\_/\_/\_/\_/\_"
	cat <<EOF
  |  |  |  | \_) |  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
EOF
	toilet --metal -f mono12 CAT
	sleep 2
}
#Seleccion de logs para analizarlo
logs(){
	clear
	log="*.log"
	while true; do
	read -p "¿quieres buscar algún log en concreto? (y/n): " log_p
	#Buscaqueda de logs con find
	if [[ "$log_p" == "si" ]] || [[ "$log_p" == "yes" ]] || [[ "$log_p" == "s" ]] || [[ "$log_p" == "y" ]]; then
		read -p "especifica tu busqueda: " log
		find / type f -name "$log"
	#Especificar log para analizar
		read -p "especifica el fichera a analizar: " log_a
		analisis_log $log_a
		break
	#Especifica log para analizar
	elif [[ "$log_p" == "no" ]] || [[ "$log_p" == "n" ]]; then
		find / -type f -name "$log"
		read -p "especifica el fichera a analizar: " log_a
		analisis_log $log_a
		break

	else
		understand
	fi
	done
}

#Funcion Logs
analisis_log(){
	clear
        echo "----------------------DDOS-------------------------"
        grep "21" $1 | awk '{print $1}' | sort | uniq -c | awk '$1>3 {print $2" intentos - "$1}'
        echo "---------------------------------------------------"
        echo "---------------------admin-------------------------"
        grep -E "admin" $1 | sort
        echo "---------------------------------------------------"
        echo "---------------------login-------------------------"
        grep -E "login" $1 | sort
        echo "---------------------------------------------------"
        echo "----------------------Error------------------------"
        grep -E "401|403|404|502|500|503" $1 | sort
        echo "---------------------------------------------------"
        echo "-------------------Login error---------------------"
        grep -E "login" $1| awk '{print $1}' | sort | uniq -c | awk '$1>3 {print $2" intentos - "$1}'
        echo "---------------------------------------------------"
        echo "---------------Horario no habitual-----------------"
        grep -E '\[21/Oct/2024:0[0-5]:[0-5][0-9]:[0-5][0-9] \+0000\]' $1 | awk '{print  $1 " - " $4"]"}'
        echo "---------------------------------------------------"
        echo "IP,Intentos,Error 1,Error 2">log.csv
        awk '{print $1 " " $9 " " $10}' $1 | sort | uniq -c | awk '{print $2","$1","$3","$4}'>>log.csv
        echo "----------------------CSV--------------------------"
        cat ./log.csv
        echo "---------------------------------------------------"
	sleep 3
	echo ""
	echo ""
}

#Funcion ataque diccionario
diccionario(){
	clear
	#Especificar diccionario que se va a  utilizar
	read -p "Especifica diccionario: " diccionario
	#Especificar contraseña Hashseada
	read -p "Introduce el hash: " hash
	#Identificar Hash

	while true; do
		read -p "¿Necesitas identificar el hash?(y/n)" identifier
        	if [[ "$identifier" == "si" ]] || [[ "$identifier" == "yes" ]] || [[ "$identifier" == "s" ]] || [[ "$identifier" == "y" ]]; then
			while true;do
				echo -e "\033[36m═════════════════════════\033[0m"
				echo -e "\033[36m☰☰☰☰☰☰\033[37mIdentificador\033[36m☰☰☰☰☰☰\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				echo -e "\033[34m1. \033[32mhash-identifier\033[0m"
				echo -e "\033[34m2. \033[32mhashid\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				read -p "¿Que programa quieres usar?: " identifier
				#Identificar con Has-identifier
				if [ "$identifier" -eq "1" ]; then

					#̣̣̣̣̣⨪-----------------------------------------
					# Llamar a verificar_e_instalar con un programa específico
					instalacion=hash-identifier
					instalar "$instalacion"
					if [ $? -eq 1 ]; then
					echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
					return 1
					fi
					#---------------------------------------------

					hash-identifier "$hash"
					break
				#Identificar con Hasid
				elif [ "$identifier" -eq "2" ]; then
			
					#̣̣̣̣̣⨪-----------------------------------------
					# Llamar a verificar_e_instalar con un programa específico
					instalacion=hashid
					instalar "$instalacion"
					if [ $? -eq 1 ]; then
					echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
					return 1
					fi
					#---------------------------------------------

					hashid "$hash"
					break

				else
					understand
				fi
        	        done
			break

		elif [[ "$identifier" == "no" ]] || [[ "$identifier" == "n" ]]; then
                	break        	
		else
                	understand
		fi
	done
       

	#Selecionar Programa para Deshashsear la contraseña
	while true; do
		echo -e "\033[36m═════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰☰☰☰Programa☰☰☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mJohn the ripper\033[0m"
		echo -e "\033[34m2. \033[32mHashcat\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "¿Que programa quieres usas?: " john
		if [ "$john" -eq "1" ]; then
			jonhf $hash $diccionario
			break2. hashid


		elif [ "$john" -eq "2" ]; then
			hashcatf $hash $diccionario
			break

		else
			understand
		fi
	done
}
#Funcion ataque diccionario con John the reaper
jonhf(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=john
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------

	clear
	#Mostar algoritmos disponibles para John
	while true;do
		read -p "¿Quieres ver la lisata de algoritmos de John? (y/n)" lista_john
		if [[ "$lista_john" == "si" ]] || [[ "$lista_john" == "yes" ]] || [[ "$lista_john" == "s" ]] || [[ "$lista_john" == "y" ]]; then
			john_lista
			break
		elif [[ "lista_john" == "no" ]] || [[ "$lista_john" == n ]]; then
			break
		else
			understand
		fi
	done
	#Especificar algoritmo
	read -p "¿Que algoritmo quieres usar?: " formato
	#Cerea archivo temporal
	echo $1 > hash.txt
	#Llamada a jhon
	john --wordlist=$2 --format=$formato hash.txt
	echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
	john --show hash.txt
	echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
	#Borrar el archivo temporal
	rm hash.txt
	sleep 5
}

#Funcion atque diccionario hashcat
hashcatf(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=hashcat
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------

	clear
	#Mostrar tablas de Hascat
	while true; do
		read -p "¿Quires ver la lista de algoritmos de hashcat? (y/n)" lista_hashcat
	        if [[ "$lista_hashcat" == "si" ]] || [[ "$lista_hashcat" == "yes" ]] || [[ "$lista_hashcat" == "s" ]] || [[ "$lista_hashcat" == "y" ]]; then
			while true; do
				echo -e "\033[36m═════════════════════════\033[0m"
				echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mTabla\033[36m☰☰☰☰☰☰☰☰☰☰\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				echo -e "\033[34m1. \033[32mCompleta\033[0m"
				echo -e "\033[34m2. \033[32mReducida\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				read -p "Elige una opción: " tabla
					#Tabla completa
					if [ "$tabla" -eq "1" ]; then
						tabla_extensa
						break

					#Tabla con resumida
					elif [ "$tabla" -eq "2" ]; then
						tabla_resumida
						break

					else
						understand
					fi
			done

			break

        	elif [[ "$lista_hashcat" == "no" ]] || [[ "$lista_hashcat" == "n" ]]; then
                	break

        	else
                	understand
        	fi
	done

	#Comando hashcat
	read -p "introduce el id del algoritmo que quieres utilizar: " algoritmo
	#Crea archivo temporal
	echo $1 > hash.txt
	#Llama a Hashcat
	hashcat -m $algoritmo -a 0 hash.txt $2
	echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
	hashcat -m $algoritmo -a 0 hash.txt $2 --show
	echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
	#Borrar temporal
	rm hash.txt
	sleep 5
}

#Funcion Fingerprinting
fingerprinting(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=nmap
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------

	clear
	while true; do
		#Realizar Escaneo de red
		read -p "¿Quieres hacer un escaneo de la red?(y/n)" escan
        	if [[ "$escan" == "si" ]] || [[ "$escan" == "yes" ]] || [[ "$escan" == "s" ]] || [[ "$escan" == "y" ]]; then
			#Especificar una red para escanear
			read -p "Especifica una red (192.168.1.0/24): " redscan
			while true; do
				echo "1. Fping"
				echo "2. Nmap"
				read -p "¿Conque quieres escanear?" scantool
                		#Escaneo con fping
				if [ "$scantool" -eq "1" ]; then

					#̣̣̣̣̣⨪-----------------------------------------
					# Llamar a verificar_e_instalar con un programa específico
					instalacion=fping
					instalar "$instalacion"
					if [ $? -eq 1 ]; then
					echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
					return 1
					fi
					#---------------------------------------------

					fping -a -g -q $redscan
					sleep 5
				break

				#Escaneo con Nmap
				elif [ "$scantool" -eq "2" ]; then
					sudo nmap -sn $redscan
					sleep 5
				break

				else
					understand

				fi
			done
			break

        	elif [[ "$escan" == "no" ]] || [[ "$escan" == "n" ]]; then
                	break

        	else
                	understand
        	fi
	done
	#Especificar una IP para escaner
	read -p "Especifica la IP a escanear: " ipscan
	#Realizar escaneo y redirijirlo a un archivo temporal
	sudo nmap -sS -A $ipscan >> temp.txt
	#Genera archivo que se mostrara del escaneo de la IP
	#-------------------------------------------------------------------
	echo "-------------- $ipscan -------------" >> "$ipscan".txt
	echo "-------------------------------------------" >> "$ipscan".txt
	echo " Port   Status Service Version" >> "$ipscan".txt
	grep open temp.txt >> "$ipscan".txt
	echo "-------------------------------------------" >> "$ipscan".txt
	grep MAC temp.txt | awk '{print $1 $2 $3}' >> "$ipscan".txt
	#-------------------------------------------------------------------
	#Mostrar archivo generado
	cat "$ipscan".txt
	#Borrar archivo temporal
	rm temp.txt
	sleep 5
	#Intruducir a la funcion que lanza scripts
	while true; do
		read -p "¿Quieres usar scrips para escanear la ip?(y/n)" menu
		if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
			scripts_nmap $ipscan
			break

		elif [[ "$menu" == "no" ]] || [[ "$menu" == "no" ]]; then
			break

		else
			understand
		fi
	done

}

#Funcion script nmap
scripts_nmap(){
	bucle=1
	#Seleccion de script que se quiere usar
	while [ "$bucle" -eq "1" ]; do
		ipscan="$1"
		echo -e "\033[36m═══════════════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[37mScript\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mUsuarios\033[0m" 		#Busca usuarios
		echo -e "\033[34m2. \033[32mPredeterminado\033[0m"		#Escript basico
		echo -e "\033[34m3. \033[32mSafe\033[0m"			#Escript de perfil bajo
		echo -e "\033[34m4. \033[32mVulnerabilidades\033[0m"	#Escript de vulnerabilidades
		echo -e "\033[34m5. \033[32mAll\033[0m"			#Todos los escripts (MUCHO RUIDO)
		echo -e "\033[34m6. \033[32mPersonalizado\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "Seleciona un script: " script
		#Script de usuarios
		if  [ "$script" -eq "1" ];then
			sudo nmap -f -sS -sV -Pn --script auth $ipscan
			sleep 2
			while true;do
				read -p "Quieres lanzar otro script(yes/no)" menu
				if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
					script_nmap $ipscan
					break
				elif [[ "$menu" == "n" ]] || [[ "$menu" == "no" ]]; then
					bucle=0
					break
				else
					understand
				fi
			done

		#Script predeterminado
		elif [ "$script" -eq "2" ];then
			sudo nmap -f -sS -sV -Pn --script default $ipscan
			sleep 2
			while true;do
				read -p "Quieres lanzar otro script(yes/no)" menu
				if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
					script_nmap $ipscan
					break
				elif [[ "$menu" == "n" ]] || [[ "$menu" == "no" ]]; then
					bucle=0
					break
				else
					understand
				fi
			done

		#Script de perfil bajo
		elif [ "$script" -eq "3" ];then
			sudo nmap -f --script safe $ipscan
			sleep 2
			while true;do
				read -p "Quieres lanzar otro script(yes/no)" menu
				if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
					script_nmap $ipscan
					break
				elif [[ "$menu" == "n" ]] || [[ "$menu" == "no" ]]; then
					bucle=0
					break
				else
					understand
				fi

			done

		#Script de vulnerabilidades
		elif [ "$script" -eq "4" ];then
			sudo nmap -f --script vuln $ipscan
			sleep 2
			while true;do
				read -p "Quieres lanzar otro script(yes/no)" menu
				if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
					script_nmap $ipscan
					break
				elif [[ "$menu" == "n" ]] || [[ "$menu" == "no" ]]; then
					bucle=0
					break
				else
					understand
				fi

			done

		#Todos los scripts
		elif [ "$script" -eq "5" ];then
			sudo nmap -f --script all $ipscan
			sleep 2
			while true;do
				read -p "Quieres lanzar otro script(yes/no)" menu
				if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
					script_nmap $ipscan
					break
				elif [[ "$menu" == "n" ]] || [[ "$menu" == "no" ]]; then
					bucle=0
					break
				else
					understand
				fi
			done

		#script personalizado
		elif [ "$script" -eq "6" ];then
			read -p "Especifica el escript: " escriptp
			sudo nmap --script="$escriptp" $ipscan
			sleep 2
			while true;do
				read -p "Quieres lanzar otro script(yes/no)" menu
				if [[ "$menu" == "si" ]] || [[ "$menu" == "s" ]] || [[ "$menu" == "yes" ]] || [[ "$menu" == "y" ]]; then
					script_nmap $ipscan
					break
				elif [[ "$menu" == "n" ]] || [[ "$menu" == "no" ]]; then
					bucle=0
					break
				else
					understand
				fi

			done
		else
			understand
		fi
	done

}

#Funcion Foodtprinting
footprinting(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=exiftool
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------

	clear
	#Selecion de que se quiere escanear
	while true; do
		echo -e "\033[36m══════════════════════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[37mMetadatos\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mFicheros de la ruta actual\033[0m"
		echo -e "\033[34m2. \033[32mFicheros de la ruta especificada\033[0m"
		echo -e "\033[34m3. \033[32mFichero especifico\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "Elige una opción para ver metadatos: " metadatos

		#Metadatos de todos los los archivos del directorio actual
		if [ "$metadatos" -eq "1" ]; then
			exiftool ./
			#Inicio de funcion para editar metadatos
			while true; do
				read -p "¿Quieres editar metadatos?(y/n)" editar
			        if [[ "$editar" == "si" ]] || [[ "$editar" == "yes" ]] || [[ "$editar" == "s" ]] || [[ "$editar" == "y" ]]; then
					#Especificar fichero para editar metadatos
					read -p "especifica el archivo que quieres editar: " metadatosf
					#Llamada a la funcion para editar metadatos
					metadatosedit $metadatosf
					break
			        elif [[ "$editar" == "no" ]] || [[ "$editar" == "n" ]]; then
					break
				else
					understand
				fi
			done
			break

		#Metadatos de todos los archivos de una ruta
		elif [ "$metadatos" -eq "2" ]; then
			read -p "Especifica una ruta" metadatosf
			exiftool $metadatosf
			#Inicio de funcion para editar metadatos
			while true; do
				read -p "¿Quieres editar metadatos?(y/n)" editar
				if [[ "$editar" == "si" ]] || [[ "$editar" == "yes" ]] || [[ "$editar" == "s" ]] || [[ "$editar" == "y" ]]; then
					#Especificar fichero para editar metadatos
					read -p "especifica el archivo que quieres editar: " metadatosf
					#Llamada a la funcion para editar meta datos
					metadatosedit $metadatosf
					break
			        elif [[ "$editar" == "no" ]] || [[ "$editar" == "n" ]]; then
					break
				else
					understand
				fi
			done
			break

		#Metadatos de un Archivo especifico
		elif [ "$metadatos" -eq "3" ]; then
			read -p "Especifica un fichero" metadatosf
			exiftool $metadatosf
			#Inicio de funcion para editar metadatos
			while true; do
				read -p "¿Quieres editar metadatos?(y/n)" editar
			        if [[ "$editar" == "si" ]] || [[ "$editar" == "yes" ]] || [[ "$editar" == "s" ]] || [[ "$editar" == "y" ]]; then
					#Llamada a la funcion para editar meta datos
					metadatosedit $metadatosf
					break
			        elif [[ "$editar" == "no" ]] || [[ "$editar" == "n" ]]; then
					break
				else
					understand
				fi
			done
			break

		else
			understand
		fi
	done
}

#Funcion para editar meta datos
metadatosedit(){
	loop=1
	while true; do
		#Meta dato a editar
		read -p "¿Que metadato quieres editar? " tag
		#Valor que se le va a dar
		read -p "¿Que valor le quieres dar? " valor
		exiftool -"$tag"="$valor" "$1"
		exiftool "$1"
		#Segir editando metadatos
		while true; do
			read -p "¿Quieres seguir editando metadatos (y/n)?" editar
			if [[ "$editar" == "si" ]] || [[ "$editar" == "yes" ]] || [[ "$editar" == "s" ]] || [[ "$editar" == "y" ]]; then
				loop=1
				break
			elif [[ "$editar" == "no" ]] || [[ "$editar" == "n" ]]; then
				loop=2
				break
			else
				understand
			fi
		done
		if [ "$loop" -eq "2" ]; then
			break
		fi

	done


}

#Funcion fuzzing
fuzzing(){
	clear
	#Seleccion de diccionario para utilizar
	while true; do
		echo -e "\033[36m══════════════════════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[37mDiccionario\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mDiccionario pequeño\033[0m"
		echo -e "\033[34m2. \033[32mDiccionario mediano\033[0m"
		echo -e "\033[34m3. \033[32mDiccionario personalizado\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "¿Que diccionario quieres usar?: " tdiccionariof
		if [ "$tdiccionariof" -eq "1" ]; then
			diccionariof="/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt"
			break

		elif [ "$tdiccionariof" -eq "2" ]; then
			diccionariof="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
			break

		elif [ "$tdiccionariof" -eq "3" ]; then
			read -p "¿Especifica la ruta del diccionario?: " diccionariof
			break
		else
			understand
		fi
	done

	#Especificar Url para escanear
	read -p "especifica una url para escanear: " url

	#Selecionar programa
	while true; do
		echo -e "\033[36m══════════════════════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[37mPrograma\033[36m☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mWfuzz\033[0m"
		echo -e "\033[34m2. \033[32mGobuster\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "¿Que Programa quieres usar?: " menu

		#Llamada a la funcion wfuzz
		if [ "$menu" -eq "1" ]; then
			wfuzzf $diccionariof $url
			break

		#Llamada a la funcion gobuster
		elif [ "$menu" -eq "2" ]; then
			gobusterf $diccionariof $url
			break

		else
			understand

		fi
	done

}

#Funcion Gobuster
gobusterf(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=gobuster
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------

	#Crear Fichero para la redireccion del gobuster
	echo "Escaneo de $2" > gobuster.txt
	#Lamada a gobuster
	gobuster dir -w "$1" -u "$2" >> gobuster.txt
	#Mostar resultados
	cat gobuster.txt
}

#Funcion Wfuzz
wfuzzf(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Llamar a verificar_e_instalar con un programa específico
	instalacion=wfuzz
	instalar "$instalacion"
	if [ $? -eq 1 ]; then
		echo "Error crítico: No se pudo instalar '$instalacion'. Abortando..."
		return 1
	fi
	#---------------------------------------------

	#Crear Fichero para la redireccion del Fuzz
	echo "$2" > Fuzz.txt
	#Lamada a Fuzz
	wfuzz -c --hc 404 -t 200 -w "$1" -u "$2"/FUZZ >> Fuzz.txt
	#Mostar resultados
	cat Fuzz.txt
}

#Menu Principal
clear
while true; do
	echo -e "\033[36m═════════════════════════\033[0m"
	echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mMENÚ\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
	echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
	echo -e "\033[34m1. \033[32mSaludar\033[0m"
	echo -e "\033[34m2. \033[32mAnálisis de logs\033[0m"
	echo -e "\033[34m3. \033[32mAtaque de diccionario\033[0m"
	echo -e "\033[34m4. \033[32mFingerprinting\033[0m"
	echo -e "\033[34m5. \033[32mFootprinting\033[0m"
	echo -e "\033[34m6. \033[32mFuzzing\033[0m"
	echo -e "\033[34m7. \033[31;9mAtaque con metasploit\033[0m"
	echo -e "\033[34m8. \033[32mWordlist config\033[0m"
	echo -e "\033[34m0. \033[32mExit\033[0m"
	echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
	read -p "Elige una opción: " menu

	if [ "$menu" -eq "1" ]; then
		saludo | /usr/games/lolcat

	elif [ "$menu" -eq "2" ]; then
		logs

	elif [ "$menu" -eq "3" ]; then
		diccionario

	elif [ "$menu" -eq "4" ]; then
		fingerprinting

	elif [ "$menu" -eq "5" ]; then
		footprinting

	elif [ "$menu" -eq "6" ]; then
		fuzzing

	elif [ "$menu" -eq "7" ]; then
		metasploit

	elif [ "$menu" -eq "8" ]; then
		wordlist_conf

	elif [ "$menu" -eq "0" ]; then
		break

	else
		understand
	fi
done
