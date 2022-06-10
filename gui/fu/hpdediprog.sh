#!/bin/bash

fu/dpfullread.sh

echo ::::::::::::::PATCHING::BIN:::::::::::::::::

BOX86_NOBANNER=1 wine 'autopatcher/HPUnlocker.exe' fu/unl/fullread1.bin | zenity --progress --title="Unlocking Bin..." --text="Patching Bin File..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_unlocked.bin" ]; then
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat fu/unl/chip.out)
dpcmd --type $chip -u fu/unl/fullread1_unlocked.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

	zenity --height=100 --width=300 --info --text="<big>Unlock is complete!</big>" --no-wrap
else 
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
    kill $$
fi




