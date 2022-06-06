#!/bin/bash
cd dp/unl
rm *.out 2>/dev/null
yad --width=450 --height=250 --form --title="Choose first file" --field=First:FL --center > first.out
yad --width=450 --height=250 --form --title="Choose second file" --field=Second:FL --center > second.out
comfile1=$(cat first.out | sed 's/.$//')
comfile2=$(cat second.out | sed 's/.$//')
difference=$(diff $comfile1 $comfile2)
if [ -z "$difference" ]
then
    zenity --width=350 --height=200 --timeout=5 --info --text="Files Match."
else
    zenity --width=350 --height=200 --timeout=5 --warning --text="Files do not Match."
fi
kill $$