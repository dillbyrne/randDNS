#!/bin/bash

# Randomly selects 2 DNS Servers from a user defined list
# and applies them each time the network is brought up
#
# License GNU GPL v3+
# dillbyrne 2016


CONF=/etc/randdns/randdns.conf

function getRandomDNSServer
{
	# ignore comments and blank lines in server list
	echo $(grep  -v -e '^#' -e '^$' $1 | shuf | tail -n 1)
}

function setRandomDNSServers
{
	getRandomDNSServer $SERVERS > $OUTFILE
	# avoid selecting the same server twice
	grep -vf $OUTFILE $SERVERS | getRandomDNSServer >> $OUTFILE
}


function Log
{
	if [[ $1 -eq 0 ]];
	then
		echo $(date) $(cat $OUTFILE) >> $LOGFILE
	fi
}


function main
{
	source $CONF
	setRandomDNSServers
	Log $LOGLEVEL
}

main
