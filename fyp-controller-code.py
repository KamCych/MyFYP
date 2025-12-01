from picozero import Pot, pico_led, Button

from time import sleep

pico_led.on()

dial = Pot(26)
butt = Button(15)


#this function is used to determine the action choice based on the knob value
def knob_pick():
    if dial.value < 0.3:
        print("PHONE HELP")
        #turn on leftmost led
    elif dial.value > 0.3 and dial.value < 0.6:
        print("NET HELP")
        #turn on middle led
    else:
        print("DISCONNECT")
        #turn on rightmost led

while True:
    #print(dial.value)
        
    if butt.is_pressed:
        print_pick()
    
    sleep(0.1)

