#!/bin/bash

set import zip

# the zip archiver for termux 
# approved - applyed - deployed 

function input() {
    read -p "`whoami`@linux ~ > " input
}

function zipc() {
    echo "[1] Archive Zip"
    echo "[2] Extract Zip"
    input
    if [[ $input == 1 ]];
        then {
            read -p "enter file name ~ " FileNameZip
            zip -r $FileNameZip * 
        }
    elif [[ $input == 2 ]];
        then {
            read -p "enter file name ~ " fileName_ofZip
            unzip $fileName_ofZip
        }
    else {
        echo "invalid options";
    }; fi;
}

zipc

# script version ~ 0.2 
# by Farhan Sadik
