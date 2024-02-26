
const int pot = A0; 
const int green = 11; 
const int blue = 10; 
const int red = 9; 
void setup() { 
for (int pinNumber = 9; pinNumber<12; pinNumber++)
{ pinMode(pinNumber, OUTPUT); 
}
pinMode(pot, INPUT); 
Serial.begin(9600); 
}
void loop() { int potVal = analogRead(pot); 
//potval is an integer that stores the value of the potentiometer 
Serial.println(potVal); 
if(potVal<=340){ 
digitalWrite(green, HIGH); 
digitalWrite(red, LOW); 
digitalWrite(blue, LOW); 
}
if (potVal<=680 && potVal>=341){ 
digitalWrite(red, HIGH); 
digitalWrite(green, LOW); 
digitalWrite(blue, LOW); 
}
if (potVal<=1023 && potVal>=681){ 
digitalWrite(blue, HIGH); 
digitalWrite(red, LOW); 
digitalWrite(green, LOW); 
}
 delay(100);
}


