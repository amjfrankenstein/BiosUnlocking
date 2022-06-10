#!/bin/bash

dpcmd -d 2>&1 | tee dp/unl/out.out

tail -n3 dp/unl/out.out | head -n1 > dp/unl/out1.out

rm dp/unl/out.out

cat dp/unl/out1.out | head -n1 | awk '{print $1;}' > dp/unl/chip.out

rm dp/unl/out1.out

if grep -q Error "dp/unl/chip.out"; then
    zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat dp/unl/chip.out)
fi

yad --height=100 --width=300 --form --title="Choose File" --field=File:FL --center > dp/unl/write.out

write=$(cat dp/unl/write.out | sed 's/|//') 

(dpcmd --type $chip -u $write -v | tee dp/unl/test.out) | zenity --progress --title="Flashing Chip..." --text="Writing to $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if grep -q Error dp/unl/test.out; then
     zenity --height=100 --width=300 --error --text="Failed writing."
else
     zenity --height=100 --width=300 --info --text="Sucess!"     
fi

