#/bin/bash
#Checks if the removed.log file exists

if test -f ~/.logremove/remove.log; then
	sleep 0
else
	mkdir ~/.logremove
	touch ~/.logremove/remove.log
fi

silent=false

#Checks for if a person enters no arguments, and lets them know what it does.
if [ $# -eq 0 ]; then
	echo "Use -h for help." >&2
	exit 1
fi

#The help command
if [ $1 == "-h" ]; then
	echo "Usage: Removes files and logs them. use -s before file name to not show name when removing."
	exit 1
fi

#Logs the file or directory that is deleted unless if -s is appendedi
if [ $1 == "-s" ]; then
	echo "$(date) | $USER | $2" >> ~/.logremove/remove.log
	silent=true
	shift
else
	echo "$(date) | $USER | $1" >> ~/.logremove/remove.log
fi
#Removes the file or directory chosen
if [ silent == "true" ]; then
	/usr/bin/rm "$2"
else
	/usr/bin/rm "$1"
	echo "$(date) | $USER | $1"
fi
