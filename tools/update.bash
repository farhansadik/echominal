#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/bash

script_version="0.3.03"    # prev - 0.1.02

# log
def_loc=~/.config/echominal;                      # default clone location
log=~/.config/echominal/log/operation_status.log; # for track logs
red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; stop='\e[0m';

###################################################
#   PLEASE SPECIFY HERE MANUALLY EVERYTHING       #
#   WHAT UPDATE U BRINGS HERE                     #
#   EVERY TIME YOU'VE TO EDIT THAT SHIT           #
###################################################


function ChangeLog() {

  # mension here
  # what new you brings for echominal 

  printf "\nNew update has been arrived $yellow\n"
  printf "============================$red\n"
  printf "      EchoMinal 2.0  $yellow\n"
  printf "       Testing Update $yellow\n"
  printf "============================\n$red"
  printf "*. Little fix on engine\n"
  printf "*. update delete fix\n"
  printf "*. fixed exit issue$yellow (working)$stop\n"
  #printf "*. \n"
  #printf "*. \n"


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

pWait=('Please Wait' 'pLease Wait' 'plEase Wait' 'pleAse Wait' 'pleaSe Wait' 'pleasE Wait' 'please Wait' 'please wAit' 'please waIt' 'please waiT')

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

function UpdateEchominal() {

  # getting user permission
  read -p "do u want to update [y/n] " update

  # condition
  if [[ $update == 'y' ]]; then {

    # Simple Animation 
    copy

    engine_loc=/data/data/com.termux/files/home/.config/echominal/echominal;
    bin_file=/data/data/com.termux/files/usr/bin;

    # replaceing engine
    printf "Replacing Engine  : ";
    if cp -rfv $engine_loc $bin_file >> $log; then printf "Done\n"; fi;

    #########################################################
    # must delete update.bash file [everytime]              #
    #########################################################

    # deleting update script
    printf "Deleting Files    : ";
    if rm -rfv $def_loc/tools/update.bash >> $log;  then printf "Done\n"; fi;

  } elif [[ $update == 'n' ]]; then {
      echo "You can update it manually letter"
      echo "bye bye"
  } else {
    printf "Invalid Options\n";
  } fi

  echo
  echo "Thank You"
  echo "Latest Version $engine_version";

}

if ChangeLog; then UpdateEchominal; fi;
