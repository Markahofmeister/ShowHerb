/**
 * TCA9548 I2CScanner.ino -- I2C bus scanner for Arduino
 *
 * Based on https://playground.arduino.cc/Main/I2cScanner/
 *
 */

#include "Wire.h"
#include "Adafruit_seesaw.h"

Adafruit_seesaw ss;
#define numSensors 1
uint8_t pinNum;

#define TCAADDR 0x70


//select tca port to communicate with
void tcaselect(uint8_t addr) {
  if (addr > 7) return;
 
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << addr);
  Wire.endTransmission();  
}


// standard setup
void setup() {

  for (int i = 4; i <= (numSensors + 3); i++) {
    pinMode(i, OUTPUT);
  }

    //begin Serial
    Serial.begin(9600);
    while (!Serial);
    delay(1000);

    //initialize Wire and sensor objects
    Wire.begin();
    ss.begin(0x36);
    
    
    Serial.println("\nTCAScanner ready.");
    Serial.println("Soil Sensor(s) ready");

    //Find active ports and connected I2C addresses
    for (uint8_t i=0; i<8; i++) {
      tcaselect(i);
      //Serial.print("TCA Port #"); Serial.println(i);

      for (uint8_t addr = 0; addr <= 127; addr++) {
        if (addr == TCAADDR) continue;

        Wire.beginTransmission(addr);
        if (!Wire.endTransmission()) {
          Serial.print("Found soil sensor at 0x");  Serial.println(addr,HEX);
        }
      }
    }
    Serial.println("\ndone");
    
}

void loop() 
{

  //int x = 0;
  for (uint8_t x = 0; x <= (numSensors - 1); x++) {
    pinNum = x + 4;
    digitalWrite(pinNum, HIGH);
    tcaselect(x);

    float temp = ss.getTemp();
    uint16_t capread = ss.touchRead(0);

    Serial.print("Capacitive: "); Serial.println(capread);
    Serial.print("Temperature: "); Serial.println(temp);
  

    delay(1000);

  }
}
