#!/bin/bash

# All installation code taken from http://askubuntu.com/questions/470153/no-wireless-when-install-14-04-on-macbook-pro/470347#470347
# I just put it into a script.

# Root?
if [ "$EUID" != 0 ]
then
	echo "Must be run as root."
	echo "Try writing su <enter> <your_password> <enter> $0"
	echo "Or, if that didn't work, sudo $0"
	echo "Quiting..."
	exit 1
fi

# Checking to make sure needed stuff is present
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # Just in case
if [ ! -d "b43" ]
then
	echo "Directory not found. Please go to http://askubuntu.com/questions/470153/no-wireless-when-install-14-04-on-macbook-pro/470347#470347 for manual instructions."
	echo "Quiting..."
	exit 2
fi

# Installation code from http://askubuntu.com/questions/470153/no-wireless-when-install-14-04-on-macbook-pro/470347#470347
mkdir /lib/firmware/b43
cp b43/*  /lib/firmware/b43
modprobe -rv b43 
if ! modprobe -v b43
then
	echo "Driver installation failed."
	echo "Please see http://askubuntu.com/questions/470153/no-wireless-when-install-14-04-on-macbook-pro/470347#470347 so you can install it manually."
	echo "Quiting..."
	exit 3
fi
exit
