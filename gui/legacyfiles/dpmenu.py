import subprocess
import os
from guizero import App, PushButton

def dpscan():
    process = subprocess.Popen("dp/dpscan.sh")

def dpread():
    process = subprocess.Popen("dp/dpreadmenu.sh")

def dpwipe():
    process = subprocess.Popen("dp/dpwipe.sh")

def dpwrite():
    process = subprocess.Popen("dp/dpwrite.sh")

def close_window():
    app.destroy()

app = App(width=400, height=300, bg="#c7c7c7", title="Dediprog")
#app.eval('tk::PlaceWindow %s center' % app(app()))
button1 = PushButton(app, width="15", command=dpscan, text="Scan Chips")
button2 = PushButton(app, width="15", command=dpread, text="Read Chips")
button3 = PushButton(app, width="15", command=dpwipe, text="Wipe Chips")
button4 = PushButton(app, width="15", command=dpwrite, text="Write Chips")
button5 = PushButton(app, width="15", command=close_window, text="Close")
button1.bg = "#4ab33d"
button2.bg = "white"
button3.bg = "#4ab33d"
button4.bg = "white"
button5.bg = "red"
app.icon = "media/altaicon2.gif"
app.display()
