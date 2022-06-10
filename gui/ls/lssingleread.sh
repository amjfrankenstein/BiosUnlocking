#!/bin/bash

./ls/getchip.sh

./ls/editchip1.sh

./ls/editchip2.sh

if [ -s ls/unl/chip2.out ]; then
    chip=$(cat ls/unl/chip2.out)
else
    zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
fi

filename=$(yad --entry --center)

if [ -z "$filename" ]
then
    kill $$
else
    flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -r 'ls/unl/'$filename | zenity --progress --title="Reading Chip..." --text="Reading $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100 
	zenity --height=100 --width=300 --info --text=$filename' Saved.'
fi

