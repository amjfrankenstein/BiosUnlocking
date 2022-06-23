#!/bin/bash
zenity --question --width=300
case $? in
	0)rm -r saved/* 2>/dev/null
	  zenity --height=200 --width=350 --title="Delete" --info --text="All Created Files Deleted" 
	;;
	1) $1
	;;
	*) $1
	;;
esac
