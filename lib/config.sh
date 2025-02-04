#!/bin/bash

wordlist_conf(){
	clear
	while true; do
		echo -e "\033[36m═════════════════════════\033[0m"
		echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mWordlist Config\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		echo -e "\033[34m1. \033[32mPasswords\033[0m"
		echo -e "\033[34m2. \033[32mNames\033[0m"
		echo -e "\033[34m3. \033[32mDirectories\033[0m"
		echo -e "\033[34m4. \033[32mExtensions\033[0m"
		echo -e "\033[34m0. \033[32mExit\033[0m"
		echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
		read -p "Which wordlist you want to change: " menu
		
		#Password
		if [ "$menu" -eq "1" ]; then
			clear
			while true; do
				echo -e "\033[36m═════════════════════════\033[0m"
				echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mPassword wordlist\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				echo -e "\033[34m1. \033[32mJohn The Ripper\033[0m"
				echo -e "\033[34m2. \033[32mNmap\033[0m"
				echo -e "\033[34m3. \033[32mRockYou\033[0m"
				echo -e "\033[34m4. \033[32mOther\033[0m"
				echo -e "\033[34m0. \033[32mExit\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				read -p "Select wordlist: " menu

					if [ "$menu" -eq "1" ]; then
						WORDLISTPASSWORD=${DIR}"/data/wordlists/password/john-password.lst"
						break

					elif [ "$menu" -eq "2" ]; then
						WORDLISTPASSWORD=${DIR}"/data/wordlists/password/nmap-password.lst"
						break
					
					elif [ "$menu" -eq "3" ]; then
						
						if [ ! -f "${DIR}/data/wordlists/password/rockyou.txt" ]; then
							unxz ${DIR}"/data/wordlists/password/rockyou.txt.xz"
						fi	
						
						WORDLISTPASSWORD=${DIR}"/data/wordlists/password/rockyou.txt"
						break	

					elif [ "$menu" -eq "4" ]; then
						
						read -p "Enter path:  " WORDLISTPASSWORD
						break

					elif [ "$menu" -eq "0" ]; then
						break
					
					else
						understand

					fi
			done
			clear

		#Names
		elif [ "$menu" -eq "2" ]; then
			clear
			while true; do
				echo -e "\033[36m═════════════════════════\033[0m"
				echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mPassword wordlist\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				echo -e "\033[34m1. \033[32mDirb\033[0m"
				echo -e "\033[34m2. \033[32mOther\033[0m"
				echo -e "\033[34m0. \033[32mExit\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				read -p "Select wordlist: " menu

					if [ "$menu" -eq "1" ]; then
						WORDLISTNAMES=${DIR}"/data/wordlists/names/dirb-names.txt"
						break

					elif [ "$menu" -eq "2" ]; then
						read -p "Enter path:  " WORDLISTNAMES
						break
					
					elif [ "$menu" -eq "0" ]; then
						break
					
					else
						understand

					fi
			done
			clear



		#Directories
		elif [ "$menu" -eq "3" ]; then
			clear
			while true; do
				echo -e "\033[36m═════════════════════════\033[0m"
				echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mDirectories wordlist program\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				echo -e "\033[34m1. \033[32mDirb\033[0m"
				echo -e "\033[34m2. \033[32mDirbuster\033[0m"
				echo -e "\033[34m3. \033[32mWfuzz\033[0m"
				echo -e "\033[34m4. \033[32mOther\033[0m"
				echo -e "\033[34m0. \033[32mExit\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				read -p "Select wordlist program: " menu

					if [ "$menu" -eq "1" ]; then
						clear
						while true; do
							echo -e "\033[36m═════════════════════════\033[0m"
							echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mDirb wordlist\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
							echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
							echo -e "\033[34m1. \033[32mCommon\033[0m"
							echo -e "\033[34m2. \033[32mSmall\033[0m"
							echo -e "\033[34m3. \033[32mSpanish\033[0m"
							echo -e "\033[34m0. \033[32mExit\033[0m"
							echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
							read -p "Select wordlist: " menu

							if [ "$menu" -eq "1" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirb/common.txt"
								menu=99
								break

							elif [ "$menu" -eq "2" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirb/small.txt"
								menu=99
								break
							
							elif [ "$menu" -eq "3" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirb/spanish.txt"
								menu=99
								break
								
							elif [ "$menu" -eq "0" ]; then
								break
				
							else
								understand
							
							fi
						done	

					elif [ "$menu" -eq "2" ]; then
						clear
						while true; do
							echo -e "\033[36m═════════════════════════\033[0m"
							echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mDirbuster wordlist\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
							echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
							echo -e "\033[34m1. \033[32mCommon\033[0m"
							echo -e "\033[34m2. \033[32mMedium\033[0m"
							echo -e "\033[34m3. \033[32mSmall\033[0m"
							echo -e "\033[34m4. \033[32mLowercase medium\033[0m"
							echo -e "\033[34m5. \033[32mLowercase small\033[0m"
							echo -e "\033[34m0. \033[32mExit\033[0m"
							echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
							read -p "Select wordlist: " menu

							if [ "$menu" -eq "1" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirbuster/directory-list-1.0.txt"
								menu=99
								break

							elif [ "$menu" -eq "2" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirbuster/directory-list-2.3-medium.txt"
								menu=99
								break
							
							elif [ "$menu" -eq "3" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirbuster/directory-list-2.3-small.txt"
								menu=99
								break

							elif [ "$menu" -eq "4" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirbuster/directory-list-lowercase-2.3-medium.txt"
								menu=99
								break

							elif [ "$menu" -eq "5" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/dirbuster/directory-list-lowercase-2.3-small.txt"
								menu=99
								break

							elif [ "$menu" -eq "0" ]; then
								break
							
							else
								understand
							
							fi
							
						done	

					elif [ "$menu" -eq "3" ]; then
						clear
						while true; do
							echo -e "\033[36m═════════════════════════\033[0m"
							echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mWfuzz wordlist\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
							echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
							echo -e "\033[34m1. \033[32mCommon\033[0m"
							echo -e "\033[34m2. \033[32mBig\033[0m"
							echo -e "\033[34m3. \033[32mMedium\033[0m"
							echo -e "\033[34m4. \033[32mAdmin Panel\033[0m"
							echo -e "\033[34m0. \033[32mExit\033[0m"
							echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
							read -p "Select wordlist: " menu

							if [ "$menu" -eq "1" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/wfuzz/common.txt"
								menu=99
								break

							elif [ "$menu" -eq "2" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/wfuzz/big.txt"
								menu=99
								break
							
							elif [ "$menu" -eq "3" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/wfuzz/medium.txt"
								menu=99
								break

							elif [ "$menu" -eq "4" ]; then
								WORDLISTDIRECTORIES=${DIR}"/data/wordlists/directories/wfuzz/admin-panels.txt"
								menu=99
								break
					
							elif [ "$menu" -eq "0" ]; then
								break
							
							else
								understand
							
							fi
						done	

						
					elif [ "$menu" -eq "4" ]; then
						
						read -p "Enter path:  " WORDLISTDIRECTORIES
						break
					
					elif [ "$menu" -eq "0" ]; then
						break

					else
						understand

					fi

					if [ "$menu" -eq "99" ]; then 
						break
					fi

			done
			clear



		#Extensions
		elif [ "$menu" -eq "4" ]; then
			clear
			while true; do
				echo -e "\033[36m═════════════════════════\033[0m"
				echo -e "\033[36m☰☰☰☰☰☰☰☰☰☰\033[37mPassword wordlist\033[36m☰☰☰☰☰☰☰☰☰☰☰\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				echo -e "\033[34m1. \033[32mDirb\033[0m"
				echo -e "\033[34m2. \033[32mWfuzz extensions\033[0m"
				echo -e "\033[34m3. \033[32mWfuzz mutations\033[0m"
				echo -e "\033[34m4. \033[32mOther\033[0m"
				echo -e "\033[34m0. \033[32mExit\033[0m"
				echo -e "\033[36m⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯⌯\033[0m"
				read -p "Select wordlist: " menu

					if [ "$menu" -eq "1" ]; then
						WORDLISTEXTENSIONS=${DIR}"/data/wordlists/directories/dirb/extensions_common.txt"
						break

					elif [ "$menu" -eq "2" ]; then
						WORDLISTEXTENSIONS=${DIR}"/data/wordlists/directories/wfuzz/extensions_common.txt"
						break

					elif [ "$menu" -eq "3" ]; then
						WORDLISTEXTENSIONS=${DIR}"/data/wordlists/directories/wfuzz/mutations_common.txt"
						break

					elif [ "$menu" -eq "4" ]; then
						read -p "Enter path:  " WORDLISTNAMES
						break
					
					elif [ "$menu" -eq "0" ]; then
						break
					
					else
						understand

					fi
			done
			clear	

		elif [ "$menu" -eq "0" ]; then
			clear
			break
		else
			understand

		fi

	done

}
