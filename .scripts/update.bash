#!/bin/bash
#!/usr/bin/env bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.1.01"    # prev - 0.0.08
engine_version="1.0.8 Lua" # prev - 1.0.7 Marato

# log
loc=~/EchoMinal/; # default clone location
log=~/.log/update-status.log; # for track logs
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';

###################################################
#   PLEASE SPECIFY HERE MANUALLY EVERYTHING
#   WHAT UPDATE U BRINGS HERE
###################################################

function UpdateEchominal() {

  # EchoMinal Engine 1.0.8 Lua
  # Replacing File List = engine.bash .scripts/update.bash .config/ccli.cfg

  # getting user permission
  read -p "do u want to update [y/n] " update

  # condition
  if [[ $update == 'y' ]]; then {

      # just for fun
      copy

      # installing packages
      pkg install bat 

      # replace engine
      printf "Copying Files     : ";
      if cd $loc && cp -rv .engine.bash $HOME >> $log; then printf "Done\n"; fi;

      # replace ccli-configuration
      if cd $loc && cp -rv .config/ccli/termux.cfg $HOME/.config/ccli >> $log; then printf "Done\n"; fi;

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
  printf "      EchoMinal 1.0.8 $yellow\n"
  printf "============================\n$red"
  printf "*. Logo Change while system update\n"
  printf "*. Added$blue 'bat'$red as installer\n"
  printf "*. Added new method of scripts manager on main menu\n"
  printf "*. Added$blue Weeman$red Script\n"
  printf "*. Spinner method installed on updating system\n"
  printf "*. Bug fixes of engine\n"
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
if UpdateChangeLog; then UpdateEchominal; fi;