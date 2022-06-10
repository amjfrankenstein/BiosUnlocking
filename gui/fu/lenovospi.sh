#!/bin/bash

fu/spifullread.sh

echo :::::::::::::PATCHING::BIN:::::::::::::::::

autopatcher/autopatch fu/unl/fullread1.bin | zenity --progress --title="Unlocking bin..." --text="Patching bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "fu/unl/fullread1_PATCHED.bin" ]; then
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat fu/unl/chip2.out)
	flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w fu/unl/fullread1_PATCHED.bin | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	zenity --height=100 --width=300 --info --text="Press OK after in system portion" --no-wrap
	flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w fu/unl/fullread1.bin | zenity --progress --title="Flashing Chip..." --text="Writing original bin to chip..." --width=400 --auto-close --auto-kill --pulsate --time-remaining
    zenity --height=100 --width=300 --info --text="Success!"
else 
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
    kill $$
fi







