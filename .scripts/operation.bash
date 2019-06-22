#!/bin/bash
#!/usr/bin/env bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.0.04"
engine_version="1.0.6 Marato"

# log
loc=~/EchoMinal/; # default clone location
log=~/.log/operation-status.log; # for track logs
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';

function operation(){
	printf "Searching Setup File 	: ";
	if ls $loc/.scripts/update.bash >> $log; then {
		printf "Found\n";
		printf "Copying Files 		: ";
		if mv -v $loc/.scripts/update.bash ~/.scripts/ >> $log; then printf "Done\n"; fi;
	}; else {
		sleep 0.5
	}; fi;
}

if operation; then {
	if bash ~/.scripts/update.bash; then sleep 0.5;
	else printf "$red"; printf "Already you're up to date $stop\n"; fi
};fi
