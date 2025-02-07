#!/bin/bash


bruteattack(){
	clear
	while true;do
		echo -e "\033[36m═════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰\033[37mType of attack\033[36m☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mCrack a password hash\033[0m"
		#echo -e "\033[34m2. \033[32mBrute-forcing a service\033[0m"
		echo -e "\033[34m0. \033[32mExit\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "¿Que programa quieres usar?: " menu

		if [ "$menu" -eq "1" ];then
			passwordcraking	

		#elif [ "$menu" -eq "2" ];then

		elif [ "$menu" -eq "0" ];then
			break

		else
			understand
	
		fi
	done		
}
