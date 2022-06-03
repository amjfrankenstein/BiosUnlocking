#!/bin/bash
(dpcmd -d 2>&1 | tee fu/unl/out.out) 2>/dev/null
tail -n3 fu/unl/out.out | head -n1 > fu/unl/out1.out
rm fu/unl/out.out
cat fu/unl/out1.out | head -n1 | awk '{print $1;}' > fu/unl/chip.out
rm fu/unl/out1.out
if grep -q Error "fu/unl/chip.out"; then
    zenity --height=200 --width=350 --timeout=3 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat fu/unl/chip.out)
fi
echo "::::::::::::FIRST:::READ:::::::::::::::"
dpcmd --type $chip -r fu/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
echo ":::::::::::SECOND::::READ::::::::::::::"
dpcmd --type $chip -r fu/unl/fullread2.bin| zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
echo "::::::::::::::COMPARING::::::::::::::::"
difference=$(diff fu/unl/fullread1.bin fu/unl/fullread2.bin)
if [ -z "$difference" ]
then
    zenity --height=200 --width=350 --timeout=5 --info --text="Files Match."
else
    zenity --height=200 --width=350 --timeout=5 --warning --text="Files do not Match."
fi
unset chip
kill $$
