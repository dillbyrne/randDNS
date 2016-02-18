#!/bin/bash


RUNLINK=/etc/network/if-up.d/randdns

function checkUser
{
	if [[ $EUID -ne 0 ]]; 
	then
		
		echo "Install Aborted\nThis script must be run as root" 1>&2
		exit 1
	fi
}

function uninstall 
{ 

	echo "Removing symbolic link"
	rm $RUNLINK
	
	echo "Removing binary"
	rm /usr/sbin/randdns
	
	echo "Removing logfile"
	rm /var/log/randdns.log

	echo "Removing config files"
	rm -rf /etc/randdns
}


function main
{

	checkUser
	uninstall

}

main
