/*Date: 7/28/2021
* Testing single soil sensor code*/


#include "Adafruit_seesaw.h"

Adafruit_seesaw ss1;
uint8_t ssp1 = 13;

void setup() {
  Serial.begin(9600);

  Serial.println("Soil Sensor Acctivation");
  
  if (!ss1.begin(0x36)) {
    Serial.println("ERROR! seesaw not found");
    while(1);
  } else {
    Serial.print("SS started, version ");
    Serial.println(ss1.getVersion(), HEX);
  }

  pinMode(ssp1, OUTPUT);
}

void loop() {
  float tempC1 = ss1.getTemp();
  uint16_t capread1 = ss1.touchRead(0);

  Serial.print("Temperature: "); Serial.print(tempC1); Serial.println("*C");
  Serial.print("Capacitive: "); Serial.println(capread1);
  
  if(capread1 < 560) {
    digitalWrite(ssp1, HIGH);
    delay(5000);
    digitalWrite(ssp1, LOW);
    delay(20000);
  }

  delay(1000);

}
