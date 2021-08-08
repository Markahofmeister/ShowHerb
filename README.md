# ShowHerb 

ShowHerb is an automated garden watering system. It uses Adafruit's STEMMA I2C soil sensors, reporting soil moisture levels and temperature. 

The control structure uses an Arduino nano, as well as a TCA I2C multiplexer to allow up to 8 sensors to be added. The electromechanical irrigation valve is controlled by a 5V relay, also controlled by the Arduino.

![](media/images/Schematic-V4.png)

The Stemma Soil Sesors have custom 3d printed covers to protect their circuitry. Additionally, to avoid moisture damage over time, the sensors are only powered when they are being read. This is done through Arduino GPIO pins, rather than a constant +5V connection. 

The control box houses the nano, I2C multiplexer, relay, and solderable breadboard. This box is also custom 3D printed to allow for: 
- Device-specific spacers from the ground
- Precise wire conduit holes to avoid dust and debris buildup
- threaded insert holes for easy future access 
- Plugs for unused holes to further prevent debris buildup 
- Customized ventilation dimensions & placement 
- compact & clean organization of components + wiring

Further details are available on my website [here.]()

