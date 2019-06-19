#!/bin/bash

set import genisoimage
set import p7zip

# the zip archiver for termux 
# approved - applyed - deployed 

function input() {
    read -p "`whoami`@linux ~ > " input
}

function isoc() {
    echo "[1] Archive ISO"; echo "[2] Extract ISO" && input;
    if [[ $input == 1 ]];
        then {
            read -p "enter file name ~ " FileNameISO
            genisoimage -o $FileNameISO -R -J *
        }
    elif [[ $input == 2 ]];
        then {
            read -p "enter file name ~ " fileName_ofISO
            7z x -y $fileName_ofISO
        }
    else {
        echo "invalid options";
    }; fi;
}

isoc

# script version ~ 0.2 
# by Farhan Sadik
