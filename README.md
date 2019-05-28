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
  * We used material design & UX library to build this application
  * We used MVC design pattern
  * Password hashed
  * ... and more

## Language Used
  * Bash Scripting

## Terminal resources
* [XTerm control sequences](http://invisible-island.net/xterm/ctlseqs/ctlseqs.html)
* [vt100.net](http://vt100.net/)
* [Terminal codes (ANSI and terminfo equivalents)](http://wiki.bash-hackers.org/scripting/terminalcodes)

## Terminal emulators
* VTE (libvte): Terminal emulator widget for GTK+, mainly used in gnome-terminal. [Source](https://github.com/GNOME/vte), [Open Issues](https://bugzilla.gnome.org/buglist.cgi?quicksearch=product%3A%22vte%22+), and [All (including closed) issues](https://bugzilla.gnome.org/buglist.cgi?bug_status=RESOLVED&bug_status=VERIFIED&chfield=resolution&chfieldfrom=-2000d&chfieldvalue=FIXED&product=vte&resolution=FIXED).
* iTerm 2: OS X terminal application. [Source](https://github.com/gnachman/iTerm2), [Issues](https://gitlab.com/gnachman/iterm2/issues) and [Documentation](http://www.iterm2.com/documentation.html) (which includes [iTerm2 proprietary escape codes](http://www.iterm2.com/documentation-escape-codes.html)).
* Konsole: KDE terminal application. [Source](https://projects.kde.org/projects/kde/applications/konsole/repository), in particular [tests](https://projects.kde.org/projects/kde/applications/konsole/repository/revisions/master/show/tests), [Bugs](https://bugs.kde.org/buglist.cgi?bug_severity=critical&bug_severity=grave&bug_severity=major&bug_severity=crash&bug_severity=normal&bug_severity=minor&bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&product=konsole) and [Wishes](https://bugs.kde.org/buglist.cgi?bug_severity=wishlist&bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&product=konsole).
* hterm: JavaScript terminal implementation from Chromium. [Source](https://github.com/chromium/hterm), including [tests](https://github.com/chromium/hterm/blob/master/js/hterm_vt_tests.js), and [Google group](https://groups.google.com/a/chromium.org/forum/#!forum/chromium-hterm).
* xterm: The grandfather of terminal emulators. [Source](http://invisible-island.net/datafiles/release/xterm.tar.gz).
* Connectbot: Android SSH client. [Source](https://github.com/connectbot/connectbot)
* Android Terminal Emulator: Android terminal app which Termux terminal handling is based on. Inactive. [Source](https://github.com/jackpal/Android-Terminal-Emulator).

## Requirements
  * Termux [download](https://play.google.com/store/apps/details?id=com.termux&hl=en)
  * Termux-Api [download](https://play.google.com/store/apps/details?id=com.termux.api&hl=en)
  * Android Root Access

### Installation Method
> Beginnergs Method

just copy and paste those commands, one by one
```
pkg install git 
https://github.com/farhansadik/EchoMinal.git
cd EchoMinal
./install
```
to run echominal type: 
```
engine
```

> Step 2 - Advance Method

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
