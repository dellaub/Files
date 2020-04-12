#!/bin/bash 
set -e 


###################################################################################
##################### ARCH LINUX CONFIGURATION SCRIPT #############################
###################################################################################
																## CONFIGURATION ##
																################### 

# [ STARTUP ] #

echo -e " \033[1;33m[ STEP 00 - STARTING ARCH LINUX CONFIGURATION  ]\033[0m "
sleep 2

# USER CHECK

	USERCHECK=`echo $USER`
	ROOT="root"

if [ $USERCHECK =! $ROOT ]
then
			
	echo -e " \033[1;37m\033[41m[ !! ATTENTION !! change to a root privilege user and try again ]\033[0m \n"  
	sleep 2
	exit

else


	# [ FILES / PROGRAMS TO CONFIGURE ] #
	
		# clone custom configs at home
			cd
			#git clone https://github.com/dellaub/Files.git

	

	# 1. .xinitrc 

	# 2. .Bash_proflie

	# 2. .bashrc

	# 3. i3
		# DOCS="https://github.com/Airblader/i3"
		# DOCS="https://i3wm.org/docs/userguide.html"

		i3config(){

			echo -e " \033[1;33m[ STEP 01 - i3 CONFIGURATION  ]\033[0m "

				# backup original 
				cp ~/.config/i3/config ~/.config/i3/config.bak

				# replace original 
				mv ~/Files/.config/i3/config ~/.config/i3/config
		}
i3config

	# 4. rofi
		# DOCS=""

	# 5. i3blocks
		# DOCS="https://github.com/vivien/i3blocks.git"

	# 6. conky

	# 7. termite

	# 8. compton

	# 9. oh my zsh!
		#INSTALL="sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""


	# XX. Set up firewall

		# Install ufw:
			#sudo pacman -S ufw

		# Enable it.
			#sudo ufw enable 

		# Check its status:
			#sudo ufw status verbose

		# Enable the start-up with the system:
			#sudo systemctl enable ufw.service
fi
