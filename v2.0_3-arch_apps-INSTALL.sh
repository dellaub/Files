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
				sudo mkdir /home/.AUR
			
			# move inside the directory
				cd /home/.AUR
			
			# give read and write permissions to install aur packages in /home/.AUR
				sudo chmod -R ugo+rw /home/.AUR
		}	

		DIRECTORIES

	## INSTALLATION ##

		#[  STEP 01 -  ESSENTIAL ]#
			
			ESSENTIAL(){

				echo -e " \033[1;33m[  STEP 01 -  ESSENTIAL ]\033[0m "
				sleep 2
						
							# yay

							package="yay"

								# clone package build
									sudo git clone https://aur.archlinux.org/yay.git 
									cd yay
								
								# give read and write permissions to install aur packages in /home/.AUR
									sudo chmod -R ugo+rw /home/.AUR/$package
											
								# make package
									makepkg -si --noconfirm
									cd 
			}			

			ESSENTIAL

		# [ STEP 02 - PACMAN ] #
			
			#[############## AUDIO ##############]#
				sudo pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pavucontrol
				sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
				sudo pacman -S --noconfirm --needed audacity
			
			#[############ MANAGEMENT ###########]#
				sudo pacman -S --noconfirm --needed net-tools networkmanager reflector
			
			#[############# BROWSER #############]#
				sudo pacman -S --noconfirm --needed qutebrowser
					
			#[######## SYSTEM INFORMATION #######]#
				sudo pacman -S --noconfirm --needed conky dmidecode htop lm_sensors 
				sudo pacman -S --noconfirm --needed bleachbit vnstat sysstat
			
			#[############ DOCUMENTS ############]#
				sudo pacman -S --noconfirm --needed deepin-icon-theme deepin-file-manager vifm  
				sudo pacman -S --noconfirm --needed libreoffice-fresh-en-gb
				sudo pacman -S --noconfirm --needed zathura zathura-pdf-mupdf
			
			#[########### ACCESSORIES ###########]#
				sudo pacman -S --noconfirm --needed bc mate-calc
			
			#[############## IMAGE ##############]#
				sudo pacman -S --noconfirm --needed gimp nitrogen
			
			#[############## MEDIA ##############]#
				sudo pacman -S --noconfirm --needed mpv cmus
			
			#[########### DOWNLOADERS ###########]#
				sudo pacman -S --noconfirm --needed transmission-cli youtube-dl
			
			#[############### ZIP ###############]#
				sudo pacman -S --noconfirm --needed unrar unzip zip	

		

		# [ STEP 03 -  YAY ] #
			
					#[#### MANAGEMENT ###]#
						yay -S --noconfirm timeshift

					#[##### BROWSER #####]#
						yay -S --noconfirm brave-bin

					#[### TEXT EDITOR ###]#
						yay -S --noconfirm sublime-text-dev

					#[SYSTEM  INFORMATION]#
						yay -S --noconfirm pfetch

					#[### ACCESSORIES ###]#
						yay -S --noconfirm wttr

					#[###### IMAGE ######]#
						yay -S --noconfirm qview

				
fi

			echo -e " \n\033[1;37m\033[41m[ !! ATTENTION !! ]\033[0m \n"
			echo -e " \n\033[1;37m\033[44m[ Do you want SUDO commands WITH PASSWORD (type : W ) ]\033[0m \n"	
			echo -e " \n\033[1;37m\033[44m[ ...or WITHOUT PASSWORD ? (type : WO) ]\033[0m \n"	
				read sudo
				WITH='W'
				WITHOUT='WO'
				
				if [ $sudo == $WITH ]
				then

					# [ SUDO PERMISSIONS WITH PASSWORD ] #
					echo -e " \n\033[1;37m\033[41m !! Run as ROOT !! :\n \033[0m\033[1;33m\033[41m . /.installscripts/4-SUDOwithPASS.sh' \033[0m \n"
					sudo su
				
				else
					# [ SUDO PERMISSIONS WITHOUT PASSWORD ] #
					echo "# [ SUDO PERMISSIONS WITHOUT PASSWORD ] #"
					# finish
					echo -e " \n\033[1;37m\033[41m[ !! INSTALLATION FINISHED !! ]\033[0m \n"
				fi
