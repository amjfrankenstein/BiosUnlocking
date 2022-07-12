#!/bin/bash
googspeak "clear saved data?" 2>/dev/null &
zenity --question --width=300
case $? in
	0)rm -r dp/unl/* 2>/dev/null
	  rm -r ls/unl/* 2>/dev/null
	  rm -r fu/unl/* 2>/dev/null
	  rm -r tools/unl/* 2>/dev/null
	  googspeak "data reset" 2>/dev/null &
 	  zenity --height=200 --width=350 --title="Delete" --info --text="All Created Files Deleted" 
	;;
	1) $1
	;;
	*) $1
	;;
esac

