#!/bin/bash 
set -e 


#######################################################################
############### ARCH LINUX INSTALL APPLICATIONS SCRIPT ################
#######################################################################
													## APPLICATIONS ##
													################## 

# [ STARTUP ] #

echo -e " \033[1;33m[ STEP 00 - STARTING ARCH LINUX INSTALL APPLICATIONS  ]\033[0m "
sleep 2




# USER CHECK

	USERCHECK=`echo $USER`
	ROOT="root"

if [ $USERCHECK == $ROOT ]
then
			
	echo -e " \033[1;37m\033[41m[ !! ATTENTION !! change to a low privilege user and try again ]\033[0m \n"  
	sleep 2
	exit

else
			


	# synchronize the repositories
		sudo pacman -Sy

		
	## CREATE DIRECTORIES ##

		DIRECTORIES(){

			# create aur pkg directory
				sudo mkdir /home/.AUR_pkg
			
			# move inside the directory
				cd /home/.AUR_pkg
			
			# give read and write permissions to install aur packages in /home/.AUR_pkg
				sudo chmod -R ugo+rw /home/.AUR_pkg
		}	


	## INSTALLATION ##

		#[  STEP 01 -  ESSENTIAL ]#
			
			ESSENTIAL(){

				echo -e " \033[1;33m[  STEP 01 -  ESSENTIAL ]\033[0m "
				sleep 2
						
						# yay

						package="yay"
			
						sudo git clone https://aur.archlinux.org/yay.git 
						cd yay
						
							# give read and write permissions to install aur packages in /home/.AUR_pkg
								sudo chmod -R ugo+rw /home/.AUR_pkg/$package
						
						makepkg -si --noconfirm
						cd /home/.AUR_pkg
			}			

		#[  STEP 02 -  AUDIO ]#

				
			AUDIO(){

				echo -e " \033[1;33m[  STEP 02 -  AUDIO ]\033[0m "
				sleep 2		

					# pulseaudio
					# pulseaudio-alsa
					# pavucontrol
						sudo pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pavucontrol
					
					# alsa-utils
					# alsa-plugins
					# alsa-lib
					# alsa-firmware
						sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
					
					# audacity
						sudo pacman -S --noconfirm --needed audacity
			}

		#[  STEP 03 -  MANAGEMENT ]#

			MANAGEMENT(){

				echo -e " \033[1;33m[  STEP 03 -  MANAGEMENT ]\033[0m "
				sleep 2


					# timeshift
						yay -S --noconfirm timeshift
						cd /home/.AUR_pkg
					
					# net-tools
					# networkmanager
					# reflector
						sudo pacman -S --noconfirm --needed net-tools networkmanager reflector
			}

		#[  STEP 04 -  BROWSER ]#

			BROWSER(){

				echo -e " \033[1;33m[ STEP 04 -  BROWSER ]\033[0m "
				sleep 2


					# brave
						yay -S --noconfirm brave-bin 
					
					# surf
						sudo pacman -S --noconfirm --needed surf
			}

		#[  STEP 05 -  TEXT EDITOR ]#

			TEXT_EDITOR(){

				echo -e " \033[1;33m[ STEP 05 -  TEXT EDITOR ]\033[0m "
				sleep 2



					# sublime-text-3
						yay -S --noconfirm sublime-text-dev 

			}

		#[  STEP 06 -  SYSTEM INFORMATION ]#

			SYS_INFO(){

				echo -e " \033[1;33m[  STEP 06 -  SYSTEM INFORMATION ]\033[0m "
				sleep 2

					# pfetch
						yay -S --noconfirm pfetch 

					
					# dmidecode
					# htop
					# lm_sensors
					# bleachbit
					# vnstat
					# sysstat
						sudo pacman -S --noconfirm --needed dmidecode htop lm_sensors bleachbit vnstat sysstat
			}

		#[  STEP 07 -  DOCUMENTS ]#

			DOCUMENTS(){

				echo -e " \033[1;33m[  STEP 07 -  DOCUMENTS ]\033[0m "
				sleep 2


					# libreOffice# 
					# zathura-pdf
					# vifm
						sudo pacman -S --noconfirm --needed vifm libreoffice-fresh-en-gb zathura-pdf-mupdf
			}

		#[  STEP 08 -  ACCESSORIES ]#

			ACCESSORIES(){

				echo -e " \033[1;33m[ STEP 08 -  ACCESSORIES ]\033[0m "
				sleep 2


					# bc 
					# gcalculator
						sudo pacman -S --noconfirm --needed bc gcalculator
					# wttr
						yay -S --noconfirm wttr 

			}

		#[  STEP 09 -  IMAGE ]#

			IMAGE(){

				echo -e " \033[1;33m[ STEP 09 -  IMAGE ]\033[0m "
				sleep 2


					# qview
						yay -S --noconfirm qview 

					# gimp
					# xwallpaper
						sudo pacman -S --noconfirm --needed gimp xwallpaper
			}

		#[  STEP 10 -  MEDIA ]#

			MEDIA(){

				echo -e " \033[1;33m[ STEP 10 -  MEDIA ]\033[0m "
				sleep 2


					# mpv
					# cmus
						sudo pacman -S --noconfirm --needed mpv cmus
			}

		#[  STEP 11 -  DOWNLOADERS ]#

			DOWNLOADERS(){

				echo -e " \033[1;33m[ STEP 11 -  DOWNLOADERS ]\033[0m "
				sleep 2


					# transmission-cli
					# youtube-dl
						sudo pacman -S --noconfirm --needed transmission-cli youtube-dl
			}

		#[  STEP 12 -  ZIP ]#

			ZIP(){

				echo -e " \033[1;33m[ STEP 12 -  ZIP ]\033[0m "
				sleep 2


					# transmission-cli
					# youtube-dl
						sudo pacman -S --noconfirm --needed transmission-cli youtube-dl
			}

		#[  STEP 13 -  PRIVACY ]#




	# [ COMMAND ORDER ] #

	DIRECTORIES
	ESSENTIAL
	AUDIO
	MANAGEMENT
	#BROWSER
	#TEXT_EDITOR
	#SYS_INFO
	#DOCUMENTS
	#ACCESSORIES
	#IMAGE
	#MEDIA
	#DOWNLOADERS
	#ZIP
fi
