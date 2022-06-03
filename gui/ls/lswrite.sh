#!/bin/bash
unset chip 2>/dev/null
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)


cd ls/unl/

yad --height=250 --width=450 --form --title="Choose File" --field=File:FL --center > write.out
write=$(cat write.out | sed 's/.$//') > write2.out
if [ -z "$write" ]
then
    kill $$
else
    (flashrom -p dediprog:spispeed=24M -c $chip -w $write | tee test.out) | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
fi
if grep -q Error  test.out; then
     zenity --height=200 --width=350 --timeout=3 --error --text="Failed writing."
else
     zenity --height=200 --width=350 --timeout=3 --info --text="Sucess!"     
fi
cd -
kill $$
