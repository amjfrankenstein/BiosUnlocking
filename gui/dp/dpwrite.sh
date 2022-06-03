#!/bin/bash
unset chip
unset write
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
cd dp/unl/
yad --height=250 --width=450 --form --title="Choose File" --field=File:FL --center > write.out
write=$(cat write.out | sed 's/.$//') > write2.out
(dpcmd --type $chip -u $write -v | tee test.out) | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
if grep -q Error  test.out; then
     zenity --height=200 --width=350 --timeout=3 --error --text="Failed writing."
else
     zenity --height=200 --width=350 --timeout=3 --info --text="Sucess!"     
fi
cd -
kill $$
