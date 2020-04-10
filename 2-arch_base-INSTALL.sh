#!/bin/bash 
set -e 


#######################################################################
############### ARCH LINUX INSTALL APPLICATIONS SCRIPT ################
#######################################################################
						  ## BASE.SYSTEM 2 ##
						  ################### 

# iso [set mirrorlist]
		
		setmirrors(){

			echo -e " \033[1;33m[ SETTING MIRRORS ] \033[0m  "
			sleep 1

				# go to mirror list location
					cd /etc/pacman.d/ 
				# create header
					sed '5q' mirrorlist > fastmirrors
				# list the closest countries

					echo -e "\033[32m[ name of your country (i.e : France , Belgium) ]\033[0m"
						read country

					echo -e "\033[32m[ what is THE CLOSEST country to yours? ]\033[0m"
						read close1

					echo -e "\033[32m[ what is THE SECOND CLOSEST country to yours? ]\033[0m"
						read close2

					echo -e "\033[32m[ what is THE THIRD CLOSEST country to yours? ]\033[0m"
						read close3				
				
				#append MIRROR SERVERS countries selected to fastmirrors
					grep -A 1 "$country" mirrorlist | tr -d '-' >> fastmirrors
					grep -A 1 "$close1" mirrorlist | tr -d '-' >> fastmirrors
					grep -A 1 "$close2" mirrorlist | tr -d '-' >> fastmirrors
					grep -A 1 "$close3" mirrorlist | tr -d '-' >> fastmirrors	
				# add remainder of the mirrors
					sed -n '7,573 p' mirrorlist >> fastmirrors
				# backup mirrorlist file
					cp mirrorlist mirrorlist.bak
				# enable fastmirrors file
					mv fastmirrors mirrorlist
}

setmirrors




# mnt 07 [install grub] 

	grubInstall(){

		echo -e " \033[1;33m[ STEP 07 - STARTING GRUB BOOTLOADER INSTALLATION ]\033[0m  "
		sleep 1

			# download grub
				pacman -Sy --noconfirm --needed grub
			
			# install grub
				grub-install --target=i386-pc /dev/sda
			
			# make grub config file
				grub-mkconfig -o /boot/grub/grub.cfg
}
	
grubInstall


# mnt 08 [add new user]
		
	adduser(){
		
		echo -e " \033[1;33m[ STEP 08 - CREATING LOW PRIVILEGED USER ]\033[0m   "
		sleep 1
			
					
			# ask for user name and hostname


				echo -e "\033[32m[ SET HOSTNAME ]\033[0m"
					read HOST

				echo -e "\033[32m[ SET USERNAME ]\033[0m"
					read USER


			# add user to wheel group
				useradd -m -g wheel $USER
			
			# set password
				echo -e " \033[1;33m[ SET PASSWORD FOR $USER ]\033[0m"
				passwd $USER
			
			#set host name (computer name)
				echo "hostname" > /etc/hostname

			# enable sudo to the new user	
				sed 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers > /etc/sudoers
}

adduser


# mnt 09 [change passwords]
	
	rootpass(){	

		echo -e " \033[1;33m[ STEP 09 - SETTING ROOT PASSWORD ]\033[0m  "
		sleep 1

				# set root password ( while root ) 
					passwd				
}

rootpass


# mnt 10 [install essential packages]

	essentialPKGS(){

		echo -e " \033[1;33m[ STEP 10 - STARTING ESSENTIAL PACKAGES INSTALLATION ]\033[0m  "
		sleep 1

			# man-db
			# neovim
			# util-linux
			# networkmanager
				pacman -S --noconfirm --needed man-db networkmanager neovim util-linux
				
			# zsh		
			# zsh-autosuggestions	 	
			# zsh-completions	 	
			# zsh-syntax-highlighting
				pacman -S --noconfirm --needed zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting

			# termite
			# git
			# curl
			# wget
				pacman -S --noconfirm --needed termite git curl wget		

			# enable networkmanager	(autostart every login)
				systemctl enable NetworkManager
}

essentialPKGS


# mnt 11 [install GUI]
	
	installGUI(){

		echo -e " \033[1;33m[ STEP 11 - STARTING GRAPHICAL USER INTERFACE INSTALLATION ]\033[0m  "	
		sleep 1
			
			# xorg-server
			# xorg-xinit
				pacman -S --noconfirm --needed xorg-server xorg-xinit

			# xf86-video-ati or [ virtualbox-guest-utils ]
			# mesa
				pacman -S --noconfirm --needed xf86-video-ati virtualbox-guest-utils mesa
			
			# rxvt-unicode
				pacman -S --noconfirm --needed rxvt-unicode
}

installGUI


# mnt 12 [configure GUI]

	configureGUI(){		

		echo -e " \033[1;33m[ STEP 12 - CONFIGURING GRAPHICAL USER INTERFACE INSTALLATION ]\033[0m  "
		sleep 1

				# copy xinitrc file from /etc/X11/xinit
					cp /etc/X11/xinit/xinitrc ~/.xinitrc					
				
				# edit .xinitrc
					sed 50q /etc/X11/xinit/xinitrc > ~/.xinitrc
				
				# add command to .xinitrc
					echo "setxkbmap be &" >>  ~/.xinitrc ;   # keyboard layout
					echo "exec /usr/bin/i3" >> ~/.xinitrc	# i3 exec
}

configureGUI



# mnt 13 [install Desktop environment]

	installDeskEnv(){

		echo -e " \033[1;33m[ STEP 13 - STARTING DESKTOP ENVIRONMENT INSTALLATION ]\033[0m "	
		sleep 1
			
			# i3-gaps
			# i3status
			# i3blocks
				pacman -S --noconfirm --needed i3-gaps i3blocks i3status

			# rofi
				pacman -S --noconfirm --needed rofi
			
			# ttf-font-awesome
			# ttf-bitstream-vera
				pacman -S --noconfirm --needed ttf-bitstream-vera ttf-font-awesome
}

installDeskEnv


# mnt 14 [configure Desktop environment]
		
	configureDE(){	

		echo -e " \033[1;33m[ STEP 14 - CONFIGURING DESKTOP ENVIRONMENT INSTALLATION ]\033[0m"
		sleep 1	

			
			# copy .bash_profile to ~/
				cp /etc/skel/.bash_profile ~/

			# autostart i3 
				echo -e "\nif systemctl -q is-active graphical.target && [[ ! \$DISPLAY && \$XDG_VTNR -eq 1 ]]; then" >> ~/.bash_profile
				echo -e "	exec startx" >> ~/.bash_profile
				echo -e "fi" >> ~/.bash_profile  
}

configureDE


echo -e " \033[1;33m\033[44m[ PLEASE, WHEN YOU LOG BACK TO THE USB: ]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 1 RUN THIS COMMAND $\033[1;37m exit \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 2 THEN INSIDE THE ISO , RUN THIS COMMAND $\033[1;37m umount -R /mnt \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 3 FINALLY , THIS COMMAND $\033[1;37m reboot \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;32m\033[44m[ 4 AFTER REBOOT OPEN A TERMINAL AND RUN THIS COMMAND $\033[1;37m cd ~/installscripts \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;32m\033[44m[ 5 THEN , THIS COMMAND $\033[1;37m chmod +x 3-arch_apps-INSTALL.sh \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;32m\033[44m[ 6 AND THIS LAST ONE TO CONTINUE THE INSTALLATION $\033[1;37m ./3-arch_apps-INSTALL.sh \033[0m "
