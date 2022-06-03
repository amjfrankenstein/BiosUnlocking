#!/bin/bash
dpcmd -d 2>&1 | tee dp/out.out
tail -n3 dp/out.out | head -n1 > dp/out1.out
rm dp/out.out
cat dp/out1.out | head -n1 | awk '{print $1;}' > dp/chip.out
rm dp/out1.out
chip=$(cat dp/chip.out)
zenity --height=200 --width=350 --title="Chip Type is:" --info --text=$chip 
kill $$