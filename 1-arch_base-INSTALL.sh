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



# iso 04 [mount file system and enable swap]
	
	movescripts(){
		
		echo -e " \033[1;33m[ STEP 04 - MOVING INSTALL SCRIPTS INTO THE SYSTEM ]\033[0m  "

			# create home and boot folder within /mnt
				mkdir /mnt/.installscripts 
			
			# copy the second part of the installation to the system
				cp ~/Files/2-arch_base-INSTALL.sh /mnt/.installscripts 
				cp ~/Files/3-arch_apps-INSTALL.sh /mnt/.installscripts
				cp ~/Files/4-SUDOwithPASS.sh /mnt/.installscripts/
				cp ~/Files/5-arch_CONFIGfiles.sh /mnt/.installscripts/
			
			# make them executable
				chmod +x /mnt/.installscripts/2-arch_base-INSTALL.sh
				chmod +x /mnt/.installscripts/3-arch_apps-INSTALL.sh
				chmod +x /mnt/.installscripts/4-SUDOwithPASS.sh
				chmod +x /mnt/.installscripts/5-arch_CONFIGfiles.sh
}



# iso 05 [install kernel and firmware]

	kerneldownload(){
		
		echo -e " \033[1;33m[ STEP 05 - STARTING KERNEL AND FIRMWARE INSTALLATION ]\033[0m  "
		sleep 1
			
			# update repositories
				pacman -Sy		
			# base 
			# base-devel
			# linux
			# linux-firmware
			# linux-lts
			# linux-lts-headers
			# vi
				pacstrap /mnt base base-devel vi linux linux-lts linux-firmware linux-lts-headers
}



# iso 06 [generate file system tables]

	genFStables(){
		
		echo -e " \033[1;33m[ STEP 06 - GENERATING FILESYSTEM TABLES ]\033[0m  "
		sleep 1

			# Generate an fstab file
				genfstab -U /mnt >> /mnt/etc/fstab

}



# [ COMMANDS ] #

DONE=`echo -e " \033[1;32m[ FINISHED ]\033[0m"`


partitiondisk
echo $DONE

mkfilesystem
echo $DONE

Mountfilesystem
echo $DONE

movescripts 
echo $DONE

kerneldownload
echo $DONE

genFStables
echo $DONE



echo -e " \033[1;33m\033[44m[ PLEASE, WHEN YOU LOG IN AS ROOT: ]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 1 RUN THIS COMMAND $\033[1;37m . /.installscripts/2-arch_base-INSTALL.sh \033[0m\033[1;33m]\033[0m "
sleep 2


# iso 6.5 [generate file system tables]

loginsystem(){
		
		echo -e " \033[1;33m[ STEP 6.5 - LOGIN IN AS ROOT ]\033[0m  "
		sleep 1

			# LOG AS ROOT IN /mnt
				arch-chroot /mnt

}

loginsystem

	

