#!/bin/bash
unset filename 
unset chip
rm dp/unl/*.out 2>/dev/null
dpcmd -d 2>&1 | tee dp/unl/out.out
tail -n3 dp/unl/out.out | head -n1 > dp/unl/out1.out
rm dp/unl/out.out
cat dp/unl/out1.out | head -n1 | awk '{print $1;}' > dp/unl/chip.out
rm dp/unl/out1.out
if grep -q Error "dp/unl/chip.out"; then
    zenity --height=200 --width=350 --timeout=3 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat dp/unl/chip.out)
fi
filename=$(yad --entry --center)
if [ -z "$filename" ]
then
    kill $$
else
    dpcmd --type $chip -r 'dp/unl/'$filename
fi
yad --height=250 --width=450 --timeout=4 --info --text=$filename' Saved.'
kill $$

