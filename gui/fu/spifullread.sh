#!/bin/bash
googspeak "reading chip type" 2>/dev/null
./fu/getchip.sh
./fu/editchip1.sh
./fu/editchip2.sh
if [ -s fu/unl/chip2.out ]; then
    chip=$(cat fu/unl/chip2.out)
else
	googspeak "failed to read chip" 2>/dev/null &
    zenity --height=200 --width=350 --error --text="Failed to read chip"
    kill $$
fi
googspeak "reading chip first pass" 2>/dev/null &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r fu/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining
googspeak "reading chip second pass" 2>/dev/null &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r fu/unl/fullread2.bin | zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=350 --auto-close --auto-kill --pulsate --time-remaining
difference=$(diff fu/unl/fullread1.bin fu/unl/fullread2.bin)
if [ -z "$difference" ]
then
	googspeak "files match" 2>/dev/null &    
	zenity --height=200 --width=350 --timeout=2 --info --text="Files Match."
else
	googspeak "files do not match" 2>/dev/null &
    zenity --height=200 --width=350 --warning --text="Files do not Match."
	kill $$
fi

