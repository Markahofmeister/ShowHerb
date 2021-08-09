/*Date: 08/09/2021
 * 
 * Photocell analog return value testing code 
 * 
 */

 uint8_t analogValue;
 uint8_t analogPin = A0;

 void setup() {
  
  Serial.begin(9600);

 }

void loop() {
  analogValue = analogRead(analogPin);

  Serial.println(analogValue);
  delay(500);
}

/*
 * Sunny day outside: ~250 return 
 * Sunny day inside, no lights: ~125 return 
 * Night time outside: 
 */
