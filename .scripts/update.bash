#!/bin/bash
#!/usr/bin/env bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.0.07"
engine_version="1.0.6 Marato"

# log
loc=~/EchoMinal/; # default clone location
log=~/.log/update-status.log; # for track logs
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';

###################################################
#   PLEASE SPECIFY HERE
#   WHAT UPDATE U BRINGS HERE
#   LIKE A NEW INSTALLATION
###################################################

function UpdateEchominal() {
  echo "============================="
  echo "Update List"
  echo "============================="
  echo "1. Color-ui has been added"
  echo "2. Bug Fixes"
  echo

  read -p "do u want to update [y/n] " up
  if [[ $up == 'y' ]]; then {
      # replace engine
      printf "Copying Files     : ";
      if cd $loc && cp -rv .engine.bash $HOME >> $log; then printf "Done\n"; fi;
      printf "Deleting Files    : ";
      if rm -rv ~/.scripts/update.bash >> $log;  then printf "Done\n"; fi;
  }; elif [[ $up == 'n' ]]; then {
      echo "bye bye"
  }; else {
    printf "Invalid Options\n";
  }; fi

  echo
  echo "Latest Version $engine_version";
  echo "EchoMinal has been updated";
  echo "Thank You"
}
function CommingUpdate() {
  printf "$yellow";
  printf "============================\n"
  printf "$red New Update Comming Soon..... $yellow\n"
  printf "============================\n$red"
  printf "1 WIFI Cracking Script\n"
  printf "2 Weeman Fixes\n $stop"
  echo
}
#UpdateEchominal
CommingUpdate
