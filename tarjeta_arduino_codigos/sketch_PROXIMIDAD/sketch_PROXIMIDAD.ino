int EchoPin = 5;
int TriggerPin = 6;
void setup() {
 Serial.begin(9600);
 pinMode(TriggerPin, OUTPUT);
 pinMode(EchoPin, INPUT);
}
void loop() {
 long duration, distanciaCm;
 delay(500);
 digitalWrite(TriggerPin, LOW);
 delayMicroseconds(4);
 digitalWrite(TriggerPin, HIGH);
 delayMicroseconds(10);
 digitalWrite(TriggerPin, LOW);
 duration = pulseIn(EchoPin, HIGH); 
 distanciaCm = duration * 10 / 292/ 2; 
 Serial.print("Distancia: ");
 Serial.println(distanciaCm);

}
