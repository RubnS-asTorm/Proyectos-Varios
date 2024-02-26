# define Motor 3
# define EchoPin 6
# define TriggerPin 5
int velocidad;

int distancia;

void setup() {
  
Serial.begin(9600);
pinMode (Motor, OUTPUT); 
pinMode(TriggerPin, OUTPUT);
pinMode(EchoPin, INPUT);
}
void loop() {
  int Limite = 25;
analogWrite (Motor, velocidad);
long duracion, distanciaCm; 

digitalWrite(TriggerPin, HIGH);
delayMicroseconds(2);

digitalWrite(TriggerPin, HIGH); 
delayMicroseconds(10);

digitalWrite(TriggerPin, LOW);
 
duracion = pulseIn(EchoPin, HIGH);
distancia = duracion * 10 / 292 / 2;

int velocidad = map (distancia, 0, 1024, 0, 255);
analogWrite (3, velocidad);
delay(300);
Serial.println(String(distancia) + " cm. ");
Serial.println(velocidad);



if (distancia < Limite){

analogWrite (3, velocidad);
}
else{

analogWrite (3, 250);
 
}
}
