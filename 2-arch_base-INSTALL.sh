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
		

		echo -e " \033[1;33m[ STEP 08 - CREATING LOW PRIVILEGED USER ]\033[0m   "
		sleep 1

# mnt 09 [change passwords]
		

		echo -e " \033[1;33m[ STEP 09 - CHANGING ROOT PASSWORD ]\033[0m  "
		sleep 1

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

# mnt 11 [install GUI]
	
	installGUI(){

		echo -e " \033[1;33m[ STEP 11 - STARTING GRAPHICAL USER INTERFACE INSTALLATION ]\033[0m  "	
		sleep 1
			
			# xorg-server
			# xorg-init
				pacman -S --noconfirm --needed xorg-server xorg-init

			# xf86-video-ati or [ virtualbox-guest-utils ]
			# mesa
				pacman -S --noconfirm --needed xf86-video-ati virtualbox-guest-utils mesa
			
			# rxvt-unicode
				pacman -S --noconfirm --needed rxvt-unicode

}
# mnt 12 [configure GUI]
		

		echo -e " \033[1;33m[ STEP 12 - CONFIGURING GRAPHICAL USER INTERFACE INSTALLATION ]\033[0m  "
		sleep 1

# mnt 13 [install Desktop environment]

	installDeskEnv(){

		echo -e " \033[1;33m[ STEP 13 - STARTING DESKTOP ENVIRONMENT INSTALLATION ]\033[0m "	
		sleep 1
			
			# xorg-server
			# xorg-init
				pacman -S --noconfirm --needed xorg-server xorg-init

			# xf86-video-ati or [ virtualbox-guest-utils ]
			# mesa
				pacman -S --noconfirm --needed xf86-video-ati mesa
			
			# rxvt-unicode
				pacman -S --noconfirm --needed rxvt-unicode
				
}

# mnt 14 [configure Desktop environment]
echo -e " \033[1;33m[ STEP 14 - CONFIGURING DESKTOP ENVIRONMENT INSTALLATION "
sleep 1

# mnt 15 [unmount /mnt]
	
	reboot(){
		
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

