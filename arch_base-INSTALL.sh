#!/bin/bash 
set -e 


######################################################################
############### ARCH LINUX INSTALL BASE SYSTEM SCRIPT ################
######################################################################

echo -e " \033[1;33m[ STEP 00 - STARTING ARCH LINUX INSTALL BASE SYSTEM  ]\033[0m "
sleep 2

# ORDER #

# iso 01 [partition disk] MANUAL

	partitiondisk(){
			
		echo -e " \033[1;33m[ STEP 01 - STARTING DISK PARTITIONING ]\033[0m "
		
			cfdisk	
}

# iso 02 [make file systems]

	mkfilesystem(){

		echo -e " \033[1;33m[ STEP 02 - MAKING FILESYSTEMS ]\033[0m "

		# show partitions to choose from
			lsblk | grep sd

		# list the correct partitions name

			echo -e "\033[34m[ what the name of the boot partition? [sdx(?n)] ]\033[0m"
				read boot

			echo -e "\033[34m[ what the name of the swap partition? [sdx(?n)] ]\033[0m"
				read swap

			echo -e "\033[34m[ what the name of the home partition? [sdx(?n)] ]\033[0m"
				read home

			echo -e "\033[34m[ what the name of the root partition? [sdx(?n)] ]\033[0m"
				read root

		# make filesystem in /boot & /home & /mnt
	 			mkfs.ext4 /dev/$boot
				mkfs.ext4 /dev/$home
				mkfs.ext4 /dev/$root
		# make swap partition 
				mkswap /dev/$swap
		# enable swap partition 
				swapon /dev/$swap
}


# iso 03 [mount file system and enable swap]

	Mountfilesystem(){
		
		echo -e " \033[1;33m[ STEP 03 - MOUNTING FILESYSTEMS ]\033[0m  "

			# mount filesystem in root partition as /mnt 
				mount /dev/$root /mnt
			# create home and boot folder within /mnt
				mkdir /mnt/home /mnt/boot 
			# mount the partitions to their respective folder
				mount /dev/$boot /mnt/boot
				mount /dev/$home /mnt/home
			# check partitions	
				lsblk | grep sd

}

# iso 04 [set mirrorlist]
		

		echo -e " \033[1;33m[ STEP 04 - SETTING MIRRORLIST ]\033[0m  "
		sleep 1

# iso 05 [install kernel and firmware]

	kerneldownload(){
		
		echo -e " \033[1;33m[ STEP 05 - STARTING KERNEL AND FIRMWARE INSTALLATION ]\033[0m  "
		sleep 1
			
			# base 
			# base-devel
			# linux
			# linux-firmware
			# linux-lts
			# linux-lts-headers
				pacstrap /mnt base base-devel linux linux-lts linux-firmware linux-lts-headers
}

# iso 06 [generate file system tables]

	genFStables(){
		
		echo -e " \033[1;33m[ STEP 06 - GENERATING FILESYSTEM TABLES ]\033[0m  "
		sleep 1

			# Generate an fstab file
				genfstab -U /mnt >> /mnt/etc/fstab

}

# mnt 07 [install grub] 

	grubInstall(){

		echo -e " \033[1;33m[ STEP 07 - STARTING GRUB BOOTLOADER INSTALLATION ]\033[0m  "
		sleep 1

			# LOG AS ROOT IN /mnt
				arch-chroot /mnt

			# download grub
				pacman -S --noconfirm --needed grub
			
			# install grub
				grub-install --target=i386-pc /dev/sda
			
			# make grub config file
				grub-mkconfig -o /boot/grub/grub.cfg
	}

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



