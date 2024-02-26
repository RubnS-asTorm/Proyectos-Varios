void setup()
{
 Serial.begin(9600);
 
 pinMode(3, OUTPUT);
 pinMode(4, OUTPUT);
 pinMode(5, OUTPUT);
 pinMode(6, OUTPUT);
 }
void loop()
{
  int i;
  for (i = 0; i < 5; i++){
    Serial.print("i = ");
    Serial.println(i);
 digitalWrite(3, HIGH);
 digitalWrite(4, HIGH);
 digitalWrite(5, HIGH);
 digitalWrite(6, HIGH);
 delay(300);
 digitalWrite(3, LOW);
 digitalWrite(4, LOW);
 digitalWrite(5, LOW);
 digitalWrite(6, LOW);
 delay(300);
 }
{
  int i;
  for (i = 0; i < 5; i++){
    Serial.print("i = ");
    Serial.println(i);
 digitalWrite(3, HIGH);
 digitalWrite(4, LOW);
 digitalWrite(5, LOW);
 digitalWrite(6, HIGH);
 delay(200);
 digitalWrite(3, LOW);
 digitalWrite(4, HIGH);
 digitalWrite(5, HIGH);
 digitalWrite(6, LOW);
 delay(200);
  }
 }
}
