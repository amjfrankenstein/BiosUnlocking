#!/bin/bash

fu/spifullread.sh
googspeak "patching bin file" 2>/dev/null &
BOX86_NOBANNER=1 wine ./autopatcher/HPUnlocker.exe fu/unl/fullread1.bin 2>/dev/null | zenity --progress --title="Unlocking file..." --text="Patching bin file..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -z fu/unl/fullunlock1_unlocked.bin ]; then
	googspeak "patching failed" 2>/dev/null &
    zenity --height=200 --width=350 --info --text="Bin File Failed to patch.."
	kill $$
else 
	googspeak "patching succeeded" 2>/dev/null &
    zenity --height=200 --width=350 --timeout=2 --info --text="Bin File Patch Succeded"
fi

chip=$(cat fu/unl/chip2.out)
googspeak "writing unlockd bin to chip" 2>/dev/null &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w fu/unl/fullread1_unlocked.bin -VVV | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
googspeak "unlocking complete" 2>/dev/null &
zenity --height=200 --width=350 --info --text="<big>Unlock is complete!</big>" --no-wrap
