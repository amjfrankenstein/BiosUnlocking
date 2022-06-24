#!/bin/bash

./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)
write=$(zenity --file-selection --width=350 --title="Choose File")
#write=$(cat ls/unl/write.out | sed 's/.$//') > ls/unl/write2.out
if [ -z "$write" ]
then
    kill $$
else
    (flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w $write | tee test.out) | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
fi
if grep -q Error  test.out; then
     zenity --height=100 --width=300 --error --text="Failed writing."
else
     zenity --height=100 --width=300 --info --text="Sucess!"     
fi

