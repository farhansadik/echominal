#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.2"

figlet "UninsTaLL"

red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; 
stop='\e[0m'; blink='\e[5m';

echo -e "\e[1m\e[32m==> \e[97mEngine...\e[0m";
printf "\e[1m\e[34m  -> \e[97mDeleting engine file         : \e[0m"; 	
if rm -rf /data/data/com.termux/files/usr/bin/echominal; 
then printf "$white" && printf "Done\n$stop"; else printf "$red" && printf "Failed\n$stop"; fi

echo -e "\e[1m\e[32m==> \e[97mBase...\e[0m";
printf "\e[1m\e[34m  -> \e[97mDeleting base file           : \e[0m";
if rm -rf ~/.config/echominal; 
then printf "$white" && printf "Done\n$stop"; else printf "$red" && printf "Failed\n$stop"; fi

echo
echo "no packages will be removed!"
echo "no backup-termux and MP3 directory will be removed! "
echo "termux file remained for color and font"