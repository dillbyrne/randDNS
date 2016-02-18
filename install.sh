#!/bin/bash


BIN=randdns.sh
DIR=randdns
RUNLINK=/etc/network/if-up.d/randdns

function checkUser
{
	if [[ $EUID -ne 0 ]]; 
	then
		
		echo "Install Aborted\nThis script must be run as root" 1>&2
		exit 1
	fi
}

function install
{
	
	echo "Copying  files to the correct directories"
	cp -R $DIR /etc/
	cp $BIN /usr/sbin/randdns

	echo "Changing permissions"
	chmod 700 /usr/sbin/randdns
	chmod -R 600 /etc/$DIR/*
	
	echo "Changing ownership of files to root"
	chown -R root:root /etc/$DIR
	chown root:root /usr/sbin/randdns


	echo "Creating Symbolic link"
	ln -s /usr/sbin/randdns $RUNLINK

	echo "Install finished, DNS servers will be changed when network is brought up"

}


function main
{

	checkUser
	install

}

main
