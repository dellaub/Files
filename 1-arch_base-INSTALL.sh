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

partitiondisk


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

mkfilesystem


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

Mountfilesystem


# iso 3.5 [mount file system and enable swap]
	
	movescripts(){
		
		echo -e " \033[1;33m[ STEP 3.5 - MOVING INSTALL SCRIPTS INTO THE SYSTEM ]\033[0m  "

			# create home and boot folder within /mnt
				mkdir /mnt/home/installscripts 
			# copy the second part of the installation to the system
				cp ~/Files/2-arch_base-INSTALL.sh /mnt/home/installscripts 


}

movescriptscd 

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

kerneldownload


# iso 06 [generate file system tables]

	genFStables(){
		
		echo -e " \033[1;33m[ STEP 06 - GENERATING FILESYSTEM TABLES ]\033[0m  "
		sleep 1

			# Generate an fstab file
				genfstab -U /mnt >> /mnt/etc/fstab

}

genFStables

echo -e " \033[1;33m\033[44m[ PLEASE, WHEN YOU LOG IN AS ROOT: ]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 1 RUN THIS COMMAND $\033[1;37m cd /home/installscripts \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 2 THEN , THIS COMMAND $\033[1;37m chmod +x 2-arch_base-INSTALL \033[0m\033[1;33m]\033[0m "
sleep 2
echo -e " \033[1;33m\033[44m[ 3 AND THIS LAST ONE TO CONTINUE THE INSTALLATION $\033[1;37m ./2-arch_base-INSTALL \033[0m "


# iso 6.5 [generate file system tables]

loginsystem(){
		
		echo -e " \033[1;33m[ STEP 6.5 - LOGIN IN AS ROOT ]\033[0m  "
		sleep 1

			# LOG AS ROOT IN /mnt
				arch-chroot /mnt

}

loginsystem



	

