#!/bin/bash

passwordcraking(){
	clear
	while true; do
		echo -e "\033[36m═════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰\033[37mProgram\033[36m☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mHashcat\033[0m"
		echo -e "\033[34m2. \033[32mJohn The Reapper\033[0m"
		#echo -e "\033[34m3. \033[32mAuto\033[0m"
		echo -e "\033[34m0. \033[32mExit\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "Select progrm: " menu

		if [ "$menu" -eq "1" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			read -p "Enter Hash: " hash
			hashtype
			hashcatf

		elif [ "$menu" -eq "2" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			read -p "Enter Hash: " hash
			hashtype
			johnf

		#elif [ "$menu" -eq "3" ]; then
			#echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			#read -p "Enter Hash: " hash
			#break

		elif [ "$menu" -eq "0" ]; then
			break

		else
			understand
		fi

	done

}

#Identify hash
hashtype(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Chech if the program is installed
	PROGRAM=hash-identifier
	installfun
	#---------------------------------------------
	
	echo "----Possible hashes----" > $TMPHASHTYPE
	hashid "$hash" | grep "[+]" | awk -F " " '{for(i=2;i<=NF;i++) printf $i " "; print ""}' >> $TMPHASHTYPE
	echo "-----------------------" >> $TMPHASHTYPE

}

#Attack function with John The Reapper
johnf(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Chech if the program is installed
	PROGRAM=john
	installfun
	#-------------------------------------------
	clear
	while true;do
		echo -e "\033[36m═════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰\033[37mJohn The Reapper\033[36m☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mShow hash table\033[0m"
		echo -e "\033[34m2. \033[32mShow your possibe hash type\033[0m"
		echo -e "\033[34m3. \033[32mInput hash type\033[0m"
		echo -e "\033[34m0. \033[32mExit\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "Select option: " menu

		if [ "$menu" -eq "1" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			cat $JOHNTABLE
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
		
		elif [ "$menu" -eq "2" ]; then
			cat $TMPHASHTYPE

		elif [ "$menu" -eq "3" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			read -p "Enter Hash type: " hashtype
			
			#Create temporary file
			echo $hash > $TMPHASH
			#Run John The reaapper
			john --wordlist=$WORDLISTPASSWORD --format=$hashtype $TMPHASH
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			hash_result_file_counter
			john --show --format=$hashtype $TMPHASH | grep "?" | awk -F ":" '{print "'$hash' ---> " $2}' > "${DIRPASSWORDRESULTS}${FILECOUNTER}_Password.txt"	
			cat "${DIRPASSWORDRESULTS}${FILECOUNTER}_Password.txt" 
			
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			#Remove temporary files
			rm $TMPHASH 
			rm $TMPHASHTYPE
			sleep 5
			
			break

		elif [ "$menu" -eq "0" ]; then
			break

		else
			understand
		
		fi



	done
}

#Attack function with Hashcat
hashcatf(){

	#̣̣̣̣̣⨪-----------------------------------------
	# Chech if the program is installed
	PROGRAM=hashcat
	installfun
	#-------------------------------------------
	clear
	while true;do
		echo -e "\033[36m═════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰\033[37mHashCat\033[36m☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mShow full hash table\033[0m"
		echo -e "\033[34m2. \033[32mShow summary hash table\033[0m"
		echo -e "\033[34m3. \033[32mShow your possibe hash type\033[0m"
		echo -e "\033[34m4. \033[32mInput hash type\033[0m"
		echo -e "\033[34m0. \033[32mExit\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "Select option: " menu

		if [ "$menu" -eq "1" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			cat $FULLHASHCATTABLE
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"

		elif [ "$menu" -eq "2" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			cat $SUMMARYHASHCATTABLE
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
		
		elif [ "$menu" -eq "3" ]; then
			cat $TMPHASHTYPE

		elif [ "$menu" -eq "4" ]; then
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			read -p "Enter Hash type: " hashtype
			
			#Create tempory file
			echo $hash > $TMPHASH
			#Run Hashcat
			hashcat -m $hashtype -a 0 $TMPHASH $WORDLISTPASSWORD
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"	
			hash_result_file_counter
			hashcat -m $hashtype -a 0 $TMPHASH $WORDLISTPASSWORD --show | awk -F ":" '{print $1 " ---> " $2}' > "${DIRPASSWORDRESULTS}${FILECOUNTER}_Password.txt"	
			cat "${DIRPASSWORDRESULTS}${FILECOUNTER}_Password.txt" 
			echo "⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯"
			#Remove tempory file
			rm $TMPHASH 
			rm $TMPHASHTYPE
			sleep 5
			
			break

		elif [ "$menu" -eq "0" ]; then
			break

		else
			understand
		
		fi



	done
}

