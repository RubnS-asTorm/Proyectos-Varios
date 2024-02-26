  #define Led1 3
  #define Led2 5
  #define Led3 6
  #define Pot A0
  int medida_Pot, valor_Pwm;
  void setup() {
 pinMode(Led1,OUTPUT);
 pinMode(Led2,OUTPUT);
 pinMode(Led3,OUTPUT);
}
  void loop() {
 medida_Pot = analogRead(Pot); 
 valor_Pwm= map(medida_Pot, 0, 1023, 0, 255);
 analogWrite(Led1, valor_Pwm);
 valor_Pwm= map(medida_Pot, 0, 1023, 0, 255);
 analogWrite(Led2, valor_Pwm);
 valor_Pwm= map(medida_Pot, 0, 1023, 0, 255);
 analogWrite(Led3, valor_Pwm);
}
