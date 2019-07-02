# Project EchoMinal
**This script a simple manager for termux. User can use is in a short way. This script is very helpfull for beginners.
Termux is an Android terminal emulator and Linux environment app that works directly with no rooting or setup required. A minimal base system is installed automatically - additional packages are available using the APT package manager.**

**Secure** Access remote servers using the ssh client from OpenSSH. Termux combines standard packages with accurate terminal emulation in a beautiful open source solution.

**Feature packed** Take your pick between Bash, fish or Zsh and nano, Emacs or Vim. Grep through your SMS inbox. Access API endpoints with curl and use rsync to store backups of your contact list on a remote server.

**Customizable** Install what you want through the APT package management system known from Debian and Ubuntu GNU/Linux. Why not start with installing Git and syncing your dotfiles?

**Explorable** Have you ever sat on a bus and wondered exactly which arguments tar accepts? Packages available in Termux are the same as those on Mac and Linux - install man pages on your phone and read them in one session while experimenting with them in another.

**With batteries included** Can you imagine a more powerful yet elegant pocket calculator than a readline-powered Python console? Up-to-date versions of Perl, Python, Ruby and Node.js are all available.

**Ready to scale up** Connect a Bluetooth keyboard and hook up your device to an external display if you need to - Termux supports keyboard shortcuts and has full mouse support.

**Tinkerable** Develop by compiling C files with Clang and build your own projects with CMake and pkg-config. Both GDB and strace are available if you get stuck and need to debug.

## Features
  * Simple to use
  * Fast and beautiful design
  * ... and more

## Language Used
  * Bash Scripting

## CCLi Command List 

1. install ~ to install a package <br>
    example ~ `install <package-name>`

2. remove ~ to remove/install a package <br>
    example ~ `remove <package-name>`

3. sync ~ to update/sync distro repository <br>
    example ~ type `sync` and hit enter

4. upgrade ~ to upgrade all of package <br>
    example ~ type `upgrade` and hit enter

5. help ~ for get help <br>
    example ~ type `help` and hit enter

## Requirements
  * Termux [download](https://play.google.com/store/apps/details?id=com.termux&hl=en)
  * Termux-Api [download](https://play.google.com/store/apps/details?id=com.termux.api&hl=en)
  * Android Root Access

### Installation Method
> Beginnergs Method

just copy and paste those commands, one by one
```
pkg install git 
git clone https://github.com/farhansadik/EchoMinal.git
cd EchoMinal
./install
```
after install **please restart termux app**. To run echominal type: 
```
engine
```

> Advance Method

1. Update packages to latest version
	- Install git using `pkg install git` command.
2. Download the repository files (project) from the download section or clone this project by typing in the bash the following command: `git clone https://github.com/farhansadik/EchoMinal.git`
3. Then Redirect to `EchoMinal` folder using `cd EchoMinal`.
4. Enter `ls` command, for check all of files directory. The output looks like ~
  ```
  farhansadik@linux ~ > ls
  ChangeLog  extras.zip  install  LICENSE  README.md
  ```
5. Setup permission to installer `chmod +x install` and hit enter.
6. Then run the installer sctipt `./install`. Remember that, the installer would take few more minutes and it would take about 50 megabytes of internet. This installer will needed 100 megabyte free storage on system. `(PhoneMemory / sdcard)`
7. After install all of packages, close termux app and run it again..
8. Hope, everything works fine. If you face any problem please mail me at `farhansadikriduan@gmail.com` or create a issue on my repo. I'll try my best to fix those issue.
*. Thank's a lot.

# Screenshots
## EchoMinal Engine
![EchoMinal Engine](/image/echominal_engine.png?raw=true "Engine")
## Echominal About
![EchoMinal About](/image/echominal_about.png?raw=true "About")
## EchoMinal PC Engine
![EchoMinal Engine PC](/image/echominal_pc.png?raw=true "pc")
## Echominal Installer
![EchoMinal Engine PC](/image/echominal_installer.png?raw=true "installer")
## Showing Packages While Installing Echominal
![EchoMinal Engine PC](/image/echominal_showing_packages.png?raw=true "packages")

# Contributing
If you want to contribute to this project and make it better with new ideas, your pull request is very welcomed. If you find any issue just put it in the repository issue section, thank you.

**Development By** <br>
_**Farhan Sadik**_ <br>
**Square Development Group**
