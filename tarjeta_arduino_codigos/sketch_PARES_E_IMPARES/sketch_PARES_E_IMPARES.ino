

void setup()
{
 Serial.begin(9600);
 
 pinMode(3, OUTPUT);
 pinMode(2, OUTPUT);
 pinMode(5, OUTPUT);
 pinMode(4, OUTPUT);
}
void loop()
{
  int i;
  for (i = 0; i < 7; i++){
    Serial.print("i = ");
    Serial.println(i);
 }
 digitalWrite(4, HIGH);
 digitalWrite(3, LOW);
 digitalWrite(2, HIGH);
 digitalWrite(5, LOW);
 delay(1000);
 digitalWrite(4, LOW);
 digitalWrite(3, HIGH);
 digitalWrite(2, LOW);
 digitalWrite(5, HIGH);
 delay(500);
}
