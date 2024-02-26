int cont = 0;
int estadopulsador = 0;
 void setup(){
 pinMode(3, OUTPUT);
 pinMode(4, OUTPUT);
 pinMode(5, OUTPUT);
 pinMode(6, OUTPUT);
 pinMode(7, INPUT);
 Serial.begin(9600);
 }
 void loop(){
 estadopulsador = digitalRead(7);
 if(estadopulsador==HIGH){
   cont = cont + 1;
   if(cont == 4){
     cont = 0;
   }
 }
if(cont == 1){
  estadopulsador = 1;
  cont = 1;
   pinMode(3, HIGH);
   pinMode(4, LOW);
   pinMode(5, LOW);
   pinMode(6, HIGH);
 }
   if(cont == 2){
     estadopulsador = 2;
     cont = 2;
     pinMode(3, LOW);
     pinMode(4, HIGH);
     pinMode(5, HIGH);
     pinMode(6, LOW);
   }
     if(cont == 3){
       estadopulsador = 3;
       cont = 3;
       pinMode(3, HIGH);
       pinMode(4, LOW);
       pinMode(5, HIGH);
       pinMode(6, LOW);
         }
 Serial.println(cont);
 }
 
