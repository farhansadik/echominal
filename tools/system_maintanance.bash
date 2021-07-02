#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/bash 

script_version="v1.0.06"  # Alpha

# Define variables
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; 
stop='\e[0m'; blink='\e[5m';

def_loc=~/.config/echominal; 									# default clone location
log=~/.config/echominal/log/termux_backup.log; 						# do not use direct '>' 
username=~/.config/echominal/username;
shell_style=~/.config/echominal/shell_style.cfg;
backup_loc=/sdcard/termux-backup;
current_timedate=`date +"%Y-%m-%d_%H:%M" --utc`;
termux_root=/data/data/com.termux/files;
update_file=/data/data/com.termux/files/home/.config/echominal/tools/update.bash

function pause(){
	# Purpose: Display pause prompt
	local message="$@"
	[ -z $message ] && message="Press [Enter] key to continue..."
	read -p "$message" readEnterKey
}

main_menu() {
	figlet "setting's";

	printf " [1]  Package Manager\n";
	printf " [2]  Echominal Settings\n";
	printf " [3]  Termux Backup/Restore\n";
	printf " [4]  Update Echominal\n"
	printf " [5]  Disk Usage\n"; 
	printf " [6]  Sytem Information\n"; 
	printf " [7]  Network Information\n"; # hostname & dns info 
	printf " [8]  Termux GUI Interface\n"; 
	printf " [9]  Poweroff\n";
	printf " [10] Reboot\n";
	printf " [11] Reboot to Recovery Mode \n"; 
	printf " [0]  Back\n";
}

pkgMAN_menu() {
	clear && figlet "pkgMAN"

	printf "\n [1]  Install Package\n";
	printf " [2]  Reinstall Package\n"; 
	printf " [3]  Search Package\n";
	printf " [4]  Uninstall/Remove Package\n";
	printf " [5]  Update Packages\n";
	printf " [6]  Fix Broken Packages\n";
	printf " [7]  Clean Cache\n"; 
	printf " [8]  View Package Information\n"; 
	printf " [9]  List all available package\n"
	printf " [10] List currently installed package\n"
	printf " [11] Termux Repository\n";
	printf " [0]  Back\n";
}

echominal_setup_menu() {
	clear && figlet "setting's"
	printf "\n [1] Termux Font\n";
	printf " [2] Termux Color Scheme\n";
	printf " [3] Change echominal shell style\n";
	printf " [0] Back\n";
}

function termux_br() {
	# termux backup restore 
	local br;
	
	while [[ "$br" != "0" ]]; do {

		printf "$green"
		clear && cowsay -f eyes "Termux Backup & Restore"

		printf "\n$stop [1] Backup Files \n";
		printf " [2] Restore Files \n";
		printf " [0] Back\n\n";

		echo -n "`cat $shell_style`" && read br; echo; 

		if [[ $br == 1 ]]; then {

			# log file 
			echo $current_timedate >> $log  ### log
			echo "Backup Log" >> $log   ### log
			echo >> $log

			printf "$yellow"
			printf " [*] redirecting to /files \n";

			cd $termux_root
			tar -cvzf $backup_loc/termux_file.tgz --owner=0 --group=0 home usr 
			printf " [*] archiving has been finished \n $stop"; 
			echo "backup process has been finished" >> $log; echo >> $log; echo && pause	
		}

		elif [[ $br == 2 ]]; then {
			cd $termux_root
			tar -xvzf $backup_loc/termux_file.tgz
			echo "restore process has been finished" >> $log; echo >> $log; echo && pause	
		} 

		elif [[ $br == 'q' || $br == 'exit' || $br == 'quit' || $br == 'quit()'  ]]; then exit 0;
		
		fi

	}
	done


}

function package_manager() {
	echo; # extra echo
	local pkg_man; 

	while [[ "$pkg_man" != "0" ]]; do {

		pkgMAN_menu && echo;
		echo -n "`cat $shell_style`" && read pkg_man; echo; 
		
		if [[ $pkg_man == 1 ]]; then {
			# install 
			echo; if read -p "package name ~> " package_name; then pkg install $package_name; fi; pause
		}
		elif [[ $pkg_man == 2 ]]; then {
			# reinstall
			echo; if read -p "package name ~> " package_name; then pkg reinstall $package_name; fi; pause
		}
		elif [[ $pkg_man == 3 ]]; then {
			# search 
			echo; if read -p "package name ~> " package_name; then pkg search $package_name; fi; pause
		}
		elif [[ $pkg_man == 4 ]]; then {
			# uninstall 
			echo; if read -p "package name ~> " package_name; then pkg remove $package_name; fi; pause
		}
		elif [[ $pkg_man == 5 ]]; then {
			# update 
			figlet "SYSMD"; 
			if pkg update; then pkg upgrade; fi; pause 
		}
		elif [[ $pkg_man == 6 ]]; then pkg install --fix-missing; pause # fix broken package 
		elif [[ $pkg_man == 7 ]]; then {
			# clean cache 	
			if pkg autoclean; then pkg clean; fi; pause 
		} 
		elif [[ $pkg_man == 8 ]]; then {
			# show package info		
			echo; if read -p "package name ~> " package_name; then pkg show $package_name; fi; pause
		}
		elif [[ $pkg_man == 9 ]]; then pkg list-all; pause
		elif [[ $pkg_man == 10 ]]; then pkg list-installed; pause
		elif [[ $pkg_man == 11 ]]; then termux-change-repo; pause
		elif [[ $pkg_man == 'q' || $pkg_man == 'exit' || $pkg_man == 'quit' || $pkg_man == 'quit()'  ]]; then exit 0;
		fi
	} done

}

function shell_style_settings() {
    printf "\n$deep_green" && printf "Please enter your short name\n$stop\n";
    read -p "enter user name    : " user && echo $user > $username;
    # read -p "enter host name : " pc && echo $pc > $pc_name;
    # hostname 'uname -o' for test only

    printf "\n$deep_green" && printf "Please select your style. This is how it should look like \n \n";
    printf "$yellow" && printf "[1] Arch Linux Style $stop
    [$red`cat $username`$white@$blue`uname -o`$white ~] $ \n";
    printf "$yellow" && printf "[2] Parrot Linux Style  $stop
    ┌─[$red`cat $username`$white@$blue`uname -o`$white]─[~]
    └─➤ \n";
    printf "$yellow" && printf "[3] Fish Shell Style  $stop
    $red`cat $username`$white@$blue`uname -o`$white ~> \n";
    printf "$yellow" && printf "[4] Marato Style $stop
    » $red`cat $username`$white@$blue`uname -o`$white╺─╸[~] \n"
    printf "$yellow" && printf "[*] Default Style $stop
    $red`cat $username`$white@$blue`uname -o`$white $ \n";

    printf "\n$deep_green" && printf "Please select a style, 1-3. enter to default.\n$stop";
    read -p "echominal % " style; printf "\n$red";

    if [[ $style == 1 ]]; then {
        echo "Installing ......"; sleep 0.5;
        if echo "[`cat $username`@`uname -o` ~] $ " > $shell_style; then {
            printf "Install Compleated\n";
        }; fi;
    }; elif [[ $style == 2 ]]; then {
        printf "Installing ......\n"; 
        echo "┌─[`cat $username`@`uname -o`]─[~]
└─➤ " > $shell_style; printf "Install Compleated\n";
    }; elif [[ $style == 3 ]]; then {
        printf "Installing ......\n"; sleep 0.5; echo "`cat $username`@`uname -o` ~> " > $shell_style; printf "Install Compleated\n";
    }; elif [[ $style == 4 ]]; then {
        printf "Installing ......\n"; sleep 0.5; echo "» `cat $username`@`uname -o`╺─╸[~] " > $shell_style; printf "Install Compleated\n";
    }; else {
        printf "Installing ......\n"; sleep 0.5; printf "Default Style Installing\n"; sleep 0.5; echo "`cat $username`@`uname -o` $ " > $shell_style; printf "Install Compleated\n";
    }; fi && printf "\n$stop";
}

function echominal_settings() {
	echo; # extra echo
	local settings; 

	while [ "$settings" != "0" ]; do {
		echominal_setup_menu && echo; 
		echo -n "`cat $shell_style`" && read settings; echo; 

		if [[ $settings == 1 ]]; then bash $HOME/.termux/fonts.sh && pause 
		elif [[ $settings == 2 ]]; then bash $HOME/.termux/colors.sh && pause
		elif [[ $settings == 3 ]]; then shell_style_settings && pause # echominal shell style 
		elif [[ $settings == 00 || $settings == 'q' || $settings == 'exit' || $settings == 'quit' || $settings == 'quit()'  ]]; then exit 0;
		fi

	} done 

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
	# root required for pc 
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

# Purpose - Get info about host such as dns, IP, and hostname
function host_info(){
    local dnsips=$(sed -e '/^$/d' /etc/resolv.conf | awk '{if (tolower($1)=="nameserver") print $2}')
    write_header " Hostname and DNS information "
    echo "Hostname : $(hostname -s)"
    echo "DNS domain : $(hostname -d)"
    echo "Fully qualified domain name : $(hostname -f)"
    echo "Network address (IP) : $(hostname -i)"
    echo "DNS name servers (DNS IP) : ${dnsips}"
    # pause
}

# Purpose - Network inferface and routing info
function net_info(){
    devices=$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
    write_header " Network information "
    echo "Total network interfaces found : $(wc -w <<<${devices})"
    
    echo "*** IP Addresses Information ***"
    ip -4 address show
    
    echo "***********************"
    echo "*** Network routing ***"
    echo "***********************"
    netstat -nr
    
    echo "**************************************"
    echo "*** Interface traffic information ***"
    echo "**************************************"
    netstat -i
    
    # pause 
}

# Purpose - Get Public IP address form your ISP
function ip_info(){
    cmd='curl -s'
    write_header " Public IP information "
    ipservice=checkip.dyndns.org
    pipecmd=(sed -e 's/.*Current IP Address: //' -e 's/<.*$//') #using brackets to use it as an array and avoid need of scaping
    $cmd "$ipservice" | "${pipecmd[@]}"
    # pause
    echo 
}

function termux_gui() {
	# Termux GUI Interface

	# https://github.com/adi1090x/termux-desktop
	echo "This features will be updated on letter version's "

}

function check_for_update() {
	# experimantal 
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
		# for test only
	  	if git -C $def_loc pull origin master; then {

	    printf '%s' "$GREEN"
	    printf '%s\n' '_____________________'
	    printf '%s\n' '< Updating Echominal >'
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

		echo "looking for update script"
		if [[ `ls -a $def_loc/tools | grep update.bash` == update.bash  ]] ; then {
			echo "found file"; bash $update_file
		}
		else {
			echo "sorry no $update_file has been found"; 
			printf "$red"; printf "Already you're up to date $stop\n"
		} fi
	  
	  } else {
	      printf "$red\n"; printf "Hooray! EchoMinal has been updated or at the current version.\n";
	  } fi

      sleep 0.5
    }; else {
      printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
    }; fi
}

main() {
	echo; # extra echo
	local a; 

	while [ "$a" != "0" ]; do {
		main_menu && echo; 
		echo -n "`cat $shell_style`" && read a; echo; 

		if [[ $a == 1 ]]; then package_manager 
		elif [[ $a == 2 ]]; then echominal_settings
		elif [[ $a == 3 ]]; then termux_br
		elif [[ $a == 4 ]];	then check_for_update; pause
		elif [[ $a == 5 ]]; then disk_info && pause 		# disk info/usage
		elif [[ $a == 6 ]]; then termux-info && pause		# system info 
		elif [[ $a == 7 ]]; then host_info; echo; net_info; echo; ip_info && pause	# hostname & dns info 
		elif [[ $a == 8 ]]; then termux_gui && pause		# Termux GUI Interface
		elif [[ $a == 9 ]]; then sudo poweroff
		elif [[ $a == 10 ]]; then sudo reboot 
		elif [[ $a == 11 ]]; then echo "Reboot to recovery" && pause
		elif [[ $a == 'q' || $a == 'exit' || $a == 'quit' || $a == 'quit()'  ]]; then exit 0;
		else echo "Invalid Options" && echo; fi

	} done 
} 

main
