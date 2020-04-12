#!/bin/bash 
set -e 


######################################################################
############### ARCH LINUX INSTALL SUDO WITH PASSWORD ################
######################################################################
												

# [ STARTUP ] #
		echo "\033[1;37m# [ SUDO PERMISSIONS WITHOUT PASSWORD ] #\033[0m "

		# enable sudo without password to the new user	
		sed 's/%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers > /etc/sudoers.tmp
		mv /etc/sudoers.tmp /etc/sudoers
		
		sed 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers > /etc/sudoers.tmp2
		mv /etc/sudoers.tmp2 /etc/sudoers
		cat /etc/sudoers

		# finish
		echo -e " \n\033[1;37m\033[41m[ !! INSTALLATION FINISHED !! ]\033[0m \n"
