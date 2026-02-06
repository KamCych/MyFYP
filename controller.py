from machine import Pin
from picozero import Button, Pot
from time import sleep
import ujson as json

#jack = Pin(4, Pin.OUT)
button = Button(0)
jackPin = Pin(0, Pin.IN, Pin.PULL_DOWN)

compStatus = {
    "button": "inactive",
    "jack1": "inactive",
    "jack2": "inactive"
}

while True:
    #jack = Button(0)
    #rint(jackPin.value())
    #print(jack.value)
    #print(jack.is_active)

    if jackPin.value() == 0:
        print("Cable connected")
        compStatus["jack1"] = "active"
    else:
        print("Cable not connected")
        compStatus["jack1"] = "inactive"
        
    if button.is_pressed:
        compStatus["button"] = "active"
    
    print(json.dumps(compStatus))
    
        
    sleep(0.5)