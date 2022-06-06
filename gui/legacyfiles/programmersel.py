import subprocess
import os
from guizero import *
from tkinter import *

def dpmenu():
    process = subprocess.Popen("dp/dpmenu.sh")

def fullunlock():
    process = subprocess.Popen("fu/fullunlock.sh")

def lsmenu():
    process = subprocess.Popen("ls/lsmenu.sh")

def close_window():
    app.destroy()
    
app = App(width=400, height=300, bg="#7a7a7a", title="Programmer Selection")
open_button1 = PushButton(app, width="15", command=dpmenu, text="Dediprog")
open_button2 = PushButton(app, width="15", command=fullunlock, text="Full Unlock")
open_button3 = PushButton(app, width="15", command=lsmenu, text="LinuxSPI(rpi etc)")
button1 = PushButton(app, width="15", command=close_window, text="Close")
open_button1.bg = "#4ab33d"
open_button2.bg = "white"
open_button3.bg = "#4ab33d"
button1.bg = "red"
app.icon = "media/altaicon2.gif"
app.display()
