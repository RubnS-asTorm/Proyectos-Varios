#include <WiFi.h>
 
const char* ssid = "MOVISTAR_D780";
const char* password = "4nzDJX5j9NX7teu";

WiFiServer server(80);

void setup() {
  Serial.begin(115200);
 
// Conecta a la red wifi.
  Serial.println();
  Serial.print("Conectando con ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("Conectado con WiFi.");
 
  // Inicio del Servidor web.
  server.begin();
  Serial.println("Servidor web iniciado.");
 
  // Esta es la IP
  Serial.print("Esta es la IP para conectar: ");
  Serial.print("http://");
  Serial.println(WiFi.localIP());
}
 
void loop() {
  // Consulta si se ha conectado algún cliente.
  WiFiClient client = server.available();
  if (!client) { // Si no hay cliente...
    return;      // No siga leyendo el código.
  }
  
  Serial.print("Nuevo cliente: ");
  Serial.println(client.remoteIP());
  
  // Espera hasta que el cliente envíe datos.
  while(!client.available()){ delay(1); }

  String req = client.readStringUntil('\r');
  Serial.println(req); // Datos enviados por cliente.

  // Página WEB. ///////////////////////////////
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println(""); //  Importante.
  client.println("<!DOCTYPE HTML>");
  client.println("<html>");
  client.println("<head><meta charset=utf-8></head>");
  client.println("<body><center><font face='Arial'>");
  client.println("<h1>Servidor web con ESP32.</h1>");
  // client.println("<h2><font color='#009900'>KIO4.COM - Juan A. Villalpando</font></h2>");
  client.println("<h3>Página De Rubén.</h3>");
 // client.println("<img src='https://esports.as.com/2021/04/14/call-of-duty/Tokyo-Escape_1455464472_658609_1440x600.jpg'><br>");
  client.println("<img src='https://www.youtube.com/watch?v=hlM19nqG080'><br>");
 // client.println("<br><br>");
//  client.println("<img src='http://iesromerovargas.com/kio42.png'><br>");
 // client.println("<a href='juan'><button>Juan </button></a>");
//  client.println("<a href='antonio'><button>Antonio </button></a>"); 
 // client.println("<a href='a'><button>Envía la letra a</button></a>");
 // client.println("<a href='b'><button>Envía la letra b</button></a>"); 
 // client.println("</font></center></body></html>");

  Serial.print("Cliente desconectado: ");
  Serial.println(client.remoteIP());
  client.flush();
  client.stop();
} 
