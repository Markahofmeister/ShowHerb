/**
 * TCA9548 I2CScanner.ino -- I2C bus scanner for Arduino
 *
 * Based on https://playground.arduino.cc/Main/I2cScanner/
 * 
 * Sketch to read Serial outputs for testing purposes 
 *
 */

#include "Wire.h"
#include "Adafruit_seesaw.h"

//soil sensor 
Adafruit_seesaw ss;
#define numSensors 1
uint8_t relayPin = 16;

//multiplexer address
#define TCAADDR 0x70

//photocell variables
uint8_t photoPin = A0;

//rain Sensor variables 
uint8_t rainAnalogPin = A7; 
uint8_t rainDigitalPin = 15;


//select tca port to communicate with
void tcaselect(uint8_t addr) {
  if (addr > 7) return;
 
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << addr);
  Wire.endTransmission();  
}

//initialize output pins 
void initOutputPins() {
  for (int i = 5; i <= (numSensors + 4); i++) {
    pinMode(i, OUTPUT);
  }
}

//Finds active ports and connected I2C addresses 
void findActivePorts() {
  
  for (uint8_t i=0; i<8; i++) {
      tcaselect(i);
      Serial.print("TCA Port #"); Serial.println(i);

      for (uint8_t addr = 0; addr <= 127; addr++) {
          if (addr == TCAADDR) continue;

          Wire.beginTransmission(addr);
            if (!Wire.endTransmission()) {
             Serial.print("Found soil sensor at 0x");  Serial.println(addr,HEX);
           }
      }
      
    }
}

//use photoresistor to determine water frequncy 
uint8_t getPhotoVal() {
  
  uint8_t photoVal = analogRead(photoPin);

  return photoVal;
}

bool checkIsRaining() {

  pinMode(rainDigitalPin, INPUT);
  bool isRaining = !(digitalRead(rainDigitalPin));

  return isRaining; 
}

uint16_t getRainVal() {
  
  uint16_t rainVal = analogRead(rainAnalogPin);

  return rainVal;
}

uint16_t getTotalFreq() {
  
  uint16_t totalVal, totalFreq;
  uint8_t photoVal = getPhotoVal();
  uint8_t rainVal = getRainVal();

  totalVal = photoVal + rainVal;
  
  if (totalVal > 900) {
    totalFreq = 5000;
  }
  else if (totalVal > 750) {
    totalFreq = 4000;
  }
  else if(totalVal > 600) {
    totalFreq = 3000;
  }
  else if(totalVal > 450) {
    totalFreq = 2000; 
  }
  else {
    totalFreq = 1000;
  }
  
  return totalFreq;
}




// standard setup
void setup() {

    //initialize outputs
    initOutputPins();  
  
    //begin Serial
    Serial.begin(9600);
    while (!Serial);
    delay(1000);

    //initialize Wire and sensor objects
    Wire.begin();
    ss.begin(0x36);

    pinMode(relayPin, OUTPUT);
    
    Serial.println("\nTCAScanner ready.");
    Serial.println("Soil Sensor(s) ready");

    //Find connected I2C addresses
    findActivePorts(); 
    
    Serial.println("\ndone");
    
}

void loop() 
{

  bool isRaining = checkIsRaining();
  uint16_t totalFreq = getTotalFreq();

  if(!isRaining) {

      for (uint8_t x = 0; x <= (numSensors - 1); x++) {
        uint8_t pinNum = x + 5;
        digitalWrite(pinNum, HIGH);
        tcaselect(x);
    
        float temp = ss.getTemp();
        uint16_t capread = ss.touchRead(0);
        
        //Serial.print("Photocell Frequency: "); Serial.println(getPhotoVal);
        //Serial.print("Rain Sensor Frequency: "); Serial.println(getRainVal);
        Serial.print("Sensor "); Serial.print(x); Serial.print(" Capacitive: "); Serial.println(capread);
        Serial.print("Sensor "); Serial.print(x); Serial.print(" Temperature: "); Serial.println(temp);
    
        if(capread < 560) {
           digitalWrite(relayPin, HIGH);
           delay(totalFreq);
           digitalWrite(relayPin, LOW);
           delay(20000);
         }else {
           continue; 
         }
    
         
        delay(5000);
    
      }
  }
}
