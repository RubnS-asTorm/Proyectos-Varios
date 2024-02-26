 #define POT 0 
 void setup() {
 Serial.begin(9600);
 }
 void loop() {
 int valor;
 valor = analogRead (POT);
 Serial.print("El valor del potenciómetro es: ");
 Serial.println(valor);
 delay(100);
 }
 
 //otro dispositivo podra ser un medidor de tension, de temperatura, etc.
