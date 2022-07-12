#!/bin/bash
googspeak "choose file 1" 2>/dev/null &
zenity --file-selection --width=350 --title="Choose first file" > first.out
case $? in
	0)googspeak "choose file 2" 2>/dev/null & zenity --file-selection --width=350 --title="Choose Second file" > first.out > second.out
		case $? in
			0) comfile1=$(cat first.out | sed 's/.$//')
			   comfile2=$(cat second.out | sed 's/.$//')
			   difference=$(diff $comfile1 $comfile2)
		 	   if [ -z "$difference" ]
			   then
					googspeak "files match" 2>/dev/null &    				
					zenity --width=350 --height=200 --timeout=5 --info --text="Files Match."
			   else
					googspeak "files do not match" 2>/dev/null &
    				zenity --width=350 --height=200 --timeout=5 --warning --text="Files do not Match."			
			   fi
			;;
			1) $1
			;;
			*) $1
			;;
		esac
	;;
	1) $1
	;;
	*) $1
	;;
esac
