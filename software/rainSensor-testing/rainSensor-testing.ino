/* 
 * Date: 08/09/2021
 * 
 * Rain sensor testing code 
 * 
 */

 uint8_t digInputPin = 2;
 uint8_t anInputPin = A0; 
 uint8_t digInput;
 uint16_t anInput; 
 
void setup() {
  
   Serial.begin(9600);
   pinMode(digInputPin, INPUT);
   
}

void loop() {

  digInput = digitalRead(digInputPin);
  anInput = analogRead(anInputPin);
  
  Serial.print("Digital Output: "); Serial.println(digInput);
  Serial.print("Analog Output: "); Serial.println(anInput);

  delay(1000); 

}
