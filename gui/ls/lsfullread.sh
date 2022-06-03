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
rm ls/unl/fullread* 
echo "::::::::::::FIRST:::READ:::::::::::::::"
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r ls/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
echo ":::::::::::SECOND::::READ::::::::::::::"
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r ls/unl/fullread2.bin | zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
echo "::::::::::::::COMPARING::::::::::::::::"
difference=$(diff ls/unl/fullread1.bin ls/unl/fullread2.bin)
if [ -z "$difference" ]
then
    zenity --height=200 --width=350 --timeout=5 --info --text="Files Match."
else
    zenity --height=200 --width=350 --timeout=5 --warning --text="Files do not Match."
fi
unset filename chip 2>/dev/null
rm ls/unl/*.out 2>/dev/null

