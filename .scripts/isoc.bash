#!/bin/bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

set import genisoimage
set import p7zip
set import figlet

function input() {
    shell_style=~/.config/echominal/shell_style.cfg;
    read -p "`cat $shell_style`" input;
}

main() {
    echo && figlet "ISOc" #&& echo;
    printf "[1] Archive ISO\n[2] Extract ISO\n[*] Quit\n"; echo && input;
    if [[ $input == 1 ]]; then {
            read -p "enter file name ~ " FileNameISO
            genisoimage -o $FileNameISO.iso -R -J *
        }; elif [[ $input == 2 ]]; then {
            read -p "enter file name ~ " fileName_ofISO
            7z x -y $fileName_ofISO
        }; elif [[ $input == * ]]; then {
            echo "Bye, Bye!" && exit 1;
        }; else {
            echo "invalid options";
    }; fi;
}

main

#ISOc
# Script Version ~ 0.5
# By Farhan Sadik
# Square Development Group
