#!/bin/bash
rm -r dp/unl/* 2>/dev/null
rm -r ls/unl/* 2>/dev/null
rm -r fu/unl/* 2>/dev/null
zenity --height=200 --width=350 --title="Delete" --info --text="All Created Files Deleted" 
