#!/bin/bash
#!/system/bin/bash
#!/data/data/com.termux/files/usr/bin/bash

set import zip from busybox
set import unzip from busybox
set import figlet

function input() {
    shell_style=~/.config/echominal/shell_style.cfg;
    read -p "`cat $shell_style`" input;
}

main() {
    echo && figlet "ZipC" && echo;
    printf "[1] Archive Zip\n[2] Extract Zip\n[*] Quit\n";
    echo && input;
    if [[ $input == 1 ]]; then {
            read -p "enter file name ~ " FileNameZip; zip -r $FileNameZip *;
        }; elif [[ $input == 2 ]]; then {
            read -p "enter file name ~ " fileName_ofZip; unzip $fileName_ofZip;
        }; elif [[ $input == * ]]; then {
            echo "Bye, Bye!" && exit 1;
        }; else {
            echo "invalid options";
    }; fi;
}

main

# ZipC
# Script Version ~ 0.5
# By Farhan Sadik
# Square Development Group
