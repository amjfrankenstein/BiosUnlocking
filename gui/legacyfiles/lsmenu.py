import subprocess
import os
from guizero import App, PushButton

def lsscan():
    process = subprocess.Popen("ls/lsscan.sh")

def lsread():
    process = subprocess.Popen("ls/lsreadmenu.sh")

def lswipe():
    process = subprocess.Popen("ls/lswipe.sh")

def lswrite():
    process = subprocess.Popen("ls/lswrite.sh")

def close_window():
    app.destroy()

app = App(width=400, height=300, bg="#7b7ed1", title="LinuxSPI")
#app.eval('tk::PlaceWindow %s center' % app(app()))
button1 = PushButton(app, width="15", command=lsscan, text="Scan Chips")
button2 = PushButton(app, width="15", command=lsread, text="Read Chips")
button3 = PushButton(app, width="15", command=lswipe, text="Wipe Chips")
button4 = PushButton(app, width="15", command=lswrite, text="Write Chips")
button5 = PushButton(app, width="15", command=close_window, text="Close")
button1.bg = "#4ab33d"
button2.bg = "white"
button3.bg = "#4ab33d"
button4.bg = "white"
button5.bg = "red"
app.icon = "media/altaicon2.gif"
app.display()
