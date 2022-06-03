#!/bin/bash
unset filename chip 2>/dev/null
rm ls/unl/*.out 2>/dev/null
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
if [ -s ls/unl/chip2.out ]; then
    chip=$(cat ls/unl/chip2.out)
else
    zenity --height=200 --width=350 --timeout=3 --error --text="Failed to read chip"
    kill $$
fi
filename=$(yad --entry --center)
if [ -z "$filename" ]
then
    kill $$
else
#    flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r 'ls/unl/'$filename 2>/dev/null
    flashrom -p dediprog:spispeed=24M -c $chip  -r 'ls/unl/'$filename 
fi
zenity --height=150 --width=300 --timeout=4 --info --text=$filename' Saved.'
kill $$

