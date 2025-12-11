# Final Year Project - Network Scramble

The artefact for this university project is a new game experience, played with a custom built controller. As the player, you are tasked with answering network issue calls using retro buttons and knobs, and connecting homes to temporary backup networks using patch cables.

- A videogame.
- A custom built controller.


## Progress

**01/12/25**
- Built a part of the circuit using a potentiometer and button, in line with the controller design.
- Wrote code and clearly commented descriptions for later.

![An image of a Raspberry Pi Pico circuit](/images/first-circuit.jpg)


**03/12/25**

- Added LEDs to circuit, turns an LED on based on the pot value.
- Researching how to communicate between pico and Unity. 

![An image of a Raspberry Pi Pico circuit, this time with LEDs](/images/circuit-leds.jpg)


Two options:
- Serial communication : Data is transferred through usb. Unity C# uses SerialPort class(?) to read serial data from pico. May need a UART/TTL converter.

- Server/Wireless communication : HTTP or WebSocket; websockets are faster so itll probably be the choice. Pico will send data as (probably) JSON and Unity (and anything else) can read this as if it was a server(?)

**11/12/25**

- Ordered additional electronic components
- Begun game prototype in Godot

![Yellow LEDs](/images/components/yellow-led.jpg)
![Green LEDs](/images/components/green-led.jpg)
![Button](/images/components/button.jpg)
![Resistors](/images/components/res.jpg)

The game so far has code that sets up communication between the controller and the game engine.
