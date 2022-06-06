#!/bin/bash
unset filename chip 2>/dev/null
rm fu/unl/*.out 2>/dev/null
./fu/getchip.sh
./fu/editchip1.sh
./fu/editchip2.sh
if [ -s fu/unl/chip2.out ]; then
    chip=$(cat fu/unl/chip2.out)
else
    zenity --height=200 --width=350 --timeout=3 --error --text="Failed to read chip"
    kill $$
fi
rm fu/unl/fullread* 2>/dev/null
echo "::::::::::::FIRST:::READ:::::::::::::::"
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r fu/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining
echo ":::::::::::SECOND::::READ::::::::::::::"
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r fu/unl/fullread2.bin | zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=350 --auto-close --auto-kill --pulsate --time-remaining
echo "::::::::::::::COMPARING::::::::::::::::"
difference=$(diff fu/unl/fullread1.bin fu/unl/fullread2.bin)
if [ -z "$difference" ]
then
    zenity --height=200 --width=350 --timeout=5 --info --text="Files Match."
else
    zenity --height=200 --width=350 --timeout=5 --warning --text="Files do not Match."
fi

