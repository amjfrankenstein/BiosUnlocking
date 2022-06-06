import subprocess
import os
from guizero import App, PushButton

def dediprog():
    process = subprocess.Popen("fu/lenovodediprog.sh")

def spi():
    process = subprocess.Popen("fu/lenovospi.sh")

def close_window():
    app.destroy()

app = App(width=400, height=300, bg="#fff666", title="Full Unlocks")
button1 = PushButton(app, width="15", command=dediprog, text="Use Dediprog")
button2 = PushButton(app, width="15", command=spi, text="Use SPI:0")
button3 = PushButton(app, width="15", command=close_window, text="Close")
button1.bg = "#4ab33d"
button2.bg = "white"
button3.bg = "red"
app.icon = "media/altaicon2.gif"

app.display()
