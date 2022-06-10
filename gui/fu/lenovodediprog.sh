#!/bin/bash

fu/fufullread.sh

autopatcher/autopatch fu/unl/fullread1.bin | zenity --progress --title="Unlocking bin File..." --text="Patching Bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_PATCHED.bin" ]; then
    zenity --height=100 --width=300 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat fu/unl/chip.out)
	dpcmd --type $chip -u fu/unl/fullread1_PATCHED.bin -v | zenity --progress --title="Patching Chip..." --text="Patching $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	zenity --height=100 --width=300 --info --text="<big>Unlock is loaded. Press OK when ready for phase two.</big>" --no-wrap

	dpcmd --type $chip -u fu/unl/fullread1.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing original bin to $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

	zenity --height=100 --width=300 --info --text="<big>Unlock is complete!</big>" --no-wrap
else 
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
	kill $$
fi


