
void setup()
{
 pinMode(3, OUTPUT);
 pinMode(2, OUTPUT);
 pinMode(1, OUTPUT);
 pinMode(4, OUTPUT);
 }
void loop()
{
 digitalWrite(4, HIGH);
 digitalWrite(3, LOW);
 digitalWrite(2, LOW);
 digitalWrite(1, LOW);
 delay(600);
 digitalWrite(4, LOW);
 digitalWrite(3, HIGH);
 digitalWrite(2, LOW);
 digitalWrite(1, LOW);
 delay(500);
 digitalWrite(4, LOW);
 digitalWrite(3, LOW);
 digitalWrite(2, HIGH);
 digitalWrite(1, LOW);
 delay(1000);
 digitalWrite(4, LOW);
 digitalWrite(3, LOW);
 digitalWrite(2, LOW);
 digitalWrite(1, HIGH);
 delay(250);
 digitalWrite(4, LOW);
 digitalWrite(3, LOW);
 digitalWrite(2, LOW);
 digitalWrite(1, HIGH);
 delay(250);
 digitalWrite(4, LOW);
 digitalWrite(3, LOW);
 digitalWrite(2, HIGH);
 digitalWrite(1, LOW);
 delay(1000);
 digitalWrite(4, LOW);
 digitalWrite(3, HIGH);
 digitalWrite(2, LOW);
 digitalWrite(1, LOW);
 delay(500);
 digitalWrite(4, HIGH);
 digitalWrite(3, LOW);
 digitalWrite(2, LOW);
 digitalWrite(1, LOW);
 delay(600);
 }
