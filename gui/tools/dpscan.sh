#!/bin/bash
dpcmd -d 2>&1 | tee dp/unl/out.out
tail -n3 dp/unl/out.out | head -n1 > dp/unl/out1.out
rm dp/unl/out.out
cat dp/unl/out1.out | head -n1 | awk '{print $1;}' > dp/unl/chip.out
rm dp/unl/out1.out
chip=$(cat dp/unl/chip.out)
zenity --height=100 --width=300 --title="Chip Type is:" --info --text=$chip 
