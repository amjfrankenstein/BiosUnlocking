#!/bin/bash
rm -r fu/unl/*
fu/fufullread.sh
autopatcher/autopatch fu/unl/fullread1.bin | zenity --progress --title="Unlocking Chip..." --text="Patching Chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_PATCHED.bin" ]; then
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
else 
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patch Failed"; kill $$ 2>/dev/null
fi

chip=$(cat fu/unl/chip.out)

dpcmd --type $chip -u fu/unl/fullread1_PATCHED.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
#textul=$(cat fu/textul.txt)
zenity --height=200 --width=350 --info --text="<big>Unlock is loaded. Press OK when ready for phase 2.</big>" --no-wrap

dpcmd --type $chip -u fu/unl/fullread1.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing original bin to chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

zenity --height=200 --width=350 --info --text="<big>Unlock is complete!</big>" --no-wrap
