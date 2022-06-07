#!/bin/bash
unset chip
rm dp/unl/*.out 2>/dev/null
(dpcmd -d 2>&1 | tee dp/unl/out.out) 2>/dev/null
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
echo "::::::::::::FIRST:::READ:::::::::::::::"
dpcmd --type $chip -r dp/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
echo ":::::::::::SECOND::::READ::::::::::::::"
dpcmd --type $chip -r dp/unl/fullread2.bin| zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
echo "::::::::::::::COMPARING::::::::::::::::"
difference=$(diff dp/unl/fullread1.bin dp/unl/fullread2.bin)
if [ -z "$difference" ]
then
    zenity --height=200 --width=350 --timeout=3 --info --text="Files Match."
else
    zenity --height=200 --width=350 --timeout=3 --warning --text="Files do not Match."
fi
unset chip
kill $$
