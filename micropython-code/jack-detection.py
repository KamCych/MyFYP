from machine import Pin
from picozero import Button, Pot
from time import sleep

#jack = Pin(4, Pin.OUT)
jack = Pot(0)
jackPin = Pin(0, Pin.OUT)


while True:
    #jack = Button(0)
    #rint(jackPin.value())
    print(jack.voltage)
    #print(jack.is_active)
    sleep(1)
    #if jack.value == 1:
    #    print("Button is pressed")
    #else:
    #    print("Button is not pressed")
    #sleep(1)