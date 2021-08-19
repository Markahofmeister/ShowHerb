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
#define numSensors 2
uint8_t relayPin = 15;

//multiplexer address
#define TCAADDR 0x70

//photocell variables
uint8_t photoPin = A0;

//rain Sensor variables 
uint8_t rainAnalogPin = A7; 
uint8_t rainDigitalPin = 14;



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
uint16_t getTimeToCheck() {

  uint16_t timeToCheck; 
  uint16_t photoVal = analogRead(photoPin);
  Serial.print("PhotoVal: "); Serial.println(photoVal);
  
  if (photoVal > 300) {
    timeToCheck = 4000;
  }
  else if (photoVal > 200) {
    timeToCheck = 8000;
  }
  else if(photoVal > 150) {
    timeToCheck = 12000;
  }
  else if(photoVal > 100) {
    timeToCheck = 16000; 
  }
  else {
    timeToCheck = 20000;
  }

  return timeToCheck;
}

bool checkIsRaining() {

  pinMode(rainDigitalPin, OUTPUT);
  digitalWrite(rainDigitalPin, LOW);
  pinMode(rainDigitalPin, INPUT);
  bool isRaining = !(digitalRead(rainDigitalPin));

  return isRaining; 
}

uint16_t getTimeToWater() {

  uint16_t timeToWater;
  uint16_t rainVal = analogRead(rainAnalogPin);
  Serial.print("RainVal: "); Serial.println(rainVal);
  
  if (rainVal > 850) {
    timeToWater = 5000;
  }
  else if (rainVal > 700) {
    timeToWater = 4000;
  }
  else if(rainVal > 550) {
    timeToWater = 3000;
  }
  else if(rainVal > 400) {
    timeToWater = 2000; 
  }
  else {
    timeToWater = 1000;
  }

  return timeToWater;
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
  uint16_t timeToWater = getTimeToWater();
  uint16_t timeToCheck = getTimeToCheck();
  Serial.print("Is raining: "); Serial.println(isRaining);
  Serial.print("Time to Water: "); Serial.println(timeToWater);
  Serial.print("Time to Check: "); Serial.println(timeToCheck);

  if(!isRaining) {

      for (uint8_t x = 0; x <= (numSensors - 1); x++) {
        ss.begin(0x36);
        uint8_t pinNum = x + 5;
        digitalWrite(pinNum, HIGH);
        Serial.println("Sensor ON");
        delay(100);
        tcaselect(x);
        delay(100);
    
        float temp = ss.getTemp();
        delay(100);
        uint16_t capread = ss.touchRead(0);
        delay(100);

        if (capread > 2500) {
          capread = 1000;
        }
        
        //Serial.print("Photocell Frequency: "); Serial.println(getPhotoVal);
        //Serial.print("Rain Sensor Frequency: "); Serial.println(getRainVal);
        Serial.print("Sensor "); Serial.print(x + 1); Serial.print(" Capacitive: "); Serial.println(capread);
        Serial.print("Sensor "); Serial.print(x + 1); Serial.print(" Temperature: "); Serial.println(temp);
    
        if(capread < 1200) {
           digitalWrite(relayPin, HIGH);
           Serial.println("Valve Open");
           delay(timeToWater);
           digitalWrite(relayPin, LOW);
           Serial.println("Valve Closed");
           delay(10000);
         }else {
           //continue; 
         }
    
        digitalWrite(pinNum, LOW);
        Serial.println("Sensor OFF");
        delay(timeToCheck);
    
      }
   }
   delay(1000);
}













/*uint16_t getTotalFreq() {
  
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
}*/
