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

if [ $USERCHECK != $ROOT ]
then
			
	echo -e " \033[1;37m\033[41m[ !! ATTENTION !! change to a ROOT privilege user and try again ]\033[0m \n"  
	sleep 2
	exit

else
	


	# synchronize the repositories
		sudo pacman -Sy


				}
	# [ PART 2 ] #
	
		#	3.3	TIME ZONE

			TIME_ZONE(){

				echo -e "\033[36m[ What is your region ?  (i.e : Europe , Asia ...) ]\033[0m"
					read REGION

				echo -e "\033[36m[ what is the capital of your country ? (i.e : Brussels, Paris ...) ]\033[0m"
					read CITY

					# Set Timezone
						ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime

					# Set Hardware clock
						hwclock --systohc
			}

		#	3.4	LOCALIZATION

				LOCALE(){

					# edit locale.gen
						sed 's/# en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen > /etc/locale.tmp

					# replace original 
						mv /etc/locale.tmp /etc/locale.gen

					# generate localization file
						locale-gen

					# create a language config file
						echo "LANG=fr_BE.UTF-8" > /etc/locale.conf

					# create a keyboard layout config file (presistent)
						echo "KEYMAP=be-latin1" > /etc/vconsole.conf	
				}		
	
		#	3.5	NETWORK CONFIGURATION

				NETWORK1(){

					# Ask for host name
						echo -e "\033[32m[ SET HOSTNAME ]\033[0m"
							read HOST

					# set host name (computer name)
						echo "$HOST" > /etc/hostname

					# set static ip adresses
						echo "127.0.0.1			localhost" > /etc/hosts
						echo "127.0.1.1			$HOST" >> /etc/hosts

					# Satr and enable network manager
						systemctl start NetworkManager.service
						systemctl enable NetworkManager.service

				}
	
		#	3.7	ROOT PASSWORD

				ROOTPASS(){

					# set root password ( while root ) 
						passwd
				}
	
		#	3.8	BOOT LOADER

				BOOT_LOADER(){

					# download grub
						pacman -Sy --noconfirm --needed grub
					
					# install grub
						grub-install --target=i386-pc /dev/sda
					
					# make grub config file
						grub-mkconfig -o /boot/grub/grub.cfg
				}
##################
#### COMMANDS ####
##				##
	TIME_ZONE	##
	LOCALE		##			
	NETWORK1	##
	ROOTPASS	##
	BOOT_LOADER	##
##				##
#########################################################################################
#	4	REBOOT  ########################################################################
		
		# [ INFORMATION TO UNMOUNT FROM THE USB AND ] #

			echo -e " \033[1;33m\033[44m[ 1 PLEASE, RUN THIS COMMAND $\033[1;37m exit \033[0m\033[1;33m]\033[0m "
			sleep 2
			echo -e " \033[1;33m\033[44m[ 2 THEN INSIDE THE ISO , RUN THIS COMMAND $\033[1;37m umount -R /mnt \033[0m\033[1;33m]\033[0m "
			sleep 2
			echo -e " \033[1;33m\033[44m[ 3 FINALLY REBOOT, WITH THIS COMMAND $\033[1;37m reboot \033[0m\033[1;33m]\033[0m "
			sleep 2

		# [ INSTRUCTIONS FOR AFTER REBOOTING ] #

			echo -e " \n\033[1;37m\033[41m[ !! ATTENTION !! remove iso from the system ]\033[0m \n"  
			sleep 2
			echo -e "\033[1;33m\033[44m[ AFTER REBOOTING, OPEN A TERMINAL AND RUN THIS COMMAND ]\n # \033[0m\033[1;37m\033[44m . /.installscripts/3-arch_apps-INSTALL.sh \033[0m"
			sleep 2

#######################################################################################

		












#!/bin/bash 
set -e 


#######################################################################
############### ARCH LINUX INSTALL APPLICATIONS SCRIPT ################
#######################################################################
													## APPLICATIONS ##
													################## 

# [ STARTUP ] #



#########################################################################################
#### [ PART 3 ] ########################################################################
#######################################################################################
	

		1	System administration
	#
	#		1.1	Users and groups

				# Ask for user
					echo -e "\033[32m[ SET USERNAME ]\033[0m"
					read USER

				# add user to wheel group
					useradd -m -G wheel $USER

				# set password
					echo -e " \033[1;33m[ SET PASSWORD FOR $USER ]\033[0m"
					passwd $USER	

	#		1.2	Privilege elevation

				# enable sudo to the new user WITHOUT PASSWORD IS TEMPORARY
					sed 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers > /etc/sudoers.tmp
					mv /etc/sudoers.tmp /etc/sudoers

	#		1.3	Service management
	
					pacman -S --noconfirm --needed git curl wget
	
	#		1.4	System maintenance
				
					# volumes and have trash control
					pacman -S --noconfirm --needed gvfs 	
					
					# Automatic mounting
					pacman -S --noconfirm --needed udisks2 

					# Removable disk automounter using udisks
					pacman -S --noconfirm --needed udiskie  

man-db
neovim



	#	
		2	Package management
	#
	#		2.5	Arch User Repository
			
				AUR_YAY(){

					package="yay"
						
						# create aur pkg directory
							mkdir /home/.AUR
			
						# move inside the directory
							cd /home/.AUR
			
						# clone package build
							git clone https://aur.archlinux.org/yay.git 
							cd yay
				
						# make package
							makepkg -si --noconfirm
							cd 
				}

		3	Booting
	#
	#		3.4	Num Lock activation
	#	
		4	Graphical user interface
	#
	#		4.1	Display server

				pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-apps

	#		4.2	Display drivers

				pacman -S --noconfirm --needed xf86-video-ati virtualbox-guest-utils 

	#		4.3	Desktop environments

				# panel and system tray 
				pacman -S --noconfirm --needed tint2 volumeicon

				# file managers 
				pacman -S --noconfirm --needed pcmanfm 	

				# compositor (FX)
				pacman -S --noconfirm --needed picom 

	#		4.4	Window manager
				
				# openbox
				pacman -S --noconfirm --needed openbox obkey obconf oblogout openbox-menu menumaker 
				
				# utilities
				pacman -S --noconfirm --needed xfdesktop xdotool  xdg-user-dirs

				# requirements
				pacman -S --noconfirm --needed xterm alacritty  




	#		4.5	Display manager

				pacman -S --noconfirm --needed lightdm lightdm-webkit2-greeter 

	#		4.6	User directories
	#	
		5	Power management
	#
	#		5.1	ACPI events
	#		5.2	CPU frequency scaling
	#		5.3	Laptops
	#		5.4	Suspend and hibernate
	#	
		6	Multimedia
	#
	#		6.1	Sound
	#		6.2	Browser plugins
	#		6.3	Codecs
	#	
		7	Networking
	#
	#		7.1	Clock synchronization
	#		7.2	DNS security
	#		7.3	Setting up a firewall
	#		7.4	Resource sharing
	#	
		8	Input devices
	#
	#		8.1	Keyboard layouts
	#		8.2	Mouse buttons
	#		8.3	Laptop touchpads
	#		8.4	TrackPoints
	#	
		9	Optimization
	#
	#		9.1	Benchmarking
	#		9.2	Improving performance
	#		9.3	Solid state drives
	#	
		10	System service
	#
	#		10.1	File index and search
	#		10.2	Local mail delivery
	#		10.3	Printing
	#	
		11	Appearance
	#
	#		11.1	Fonts
	#		11.2	GTK and Qt themes
	#	
		12	Console improvements
	#
	#		12.1	Tab-completion enhancements
	#		12.2	Aliases
	#		12.3	Alternative shells
	#		12.4	Bash additions
	#		12.5	Colored output
	#		12.6	Compressed files
	#		12.7	Console prompt
	#		12.8	Emacs shell
	#		12.9	Mouse support
	#		12.10	Scrollback buffer
	#		12.11	Session management
fi
