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

# [ FILES / PROGRAMS TO CONFIGURE ] #

# 1. .xinitrc 

# 2. .Bash_proflie

# 2. .bashrc

# 3. i3
	DOCS="https://github.com/Airblader/i3"
	DOCS="https://i3wm.org/docs/userguide.html"

# 4. rofi
	DOCS=""

# 5. i3blocks
	DOCS="https://github.com/vivien/i3blocks.git"

# 6. conky

# 7. termite

# 8. compton

# 9. oh my zsh!
	INSTALL="sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""


# XX. Set up firewall

	# Install ufw:
		sudo pacman -S ufw

	# Enable it.
		sudo ufw enable 

	# Check its status:
		sudo ufw status verbose

	# Enable the start-up with the system:
		sudo systemctl enable ufw.service
