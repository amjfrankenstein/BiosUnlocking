#!/bin/bash
googspeak "reading chip type" 2>/dev/null 
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
if [ -s ls/unl/chip2.out ]; then
    chip=$(cat ls/unl/chip2.out)
else
	googspeak "chip not visible" 2>/dev/null &
    zenity --height=100 --width=300 --timeout=3 --error --text="Failed to read chip"
    kill $$
fi

googspeak "reading chip first pass" 2>/dev/null &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r ls/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining

googspeak "reading chip second pass" 2>/dev/null &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r ls/unl/fullread2.bin | zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=300 --auto-close --auto-kill --pulsate --time-remaining

zenity --height=100 --width=300 --timeout=2 --info --text="comparing files" &
googspeak "comparing files" 2>/dev/null 
difference=$(diff ls/unl/fullread1.bin ls/unl/fullread2.bin)

if [ -z "$difference" ]
then
    googspeak "files match" 2>/dev/null &
    zenity --height=100 --width=300 --info --text="Files Match."
else
    googspeak "files differ" 2>/dev/null &
    zenity --height=100 --width=300 --warning --text="Files do not Match."
fi
