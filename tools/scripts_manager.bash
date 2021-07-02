#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/bash 

script_version="0.1.03"  # Alpha

# Define variables
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; 
stop='\e[0m'; blink='\e[5m';

def_loc=~/.config/echominal; 													# default clone location
log=~/.config/echominal/log/system-status.log; 									# for running log  // not used 
scripts_installation_log=~/.config/echominal/log/scripts_installation.log;		# not used 	
shell_style=~/.config/echominal/shell_style.cfg;

function pause(){
	# Purpose: Display pause prompt
	local message="$@"
	[ -z $message ] && message="Press [Enter] key to continue..."
	read -p "$message" readEnterKey
}


main_menu() {
	# main menu 
	echo "Broadcasting from scripts manager"; echo 

	# echo "  [1] Weeman [non-root]";
	# echo "  [2] Hakku Framework [root]"; 
	# echo "  [3] Aircrack-ng [root]";

	echo " [1]  Information Gathering ";
	echo " [2]  Vulnerability Analysis";
	echo " [3]  Exploitation Tools";
	echo " [4]  Wireless Attacks";
	echo " [5]  Forensics Tools";
	echo " [6]  Web Applications";
	echo " [7]  Stress Testing";
	echo " [8]  Sniffing & Spoofing";
	echo " [9]  Password Attacks";
	echo " [10] Maintaining Access";
	echo " [11] Hardware Hacking";
	echo " [12] Reverse Engineering";
	echo " [13] Reporting Tools";

	echo " [0]  Back";
}

sub_int_menu() {
	# int menu 
	echo "  [1] Install\Update Script";
	echo "  [2] Run Script";
	echo "  [0] Back";
}

function main() {

	## need to create separate bash file for script 
	
	echo; # extra echo
	local a; 
	print_ok=" no functinality has been added here "

	while [ "$a" != "0" ]; do {
		main_menu
		echo; echo -n "`cat $shell_style`" && read a; echo; 

		if [[ $a == 1 ]]; then {
			# weeman 
			local weeman;
			
			while [ "$weeman" != "0" ]; do {
				sub_int_menu

				# need to add inpput finction perameter 
				echo; echo -n "`cat $shell_style`" && read weeman; echo; 

				if [[ $weeman == 1 ]]; then {
					echo $print_ok; echo 

				} elif [[ $weeman == 2 ]]; then {
					echo $print_ok; echo 

				} fi

			} done 

		} elif [[ $a == 2 ]]; then {
			# hakku 

			local hakku;
			
			while [ "$hakku" != "0" ]; do {

				printf "$red$blink"
				printf "Note\nYou need root access for this framework\n\n$stop";

				sub_int_menu
				# need to add inpput finction perameter 
				echo; echo -n "`cat $shell_style`" && read hakku; echo; 

				if [[ $hakku == 1 ]]; then {
					echo $print_ok; echo 

				} elif [[ $hakku == 2 ]]; then {
					echo $print_ok; echo 

				} fi

			} done 
			
		} elif [[ $a == 3 ]]; then {
			# aircrack

			local aircrack;
			
			while [ "$aircrack" != "0" ]; do {

				printf "$red$blink"
				printf "Note\nYou need root access for this framework\n\n$stop";
				sub_int_menu

				# need to add inpput finction perameter 
				echo; echo -n "`cat $shell_style`" && read aircrack; echo; 

				if [[ $aircrack == 1 ]]; then {
					echo $print_ok; echo 

				} elif [[ $aircrack == 2 ]]; then {
					echo $print_ok; echo 

				} fi

			} done 

		} else echo "Invalid Options" && echo; fi

	} done

	# end of scripts function
}

main
