//Faustino Ugrina Natale
//Comision 3

int pantallaActual = 0;
int tiempoPantalla = 10000; // 10 segundos
int tiempoInicioPantalla;
boolean reiniciarSecuencia = false;
float x = width/2;
float y = height/4;
int alpha = 255;
int tiempoParpadeo = 30; 
int tiempoInicioParpadeo;
float anguloRotacion = 0.0;
float velocidadRotacion = 0.02;
PImage imagen1, imagen2, imagen3;
PFont fuente;

void setup() {
  size(640, 480);
  fuente = loadFont("BlackadderITC-Regular-48.vlw");
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  tiempoInicioPantalla = millis();
   tiempoInicioParpadeo = millis();
}

void draw() {
  background(255);
    if (pantallaActual == 2) {
    anguloRotacion += velocidadRotacion;
  }
  
  // Pantalla 1
  if (pantallaActual == 0) {
    textFont(fuente, 48);
    textAlign(CENTER, CENTER);
    fill(0);
    x += 1;  
    y += sin(frameCount * 0.05);  
    text("Nam June Paik", x, y);
    image(imagen1, 200, 200, width/3, height/2);
  }

 // Pantalla 2
  if (pantallaActual == 1) {
    textFont(fuente, 24);
    textAlign(CENTER, CENTER);
    if (millis() - tiempoInicioParpadeo > tiempoParpadeo) {
      tiempoInicioParpadeo = millis(); 
      if (alpha == 255) {
        alpha = 0;
      } else {
        alpha = 255;
      }
    }
    
    fill(0, alpha);
    
    String texto = "\"TV Buddha\" (1974):\n\nEsta instalación consiste en una estatua de Buda sentado \nfrente a un monitor de televisión en el que se proyecta su propia \nimagen en tiempo real. La obra explora la relación entre lo sagrado y \nlo tecnológico, reflexionando sobre la influencia de \nlos medios de comunicación en nuestra percepción y experiencia del mundo.";
    text(texto, width/2, height/4);
    image(imagen2, 180, 250, width/2, height/2);
  }
  //pantalla 3
 if (pantallaActual == 2) {
    textFont(fuente, 24);
    textAlign(CENTER, CENTER);
    fill(0);
    pushMatrix(); 
    translate(width/2, height/5);
    rotate(anguloRotacion);
    String texto = "\"Electronic Superhighway: Continental U.S., Alaska, Hawaii\" (1995): \nEsta monumental instalación presenta un mapa de los Estados Unidos \ncompuesto por pantallas de televisión y videocasetes que muestran \nimágenes y grabaciones relacionadas con cada uno de los estados. \nLa obra examina la influencia de los medios de comunicación y la tecnología en la \nconstrucción de la identidad y la cultura estadounidense.";
    text(texto, 0, 0);
    popMatrix(); 
    image(imagen3, 180, 230, width/2, height/2);
 }
 
  // Pantalla 4
  if (pantallaActual == 3) {
    textFont(fuente, 24);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Fin.", width/2, height/2);
    
    // Botón de reinicio
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2 + 50, 120, 40);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Reiniciar", width/2, height/2 + 50);
    
    if (reiniciarSecuencia) {
      pantallaActual = 0;
      tiempoInicioPantalla = millis();
      reiniciarSecuencia = false;
    }
  }
  
  if (!reiniciarSecuencia && millis() - tiempoInicioPantalla >= tiempoPantalla && pantallaActual != 3) {
    pantallaActual = (pantallaActual + 1) % 4;
    tiempoInicioPantalla = millis();
  }
}

void mouseClicked() {
  if (pantallaActual == 3 && mouseX > width/2 - 60 && mouseX < width/2 + 60 && mouseY > height/2 + 30 && mouseY < height/2 + 70) {
    reiniciarSecuencia = true;
  }
}

   
