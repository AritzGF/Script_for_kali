#!/bin/bash

#Understand function for menu errors
understand(){
	clear
	echo "."
	sleep 0.5
	echo ".."
	sleep 0.5
	echo "..."
	sleep 0.5
	echo "...."
	sleep 0.5
	echo "..."
	sleep 0.5
	echo ".."
	sleep 0.5
	echo "."
	sleep 0.5
	echo "Perdona, no te he entendido. ¿Puedes repetirlo?"
	sleep 3
	clear
}

hash_result_file_counter(){
	while [[ -e "${DIRPASSWORDRESULTS}${FILECOUNTER}_Password.txt" ]];do
        	((FILECOUNTER++))
	done
}

