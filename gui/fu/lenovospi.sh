#!/bin/bash

fu/spifullread.sh
googspeak "patching bin file for unlock" 2>/dev/null &
autopatcher/autopatch fu/unl/fullread1.bin | zenity --progress --title="Unlocking bin..." --text="Patching bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_PATCHED.bin" ]; then
	googspeak "file patch succeeded" 2>/dev/null &
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat fu/unl/chip2.out)
	googspeak "writing unlock to chip" 2>/dev/null &
	flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w fu/unl/fullread1_PATCHED.bin | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	googspeak "complete in system portion then click OK" 2>/dev/null &
	zenity --height=100 --width=300 --info --text="Press OK after in system portion" --no-wrap
	googspeak "restoring original bi-aws" 2>/dev/null &
	flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w fu/unl/fullread1.bin | zenity --progress --title="Flashing Chip..." --text="Writing original bin to chip..." --width=400 --auto-close --auto-kill --pulsate --time-remaining
	googspeak "success" 2>/dev/null &
    zenity --height=100 --width=300 --info --text="Success!"
else 
	googspeak "file patch failed" 2>/dev/null &
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
    kill $$
fi







