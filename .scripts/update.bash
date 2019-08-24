#!/bin/bash
#!/usr/bin/env bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.1.03"    # prev - 0.1.02
engine_version="1.0.9 Lua" # prev - 1.0.8 Lua

# log
loc=~/EchoMinal/; # default clone location
log=~/.log/update-status.log; # for track logs
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';

###################################################
#   PLEASE SPECIFY HERE MANUALLY EVERYTHING
#   WHAT UPDATE U BRINGS HERE
###################################################

function UpdateEchominal() {

  # EchoMinal Engine 1.0.9 Lua
  # Replacing File List = engine.bash 

  # getting user permission
  read -p "do u want to update [y/n] " update

  # condition
  if [[ $update == 'y' ]]; then {

    # Simple Animation 
    copy

    # replaceing engine
    printf "Replacing Engine  : ";
    if cd $loc && cp -rv .engine.bash $HOME >> $log; then printf "Done\n"; fi;
      
    # removing messages
    printf "Replacing Engine  : ";
    if echo "clear; figlet 'Termux';" >> ~/.zshrc; then {
        source ~/.zshrc; printf "Done\n";
    }; else {
        echo "Failed to fixing zshrc"
    }; fi;

    # deleting update script
    printf "Deleting Files    : ";
    if rm -rv ~/.scripts/update.bash >> $log;  then printf "Done\n"; fi;

  }; elif [[ $update == 'n' ]]; then {
      echo "You can update it manually letter"
      echo "bye bye"
  }; else {
    printf "Invalid Options\n";
  }; fi

  echo
  echo "Thank You"
  echo "Latest Version $engine_version";

}
function UpdateChangeLog() {

  # mension here
  # what new you brings for echominal 

  printf "\nHurrah\nNew update has been arrival $yellow\n"
  printf "============================$red\n"
  printf "      EchoMinal 1.0.9 $yellow\n"
  printf "       Testing Update $yellow\n"
  printf "============================\n$red"
  printf "*. Install script has been updated\n"
  printf "*. removed 'update zsh'\n"
  printf "*. removed 'uninstall zsh'\n"
  printf "*. fixed exit issue (working)\n"
  printf "*. fixed ping request\n"
  printf "$stop\n"
}

function copy() {
  spin & # calling function
  pid=$! # unknown

  for i in `seq 1 10`
  do
    sleep 0.5
  done

  kill $pid
  echo
}
function spin() {
  while [ 1 ]
  do
    for i in "${pWait[@]}"
    do
        echo -ne "\r$i"
        sleep 0.2
    done
  done
}

pWait=('Please Wait' 'pLease Wait' 'plEase Wait' 'pleAse Wait' 'pleaSe Wait' 'pleasE Wait' 'please Wait' 'please wAit' 'please waIt' 'please waiT')

if UpdateChangeLog; then {
    UpdateEchominal; 
}; fi;