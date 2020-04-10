#!/bin/bash 
set -e 

# mnt 07 [install grub] 

	grubInstall(){

		echo -e " \033[1;33m[ STEP 07 - STARTING GRUB BOOTLOADER INSTALLATION ]\033[0m  "
		sleep 1

			# download grub
				pacman -S --noconfirm --needed grub
			
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
				sed 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers


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
					cp /etc/X11/xinit/xinitrc /home/.xinitrc					
				
				# edit .xinitrc
					sed 50q /etc/X11/xinit/xinitrc > /home/.xinitrc
				
				# add command to .xinitrc
					echo "setxkbmap be &" >> /home/.xinitrc ;   # keyboard layout
					echo "exec /usr/bin/i3" >> /home/.xinitrc	# i3 exec

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
				echo -e "\nif systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then" >> ~/.bash_profile
				echo -e "	exec startx" >> ~/.bash_profile
				echo -e "fi" >> ~/.bash_profile  


}

configureDE


# mnt 15 [unmount /mnt]
	
	rebootsys(){
		
		echo -e " \033[1;33m[ STEP 15 - UNMOUNTING /mnt  ]\033[0m "
		sleep 1

			# exit back to usb
				exit

			# UNMONT SYSTEM FROM the USB 
				# unmount /mnt from the installer 
				umount -R /mnt
			
			# reboot
				reboot
}

