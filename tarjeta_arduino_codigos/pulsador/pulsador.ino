int estadopulsador=0; 
 void setup() {
 pinMode(3, OUTPUT);
 pinMode(4, OUTPUT);
 pinMode(5, OUTPUT);
 pinMode(6, OUTPUT);
 pinMode(2, INPUT);
 }
 void loop() {
 estadopulsador = digitalRead(2);
 if (estadopulsador == LOW){
 digitalWrite(3, LOW);
 digitalWrite(4, LOW);
 digitalWrite(5, LOW);
 digitalWrite(6, LOW);
 delay(250);
 }
 else{
 digitalWrite(3, HIGH);
 digitalWrite(4, HIGH);
 digitalWrite(5, HIGH);
 digitalWrite(6, HIGH);
 delay(250);
 }
 }
