#!/bin/bash
googspeak "empty saved folder?" 2>/dev/null &
zenity --question --width=300
case $? in
	0)rm -r saved/* 2>/dev/null
	  googspeak "cleared" 2>/dev/null &
	  zenity --height=200 --width=350 --title="Delete" --info --text="All Created Files Deleted" 
	;;
	1) $1
	;;
	*) $1
	;;
esac
