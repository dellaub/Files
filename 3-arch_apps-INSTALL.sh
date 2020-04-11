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

USERCHECK=`echo $USER`
if [ $USERCHECK -eq 'root' ]
then
	echo " your root .."
else
	echo ":your not root"
	
# synchronize the repositories
	pacman -Sy

	
## CREATE DIRECTORIES ##

	DIRECTORIES(){

		# create aur pkg directory
			mkdir ~/.aur_pkg
		
		# move inside the directory
			cd ~/.aur_pkg
	}


## INSTALLATION ##

	#[  STEP 01 -  ESSENTIAL ]#
		
		ESSENTIAL(){

			echo -e " \033[1;33m[  STEP 01 -  ESSENTIAL ]\033[0m "
			sleep 2
			
				# yay
					git clone https://aur.archlinux.org/yay.git 
					cd yay
					makepkg -si
					cd ~/.aur_pkg
		}			

	#[  STEP 02 -  AUDIO ]#

			
		AUDIO(){

			echo -e " \033[1;33m[  STEP 02 -  AUDIO ]\033[0m "
			sleep 2		

				# pulseaudio
				# pulseaudio-alsa
				# pavucontrol
					pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pavucontrol
				
				# alsa-utils
				# alsa-plugins
				# alsa-lib
				# alsa-firmware
					pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
				
				# audacity
					pacman -S --noconfirm --needed audacity
		}

	#[  STEP 03 -  MANAGEMENT ]#

		MANAGEMENT(){

			echo -e " \033[1;33m[  STEP 03 -  MANAGEMENT ]\033[0m "
			sleep 2


				# timeshift
					git clone https://aur.archlinux.org/timeshift.git 
					cd timeshift
					makepkg -si
					cd ~/.aur_pkg
				
				# net-tools
				# networkmanager
				# reflector
					pacman -S --noconfirm --needed net-tools networkmanager reflector
		}

	#[  STEP 04 -  BROWSER ]#

		BROWSER(){

			echo -e " \033[1;33m[ STEP 04 -  BROWSER ]\033[0m "
			sleep 2


				# brave
					git clone https://aur.archlinux.org/brave.git 
					cd brave
					makepkg -si
					cd ~/.aur_pkg
				
				# surf
					pacman -S --noconfirm --needed surf
		}

	#[  STEP 05 -  TEXT EDITOR ]#

		TEXT_EDITOR(){

			echo -e " \033[1;33m[ STEP 05 -  TEXT EDITOR ]\033[0m "
			sleep 2



				# sublime-text-3
					git clone https://aur.archlinux.org/sublime-text-dev.git 
					cd sublime-text-dev
					makepkg -si
					cd ~/.aur_pkg
		}

	#[  STEP 06 -  SYSTEM INFORMATION ]#

		SYS_INFO(){

			echo -e " \033[1;33m[  STEP 06 -  SYSTEM INFORMATION ]\033[0m "
			sleep 2

				# pfetch
					git clone https://aur.archlinux.org/pfetch.git 
					cd pfetch
					makepkg -si
					cd ~/.aur_pkg
				
				# dmidecode
				# htop
				# lm_sensors
				# bleachbit
				# vnstat
				# sysstat
					pacman -S --noconfirm --needed dmidecode htop lm_sensors bleachbit vnstat sysstat
		}

	#[  STEP 07 -  DOCUMENTS ]#

		DOCUMENTS(){

			echo -e " \033[1;33m[  STEP 07 -  DOCUMENTS ]\033[0m "
			sleep 2


				# libreOffice# 
				# zathura-pdf
				# vifm
					pacman -S --noconfirm --needed vifm libreoffice-fresh-en-gb zathura-pdf-mupdf
		}

	#[  STEP 08 -  ACCESSORIES ]#

		ACCESSORIES(){

			echo -e " \033[1;33m[ STEP 08 -  ACCESSORIES ]\033[0m "
			sleep 2


				# bc 
				# gcalculator
					pacman -S --noconfirm --needed bc gcalculator
				# wttr
					git clone https://aur.archlinux.org/wttr.git 
					cd wttr
					makepkg -si
					cd ~/.aur_pkg
		}

	#[  STEP 09 -  IMAGE ]#

		IMAGE(){

			echo -e " \033[1;33m[ STEP 09 -  IMAGE ]\033[0m "
			sleep 2


				# qview
					git clone https://aur.archlinux.org/qview.git 
					cd qview
					makepkg -si
					cd ~/.aur_pkg
				# gimp
				# xwallpaper
					pacman -S --noconfirm --needed gimp xwallpaper
		}

	#[  STEP 10 -  MEDIA ]#

		MEDIA(){

			echo -e " \033[1;33m[ STEP 10 -  MEDIA ]\033[0m "
			sleep 2


				# mpv
				# cmus
					pacman -S --noconfirm --needed mpv cmus
		}

	#[  STEP 11 -  DOWNLOADERS ]#

		DOWNLOADERS(){

			echo -e " \033[1;33m[ STEP 11 -  DOWNLOADERS ]\033[0m "
			sleep 2


				# transmission-cli
				# youtube-dl
					pacman -S --noconfirm --needed transmission-cli youtube-dl
		}

	#[  STEP 12 -  ZIP ]#

		ZIP(){

			echo -e " \033[1;33m[ STEP 12 -  ZIP ]\033[0m "
			sleep 2


				# transmission-cli
				# youtube-dl
					pacman -S --noconfirm --needed transmission-cli youtube-dl
		}

	#[  STEP 13 -  PRIVACY ]#




# [ COMMAND ORDER ] #

DIRECTORIES
ESSENTIAL
#AUDIO
#MANAGEMENT
#BROWSER
#TEXT_EDITOR
#SYS_INFO
#DOCUMENTS
#ACCESSORIES
#IMAGE
#MEDIA
#DOWNLOADERS
#ZIP
