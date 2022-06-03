#!/bin/bash
rm -r fu/unl/* >/dev/null
fu/dpfullread.sh
echo :::::::::::::::::::::::::PATCHING::BIN:::::::::::::::::::::::::::::

cd fu/unl 2>/dev/null
BOX86_NOBANNER=1 wine '../../autopatcher/HPUnlocker.exe' fullread1.bin | zenity --progress --title="Unlocking Chip..." --text="Patching Chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fullread1_unlocked.bin" ]; then
    zenity --height=200 --width=350 --timeout=5 --info --text="Bin File Patched.."
else 
    zenity --height=200 --width=350 --timeout=5 --info --text="Bin File Patch Failed"
    kill $$
fi

cd ../.. 2>/dev/null

chip=$(cat fu/unl/chip.out)
dpcmd --type $chip -u fu/unl/fullread1_unlocked.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

zenity --height=200 --width=350 --timeout=3 --info --text="Sucess!" 
kill $$

