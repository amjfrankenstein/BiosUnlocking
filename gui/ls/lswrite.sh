#!/bin/bash
googspeak "reading chip type" 2>/dev/null 
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)
googspeak "select file to write" 2>/dev/null &
write=$(zenity --file-selection --width=350 --title="Choose File")
if [ -z "$write" ]
then
    kill $$
else
	googspeak "writing bin file to chip" 2>/dev/null & 
    flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w "$write" | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	googspeak "success" 2>/dev/null & 
    zenity --height=100 --width=300 --info --text="Success!"
fi

