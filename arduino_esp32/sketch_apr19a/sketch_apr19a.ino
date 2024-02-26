#include <WiFi.h>

const char* ssid = "MOVISTAR_D780";
const char* password = "4nzDJX5j9NX7teu";

void setup() {
  Serial.begin(115200);
  delay(10);
 
  // Conecta a la red wifi.
  Serial.println();
  Serial.print("Conectando con ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("Conectado con WiFi.");

  // Esta es la IP
  Serial.print("Esta es la IP asignada a la tarjeta: ");
  Serial.print("http://");
  Serial.println(WiFi.localIP());
  // Máscara de red.
  IPAddress subnet = WiFi.subnetMask();
  Serial.print("Máscara de red: ");
  Serial.println(subnet);
  // Puerta de enlace (Router).
  IPAddress gateway = WiFi.gatewayIP();
  Serial.print("Puerta de enlace: ");
  Serial.println(gateway);
  // Nombre de la red conectada (SSID).
  Serial.print("Nombre de la red (SSID): ");
  Serial.println(WiFi.SSID());
  // MAC de la tarjeta.
  Serial.print("Esta es la MAC de la tarjeta: ");
  byte mac[6];
  WiFi.macAddress(mac);
  Serial.print(mac[5], HEX);
  Serial.print(":");
  Serial.print(mac[4], HEX);
  Serial.print(":");
  Serial.print(mac[3], HEX);
  Serial.print(":");
  Serial.print(mac[2], HEX);
  Serial.print(":");
  Serial.print(mac[1], HEX);
  Serial.print(":");
  Serial.println(mac[0], HEX);
  // Fuerza de la señal recibida.
  long rssi = WiFi.RSSI();
  Serial.print("Fuerza de la senal recibida (RSSI): ");
  Serial.print(rssi);
  Serial.println(" dBm");
  // Estado de la conexión
  Serial.print("Estado de la conexión: ");
  Serial.println(WiFi.status());
}

void loop() {
}
