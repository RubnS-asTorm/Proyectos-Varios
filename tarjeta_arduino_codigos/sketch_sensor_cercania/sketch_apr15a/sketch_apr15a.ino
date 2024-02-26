int EchoPin = 6;
int TriggerPin = 5;
# define motor 0
# define Base 3
int motorRead;
void setup() {
 Serial.begin(9600);
 pinMode(TriggerPin, OUTPUT);
 pinMode(EchoPin, INPUT);
 pinMode (Base, OUTPUT);
}
void loop() {

 long duration, distanciaCm;
 delay(500);
 digitalWrite(TriggerPin, LOW); 
 delayMicroseconds(4);
 digitalWrite(TriggerPin, HIGH);
 delayMicroseconds(10);
 digitalWrite(TriggerPin, LOW);
 motorRead = analogRead (motor);
 int velocidad = map (motorRead, 0, 1024, 0, 255);
 duration = pulseIn(EchoPin, HIGH); 
 distanciaCm = duration * 10 / 292/ 2; 
 Serial.print("Distancia: ");
 Serial.println(distanciaCm);
}

