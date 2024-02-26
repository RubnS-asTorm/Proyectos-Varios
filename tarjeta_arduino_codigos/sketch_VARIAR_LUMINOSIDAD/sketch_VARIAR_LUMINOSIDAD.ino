
 #define Led 5
 #define Pot A0
 int medida_Pot, valor_Pwm;
 void setup() {
 pinMode(Led, OUTPUT);
 pinMode(7, OUTPUT);
 pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
 }
 void loop() {
 medida_Pot = analogRead(Pot); 
 valor_Pwm= map(medida_Pot, 0, 1023, 0, 255);

// analogWrite(Led, valor_Pwm);
 if(valor_Pwm >0 && valor_Pwm<341){
  
  digitalWrite(7, HIGH);
  digitalWrite(8, LOW);
  digitalWrite(9, LOW);
  }else  if(valor_Pwm >341 && valor_Pwm<682){
  
  digitalWrite(7, LOW);
  digitalWrite(8, HIGH);
  digitalWrite(9, LOW);
  }else  if(valor_Pwm >682 && valor_Pwm<1023){
  
  digitalWrite(7, LOW);
  digitalWrite(8, LOW);
  digitalWrite(9, HIGH);
  }



 
 }
