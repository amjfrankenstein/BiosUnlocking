#!/bin/bash
rm -r fu/unl/* 2>/dev/null
fu/spifullread.sh
echo :::::::::::::::::::::::::PATCHING::BIN:::::::::::::::::::::::::::::


autopatcher/autopatch fu/unl/fullread1.bin | zenity --progress --title="Unlocking Chip..." --text="Patching Chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_PATCHED.bin" ]; then
    zenity --height=200 --width=350 --timeout=5 --info --text="Bin File Patched.."
else 
    zenity --height=200 --width=350 --timeout=5 --info --text="Bin File Patch Failed"
    kill $$
fi



chip=$(cat fu/unl/chip.out)
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w fullread1_PATCHED.bin | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100


