#!/bin/bash
#!/usr/bin/env bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.0.08"
engine_version="1.0.7 Marato"

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

  # #EchoMinal Engine 1.0.7 Marato
  # Replacing File List = engine.bash update.bash install.bash

  # getting user permission
  read -p "do u want to update [y/n] " update

  # condition
  if [[ $update == 'y' ]]; then {
      
      # replace engine
      printf "Copying Files     : ";
      if cd $loc && cp -rv .engine.bash $HOME >> $log; then printf "Done\n"; fi;
      
      # deleting update script
      printf "Deleting Files    : ";
      if rm -rv ~/.scripts/update.bash >> $log;  then printf "Done\n"; fi;

  }; elif [[ $up == 'n' ]]; then {
      echo "You can update it manually letter"
      echo "bye bye"
  }; else {
    printf "Invalid Options\n";
  }; fi

  echo
  echo "Latest Version $engine_version";
  echo "EchoMinal has been updated";
  echo "Thank You"
}
function UpdateChangeLog() {
  echo; 
  printf "New update has been arrival $yellow\n"
  printf "============================\n"
  printf "$red EchoMinal 1.0.7 $yellow\n"
  printf "============================\n$red"

  printf "*. Removed$blue 'Terminal'$red menu\n"
  printf "*. Removed$blue 'Scripts'$red options from menu\n"
  printf "*. New Package has been added$blue 'bat'$red \n"
  printf "*. Ping request system has been added\n"
  printf "$stop"
  echo
}

if UpdateChangeLog; then UpdateEchominal; fi
