#!/bin/bash
#!/system/bin/bash
#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/bash

set import busybox
set import bash from busybox

script_version='1.3.07';
engine_version="1.0.6 Marato"

# Define variables
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';
loc=~/EchoMinal/; # default clone location

# shell-setting
user_name=~/.config/echominal/user_name.cfg;
pc_name=~/.config/echominal/pc_name.cfg;
shell_style=~/.config/echominal/shell_style.cfg;

# logs
log=~/.log/system-status.log;

function offline_installation() {

    echo -e "\e[1m\e[32m==> \e[97mSearching for files...\e[0m";
    printf "\e[1m\e[34m  -> \e[97mLocating installation script : \e[0m";
	if cd $loc && find install >> $log;
		then sleep 0.5 && printf "Found\n";
		else sleep 0.5 && printf "$red"; printf "Not Found\n"; fi
    printf "\e[1m\e[34m  -> \e[97mCreating files & folder 	  : \e[0m";
    if cd $HOME; mkdir ~/.log && touch ~/.log/system-status.log; # creating log file
    	then sleep 0.5 && printf "Done\n";
		else sleep 0.5 && printf "$red"; printf "Failed to create files & folder\n"; fi

	echo -e "\e[1m\e[32m==> \e[97mPreparing for installation...\e[0m";
	printf "\e[1m\e[34m  -> \e[97mCopyting Files 			  : \e[0m";
	if cd $loc && cp -rv .config .scripts .bashrc .engine.bash $HOME >> $log;
		then sleep 0.5 && printf "Done\n";
		else sleep 0.5 && printf "$red"; printf "Failed to copy files\n"; fi
}
online_installation() {
	echo && echo -e "$red\e[7m";
	printf "|--------------NOTE-------------|\n| this installation is going to |\n| need internet connection on   |\n| your android device. Otherwise|\n| you'll missing some of package|\n|-------------------------------|\n $stop";

	# checking for updates and upgrades
    echo -e "\e[1m\e[32m==> \e[97mUpdating Database......\e[0m";
    printf "\e[1m\e[34m  -> \e[97mChecking for updates....\e[0m\n";
    if apt update; then pkg upgrade; fi;

    # installing packages
    echo -e "\e[1m\e[32m==> \e[97mInstalling Packages......\e[0m";
    printf "\e[1m\e[34m  -> \e[97mInstalling Packages Set 1 ....\e[0m\n";
    pkg install screenfetch htop termux-api p7zip vim; #root-repo (is not needed);
    printf "\e[1m\e[34m  -> \e[97mInstalling Packages Set 2 ....\e[0m\n";
    pkg install figlet zip unzip zsh nano # required packages
}
function input_settings() {
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
function ccli_installation() {
	printf "$deep_green\n" && printf "Installing CCLi$yellow";
    echo; figlet "CCLi"; printf "\n $yellow"

    if printf "Installing Configuration : $red"; then {
		if less ~/.config/ccli/termux.cfg >> ~/.bashrc; then {
			printf "Bash Install Compleated$stop\n";
		}; fi
        printf "Installing Configuration : $red";
		if less ~/.config/ccli/termux.cfg >> ~/.zshrc; then {
			printf "Zsh Install Compleated$stop\n";
		}; fi
	}; fi;

}
function termux_ohmyzsh() {
# cloning git (termux-ohmyzsh)
git clone https://github.com/Cabbagec/termux-ohmyzsh.git "$HOME/termux-ohmyzsh" --depth 1

# moving-file
mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

# cloning git (oh-my-zsh)
git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1

# moving/copying-file
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"

# setting
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"

# cloning-git (zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
chsh -s zsh # getting permissions
echo "oh-my-zsh install complete!\nChoose your color scheme now~" && $HOME/.termux/colors.sh
echo "Choose your font now~" && $HOME/.termux/fonts.sh
}

clear && printf "$red"; printf "Script Version$yellow $script_version $red\n";
printf "Engine ~$deep_green Echominal$yellow $engine_version $stop";
echo  "
______________________
< Installing EchoMinal >
----------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )--
                ||----w |
                ||     ||";

printf "\n$red" && printf "Installing EchoMinal\n";
printf "$white" && echo -e "Loading Installation Script"; sleep 1
printf "$white" && echo -e "\e[5mPlease Wait.....\e[0m"; sleep 1

online_installation;
offline_installation;
if cd $HOME; then chmod +x $engine; fi; # getting permission
termux_ohmyzsh;
input_settings;
ccli_installation;
termux-reload-settings;

printf "$red\n" && echo "Please restart termux!"; printf "$stop\n";
printf "$deep_green" && printf "EchoMinal$yellow $engine_version\n$stop"
printf "$deep_green" && printf "Installation Script$yellow $script_version$stop\n$deep_green";
printf "Created by$red Farhan Sadik$stop\n$deep_green";
printf "Square Development Group\n"; printf "\n$stop" && exit 0;

# a script by farhan sadik
# square development group
