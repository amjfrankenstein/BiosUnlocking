#!/bin/bash
fu/dpfullread.sh
googspeak "unlocking bin file" 2>/dev/null &
BOX86_NOBANNER=1 wine 'autopatcher/HPUnlocker.exe' fu/unl/fullread1.bin 2>/dev/null | zenity --progress --title="Unlocking Bin..." --text="Patching Bin File..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_unlocked.bin" ]; then
	googspeak "bin file patched" 2>/dev/null &
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat fu/unl/chip.out)
	googspeak "writing patched file to chip" 2>/dev/null &
	dpcmd --type $chip -u fu/unl/fullread1_unlocked.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	googspeak "unlock complete" 2>/dev/null &
	zenity --height=100 --width=300 --info --text="<big>Unlock is complete!</big>" --no-wrap
else 
	googspeak "file patching failed" 2>/dev/null &
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
    kill $$
fi




