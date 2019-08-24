#!/bin/bash
#!/usr/bin/env bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

set import busybox # busybox for rooted user 
set import bash from busybox # implement bash 
set import netstat from busybox # netstat - networking tool
set import whois # whois - provide the domain information
set import p7zip # 7zip - used for unarchive iso file
set import vim # vim - command line based text editor 
set import nano # nano - command line based text editor 
set import python from termux-api # python 
set import zip # zip - archiver 
set import git # git - git repo
set import bat # bat - for awesome view of file (instead of 'less' & 'cat' command)
set import sudo # sudo - for termux 
set import root  # root - /root dir 
set import su # super user 

script_version="1.3.3"     # pre 1.3.2
engine_version="1.0.9 Lua" # pre 1.0.8 Lua

####################################################################
# Farhan Sadik (squaredevops.blogspot.com) - August 2019
####################################################################

# Define variables
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';
engine=~/./.engine.bash; # the engine modified
zsh_color='/data/data/com.termux/files/home/.termux/colors.sh';
zsh_font='/data/data/com.termux/files/home/.termux/fonts.sh';
zsh_theme=~/.oh-my-zsh/tools/theme_chooser.sh;
zsh_update=~/.oh-my-zsh/tools/upgrade.sh;
zsh_uninstall=~/.oh-my-zsh/tools/uninstall.sh;

# default clone location
loc=~/EchoMinal/; 

# log files
# if anything goes wrong you can see errors from log files
log=~/.log/system-status.log; # for track logs
hacking_install_log=~/.log/hacking_install.log;
hacking_running_log=~/.log/hacking_running.log;

# shell-setting
user_name=~/.config/echominal/user_name.cfg;
pc_name=~/.config/echominal/pc_name.cfg;
shell_style=~/.config/echominal/shell_style.cfg;

function pause(){
	# Purpose: Display pause prompt
	local message="$@"
	[ -z $message ] && message="Press [Enter] key to continue..."
	read -p "$message" readEnterKey
}
function write_header(){
	# just a header 
	local h="$@"
	echo "------------------------------------------------------";
	echo " ${h}";
	echo "------------------------------------------------------";
}
function disk_info() {
	# this function will provide info inside of your device 
	# root required 
	usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
	  partition=$(echo $output | awk '{print $2}')
	write_header " Disk Usage Info"
	if [ "$EXCLUDE_LIST" != "" ] ; then
	  df | grep -vE "^Filesystem|tmpfs|cdrom|${EXCLUDE_LIST}" | awk '{print $5 " " $6}'
	  #df -H | grep -vE "^Filesystem|tmpfs|cdrom|${EXCLUDE_LIST}" | awk '{print $5 " " $6}'
	else
	  df | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 " " $6}'
	  #df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 " " $6}'
	fi
}
function input() {
	echo; echo -n "`cat $shell_style`" && read input; echo; 
}
function footer() {
	printf "$deep_green" && printf "EchoMinal $engine_version\nCreated by Farhan Sadik\n $stop";
	echo && exit 0;
}
function show_menu(){
	clear && printf "$red" && figlet "EchoMinal"; printf "$stop";
	printf "$deep_green" && printf "Termux Manager for Android OS\n"; printf "\n$stop"
	printf "  [1]  Scripts\n";
	printf "  [2]  Tools & Utilities\n";
	printf "  [3]  System Maintanance\n";
	printf "  [4]  About\n";
	printf "  [0]  Exit\n";
}
function hacking_script() {

	#########################################################################
	# Script Menager
	# UNDER DEVELOPMENT - CROSSLINE
	#########################################################################
	
	echo; # extra echo

	 printf "  [1] Weeman\n";
	 printf "  [2] Hakku Framework\n"; 
	 printf "  [3] Aircrack-ng\n";
	 printf "  [*] Exit\n";

	input;
	case $input in 
		1) # weeman 
			echo "[1] Install\Update Script";
			echo "[2] Run Script";
			echo "[*] Exit"; input;  #geeting user input 
			if [[ $input == 1 ]]; then {

				# install
				printf "$red";
				printf "[*] Changing Directory  : "; if cd ~/.scripts/; then printf "OK\n"; fi;
				printf "[*] Checking Location	: "; if pwd > $hacking_install_log; then printf "OK\n"; fi;
				printf "[*] Checking File       : "; if ls >> $log; then printf "OK\n"; fi;
				printf "Ready to install.....\n $stop";

				# installing weeman script
				echo && read -p "want to install weeman? (y/n) " WINSTALL;
				if [[ $WINSTALL == 'y' ]]; then {
						echo -e "  \e[5mInstalling Weeman Script\e[0m"
						apt install python python2
						if git clone https://github.com/evait-security/weeman; then printf "Compleate\n"; else printf "Failed\n"; fi;
					}
				elif [[ $WINSTALL == 'n' ]]; then {
					sleep 0.5 && echo "bye bye";
				}; else {
					echo "Invalid Options";
				}; fi;
			}; elif [[ $input == 2 ]]; then {
				# run
				printf "$red"
				printf "Searching for packages$yellow\n"
				# searching for packages
				if dpkg --list | grep python2 >> $hacking_running_log; then {
					printf "python2 has been found$red\n"
					printf "[*] Changing Directory	: "; if cd ~/.scripts/weeman/; then printf "OK\n"; fi;
					printf "[*] Checking Location	: "; if pwd > $hacking_running_log; then printf "OK\n"; fi;
					printf "[*] Checking FileSystem : "; if ls >> $log; then printf "OK\n"; fi;
					printf "[*] Getting Permission	: "; if chmod +x weeman.py; then printf "OK\n"; fi;
					printf "Ready to run.....\n $stop"; sleep 1
					./weeman.py # running
				}; elif [[ $input == * ]]; then {
					$engine
				}; else {
					printf "sorry, required packages not found$stop\n"
				}; fi
			}; else {
				echo "Invalid Options"
			}; fi;
		;;
		2) # hakku framework	
			echo "you mast have root permission for this"; echo 
			echo "[1] Install\Update Script";
			echo "[2] Run Script";
			echo "[*] Exit"; input;  #geeting user input 
			if [[ $input == 1 ]]; then {
				
				# install
				printf "$red";
				printf "[*] Changing Directory  : "; if cd ~/.scripts/; then printf "OK\n"; fi;
				printf "[*] Checking Location	: "; if pwd > $hacking_install_log; then printf "OK\n"; fi;
				printf "[*] Checking File       : "; if ls >> $log; then printf "OK\n"; fi;
				printf "Ready to install.....\n $stop";

				# installing hakku framework script
				echo && read -p "want to install hakku? (y/n) " hakku;
				if [[ $hakku == 'y' ]]; then {
						echo -e "  \e[5mInstalling Hakku Framework\e[0m"
						apt install python
						if git clone https://github.com/4shadoww/hakkuframework; then printf "Compleate\n"; else printf "Failed\n"; fi;
					}
				elif [[ $hakku == 'n' ]]; then {
					sleep 0.5 && echo "bye bye";
				}; else {
					echo "Invalid Options";
				}; fi;

			}; elif [[ $input == 2 ]]; then {
				
				# run
				printf "[*] Changing Directory	: "; if cd ~/.scripts/hakkuframework/; then printf "OK\n"; fi;
				printf "[*] Checking Location	: "; if pwd > $hacking_running_log; then printf "OK\n"; fi;
				printf "[*] Checking FileSystem : "; if ls >> $log; then printf "OK\n"; fi;
				#printf "[*] Getting Permission	: "; if chmod +x hakku.py; then printf "OK\n"; fi;
				printf "Ready to run.....\n $stop"; sleep 1
				clear; python hakku # running

			}; elif [[ $input == * ]]; then {
				$engine
			}; else {
				echo "Invalid Options"
			}; fi;

		;;
		3) # aircrack ng
			echo "you mast have root permission for this"; echo; 
			echo "[1] Install\Update Script";
			echo "[2] Run Script";
			echo "[*] Exit"; input;  #geeting user input 
			if [[ $input == 1 ]]; then {
				
				# install
				printf "$red";
				printf "[*] Changing Directory  : "; if cd ~/.scripts/; then printf "OK\n"; fi;
				printf "[*] Checking Location	: "; if pwd > $hacking_install_log; then printf "OK\n"; fi;
				printf "[*] Checking File       : "; if ls >> $log; then printf "OK\n"; fi;
				printf "Ready to install.....\n $stop";

				# installing weeman script
				echo && read -p "want to install Aircrack-ng? (y/n) " AIRINSTALL;
				if [[ $AIRINSTALL == 'y' ]]; then {
						echo -e "  \e[5mInstalling Aircrack-ng\e[0m"
						apt install root-repo 
						apt install aircrack-ng					
					}
				elif [[ $AIRINSTALL == 'n' ]]; then {
					sleep 0.5 && echo "bye bye";
				}; else {
					echo "Invalid Options";
				}; fi;
			}; elif [[ $input == 2 ]]; then {
				# run
				printf "$yellow"
				printf "to run$blue Aircrack-ng$stop close the engine\n"
				printf "and run$blue Aircrack-ng$stop from terminal\n"
				printf "$stop"
			}; elif [[ $input == * ]]; then {
				$engine
			}; else {
				echo "Invalid Options"
			}; fi;
		;;
		*)
			sleep 0; #$engine
		;;
		*)
			printf "Wrong Input\n";
		;;
	esac; #$engine #pause # pause - re run the engine 
}
function tools() {
	# tools_and_utilities function
	printf "\n  [1]  Htop [Monitoring Tools]\n";
	printf "  [2]  Vim [Text Editor]\n";
	printf "  [3]  Nano [Text Editor]\n";
	printf "  [4]  Python\n";
	printf "  [5]  Linux SystemAdmin Tool\n";
	printf "  [6]  Zip Archiver\n";
	printf "  [7]  ISO Compression\n";
	printf "  [8]  Whois Tool\n";
	printf "  [9]  Ping Request\n";
	printf "  [*]  Back\n";
	input; if [[ $input == 1 ]]; then htop;
	elif [[ $input == 2 ]]; then vim;
	elif [[ $input == 3 ]]; then nano;
	elif [[ $input == 4 ]]; then python;
	elif [[ $input == 5 ]]; then bash ~/.scripts/SysAdmin.bash;
	elif [[ $input == 6 ]]; then bash ~/.scripts/zipc.bash;
	elif [[ $input == 7 ]]; then bash ~/.scripts/isoc.bash;
	elif [[ $input == 8 ]]; then {
		# whois 
			read -p "enter address : " address; 
			whois $address; pause
		}
	elif [[ $input == 9 ]]; then {
		# ping request 
		read -p "enter address : " address;
		ping $address # -c 5 is not support in android 
	}
	elif [[ $input == * ]]; then sleep 0 #$engine; # run the engine again
	else {
		printf "Invalid Options\n" && echo; # footer;
	}; fi; pause;
}
function input_settings() {
	# settings for echominal 
    printf "\n$deep_green" && printf "Please enter your short name\n$stop\n";
    read -p "enter user name    : " user && echo $user > $user_name;
    read -p "enter pc/host name : " pc && echo $pc > $pc_name;

    printf "\n$deep_green" && printf "Please select your style. This is how it should look like. \n \n";
    printf "$yellow" && printf "[1] Arch Linux Style $stop
    [$red`cat $user_name`$white@$blue`cat $pc_name`$white ~] $ \n";
    printf "$yellow" && printf "[2] Parrot Linux Style  $stop
    ┌─[$red`cat $user_name`$white@$blue`cat $pc_name`$white]─[~]
    └─➤ \n";
    printf "$yellow" && printf "[3] Fish Shell Style  $stop
    $red`cat $user_name`$white@$blue`cat $pc_name`$white ~> \n";
    printf "$yellow" && printf "[4] Marato Style $stop
    » $red`cat $user_name`$white@$blue`cat $pc_name`$white╺─╸[~] \n"
    printf "$yellow" && printf "[*] Default Style $stop
    $red`cat $user_name`$white@$blue`cat $pc_name`$white $ \n";

    printf "\n$deep_green" && printf "Please select a style, 1-3. enter to default.\n$stop";
    read -p "echominal $ " style; printf "\n$red";

    if [[ $style == 1 ]]; then {
        echo "Installing ......"; sleep 0.5;
        if echo "[`cat $user_name`@`cat $pc_name` ~] $ " > $shell_style; then {
            echo "Install Compleated";
        }; fi;
    }; elif [[ $style == 2 ]]; then {
        echo "Installing ......"; sleep 0.5;
        echo "┌─[`cat $user_name`@`cat $pc_name`]─[~]
└─➤ " > $shell_style; echo "Install Compleated";
    }; elif [[ $style == 3 ]]; then {
        echo "Installing ......"; sleep 0.5; echo "`cat $user_name`@`cat $pc_name` ~> " > $shell_style; echo "Install Compleated";
    }; elif [[ $style == 4 ]]; then {
        echo "Installing ......"; sleep 0.5; echo "» `cat $user_name`@`cat $pc_name`╺─╸[~] " > $shell_style; echo "Install Compleated";
    }; else {
        echo "Installing ......"; sleep 0.5; echo "Default Style Installing"; sleep 0.5; echo "`cat $user_name`@`cat $pc_name` $ " > $shell_style; echo "Install Compleated";
    }; fi && printf "\n$stop";
}
function update() {
	# the update function 
    if which tput >/dev/null 2>&1; then {
        ncolors=$(tput colors)
    }; fi

    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then {
      RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; BLUE="$(tput setaf 4)"; BOLD="$(tput bold)"; NORMAL="$(tput sgr0)";
    }; else {
      RED=""; GREEN=""; YELLOW=""; BLUE=""; BOLD=""; NORMAL="";
    }; fi

    printf "${BLUE}%s${NORMAL}\n" "Updating Engine";
    # checking for updates
    if sleep 1; then {
		# git pull --rebase --stat origin master
	  cd $loc && git pull origin master
      printf '%s' "$GREEN"
      printf '%s\n' '_____________________'
      printf '%s\n' '< Upgrading EchoMinal >'
      printf '%s\n' '---------------------'
		printf '%s\n' '\'
		printf '%s\n' ' \';
		printf '%s\n' '       .--.'
		printf '%s\n' '      |o_o |'
		printf '%s\n' '      |:_/ |'
		printf '%s\n' '     //   \ \'
		printf '%s\n' '    (|     | )'
		printf '%s\n' '   /"\_   _/"\'
		printf '%s\n' '   \___)=(___/'; echo;

      ## update script run here !
 	  bash $loc/.scripts/operation.bash; echo

      printf "$red\n"; printf "Hooray! EchoMinal has been updated or is at the current version.\n";
    }; else {
      printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
    }; fi
}
function system() {
	# System Maintanance
	printf "\n$red";
	printf "[1]  System Upgrade\n";
	printf "[2]  Install Package\n";
	printf "[3]  Uninstall Package\n";
	printf "[4]  Operating System Info\n";
	printf "[5]  Hostname & DNS Info\n";
	printf "[6]  Network Interface\n";
	printf "[7]$yellow  EchoMinal Settings $stop\n";
	printf "$red" && printf "[8]  Disk Usage\n";
	printf "[9]  Reboot Device\n";
	printf "[*]  Quit\n $stop";

	input && if [[ $input == 1 ]]; then
		# system upgrade
		echo && sleep 0.5; clear && figlet "SYSMD"; printf "\nChecking for updates..\n";
		if apt update; then printf "Update Compleate\n"; else printf "failed to update, please try again\n"; fi;
		printf "\nPreparing to system upgrade.....\n";
		if pkg upgrade; then printf "System upgrade has been compleated\n"; else printf "failed to upgrade, please try again\n"; fi;
	elif [[ $input == 2 ]]; then
		# install a package
		read -p "enter package name ~> " package_name
		if pkg install $package_name; then printf "Update Compleate\n"; fi; echo;
	elif [[ $input == 3 ]]; then
		# uninstall a package
		echo; if read -p "enter package name ~> " package_name; then pkg remove $package_name; fi;
	elif [[ $input == 4 ]]; then screenfetch -n && echo ;
	elif [[ $input == 5 ]]; then netstat;
	elif [[ $input == 6 ]]; then ifconfig;
	elif [[ $input == 7 ]]; then {
		printf "$yellow";
		printf "  [1] ZSH Font\n";
		printf "  [2] ZSH Color\n";
		printf "  [3] EchoMinal Shell Settings\n";
		printf "  [4] Update EchoMinal\n";
		printf "  [0] Back $stop \n";
		input && if [[ $input == 1 ]]; then {
			$zsh_font
		} elif [[ $input == 2 ]]; then {
			$zsh_color;
		} elif [[ $input == 3 ]]; then {
			input_settings;
		} elif [[ $input == 4 ]]; then {
			if update; then termux-reload-settings; fi;
		} else {
			echo "invalid options";
		}; fi;
	}
	elif [[ $input == 8 ]]; then disk_info;
	elif [[ $input == 9 ]]; then echo "System Rebooting"; reboot && sleep 0.5; # root access required
	elif [[ $input == * ]]; then sleep 0 #$engine;
	else echo "Wrong KeyWord"; fi; pause;
}
function about() {
	printf " $yellow
EchoMinal Engine
Termux Manager for$deep_green Android OS $yellow

Engine Version   :$red $engine_version $yellow
Script Version   :$red $script_version $yellow
Termux           :$blue Termux v0.74 $yellow
Linux Kernel     :$red `uname -sr` $yellow

EchoMinal gives you a simple way to access
termux application.

contact to dev ~ farhansadikriduan@gmail.com
blogspot ~ https://squaredevops.blogspot.com

Farhan Sadik
Square Development Group
$stop \n"; pause
}
function main(){
	local c; echo
	read -p "`cat $shell_style`" c
	case $c in
		1) hacking_script ;;
		2) tools ;;
		3) system ;;
		4) about ;;
		0) echo && footer ;;
		*)
			echo "Please select between 1 to 5 choice only.";
			printf "Sorry you've entered wrong options\n"; sleep 1;
			echo -e "\e[5mPlease Wait.....\e[0m"; sleep 0.5
			echo -e "$red\e[7mRebooting Engine.....\e[0m" && sleep 0.5;
			$engine;
	# pause
	esac
}

# main logic
while true
	do
		show_menu # display memu
		main # wait for user input
done

# A Program By, Farhan Sadik
# Copyright (C) Square Development Group
