#! /bin/bash

lenfile=$(zenity --file-selection)
case $? in
	0) python "$(dirname "$(realpath $0)")/autopatcher/patch/autopatch.py" "$lenfile" 2>&1 autopatcher/unl/patch.out | zenity --progress --title="Unlocking bin File..." --text="Patching Bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
       if grep -q error "autopatcher/unl/patch.out"; then
		  zenity --height=100 --width=300 --info --text="<big>Bin Patching Failed</big>" --no-wrap
	   else
		  zenity --height=100 --width=300 --timeout=2 --info --text="<big>Bin Patching is Complete!</big>" --no-wrap
		  s=$lenfile
          lennewfile=$(echo "${s%????}_PATCHED${s: -4}")
          mv $hpnewfile saved/
          zenity --height=200 --width=350 --info --text="File Saved to ~/BiosUnlocking/gui/saved/"
	   fi
	;;
	1) kill $$
	;;
	*) $1
	;;
esac









