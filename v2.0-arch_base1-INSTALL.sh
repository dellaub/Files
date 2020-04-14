#!/bin/bash 
set -e 


#######################################################################
############### ARCH LINUX INSTALL APPLICATIONS SCRIPT ################
#######################################################################
 ## BASE.SYSTEM 1 ##
 ################### 

# [ STARTUP ] #

echo -e " \033[1;33m[ STEP 00 - STARTING ARCH LINUX INSTALL BASE SYSTEM  ]\033[0m "
sleep 2

# [ ORDER ] # 

	#[ PART 1 ]#

		#   1.6 UPDATE SYSTEM CLOCK
				timedatectl set-ntp true

		1	Pre-installation

		#	1.7	PARTITION THE DISKS

				PARTITION(){
					
					echo -e " \033[1;33m[ STARTING DISK PARTITIONING ]\033[0m "
					
						cfdisk	
					}

		#	1.8	FORMAT THE PARTITIONS

				FORMAT_EXT4(){

					echo -e " \033[1;33m[ MAKING FILESYSTEMS ]\033[0m "

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

		#	1.9	MOUNT THE FILE SYSTEMS

				MOUNTFILESYS(){
				
					echo -e " \033[1;33m[ MOUNTING FILESYSTEMS ]\033[0m  "

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

		# 	1.10 MOVESCRIPTS 

				MOVESCRIPTS(){
				
					echo -e " \033[1;33m[ MOVING INSTALL SCRIPTS INTO THE SYSTEM ]\033[0m  "

						# create home and boot folder within /mnt
							mkdir /mnt/.installscripts 
						
						# copy the second part of the installation to the system
							cp ~/Files/2-arch_base-INSTALL.sh /mnt/.installscripts 
							cp ~/Files/3-arch_apps-INSTALL.sh /mnt/.installscripts
							cp ~/Files/4-SUDOwithPASS.sh /mnt/.installscripts/
							cp ~/Files/5-arch_CONFIGfiles.sh /mnt/.installscripts/
						
						# make them executable
							chmod +x /mnt/.installscripts/v2-arch_base2-INSTALL.sh
							chmod +x /mnt/.installscripts/v2-arch_apps-INSTALL.sh
							chmod +x /mnt/.installscripts/4-SUDOwithPASS.sh
							chmod +x /mnt/.installscripts/5-arch_CONFIGfiles.sh
				}	

		2	Installation

		#	2.1	SELECT THE MIRRORS
			
					MIRRORS(){


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

		#	2.2	INSTALL ESSENTIAL PACKAGES
				
					ESSENTIAL(){
					
						echo -e " \033[1;33m[ STARTING KERNEL AND FIRMWARE INSTALLATION ]\033[0m  "
						sleep 1
							
							# update repositories
								pacman -Sy		
							# base 
							# base-devel
							# linux
							# linux-firmware
							# linux-lts
							# linux-lts-headers
							# vim
								pacstrap /mnt base base-devel vim linux linux-lts linux-firmware linux-lts-headers 
					}
		#			

		3	Configure the system

			#	3.1	FSTAB
					
					FSTAB(){
						
						echo -e " \033[1;33m[ GENERATING FILESYSTEM TABLES ]\033[0m  "
						sleep 1

							# Generate an fstab file
								genfstab -U /mnt >> /mnt/etc/fstab
					}
###### COMMANDS ######
##					##
	PARTITION 		##
	FORMAT_EXT4		##
	MOUNTFILESYS	##
	MOVESCRIPTS		##
	MIRRORS 		##
	ESSENTIAL 		##
	FSTAB 			##
##					##
######################


	echo -e " \033[1;33m\033[44m[ PLEASE, WHEN YOU LOG IN AS ROOT: ]\033[0m "
	sleep 2
	echo -e " \033[1;33m\033[44m[ 1 RUN THIS COMMAND $\033[1;37m . /.installscripts/2-arch_base-INSTALL.sh \033[0m\033[1;33m]\033[0m "
	sleep 2
	
		
	
			#	3.2	CHROOT
	
				CHROOT(){
				
					echo -e " \033[1;33m[ LOGIN IN AS ROOT ]\033[0m  "
					sleep 1
	
						# LOG AS ROOT IN /mnt
							arch-chroot /mnt
				}

############		
	CHROOT ##
############
