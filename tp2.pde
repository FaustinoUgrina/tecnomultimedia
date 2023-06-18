//Faustino Ugrina 
//comision 3
//profesor Damian Bedovian 
//https://www.youtube.com/watch?v=iM8GjUF_1hI

float maxDistToCenter;
color randomColor = #FFFFFF;
color randomColorBg = #000000;
boolean randomAutomatico = false;
float posicionX;
float posicionY;

int tiempoPantalla = 1000; // 1 segundo
int tiempoInicioPantalla = 0;
PImage imagen;

  
void setup() {  
  size(800, 400);
  posicionX = ((width + 400) / 2) + 400;
  posicionY = height / 2;
  maxDistToCenter = dist(0, 0, posicionX, posicionY);
  imagen = loadImage ("tp3imagen.png");
}
 
void draw() {  
  background(randomColorBg);
  image(imagen,0,0,400,400);
  translate (400, 0);
  for(float i = 0; i <= width; i += 1) {
    for(float j = 0; j <= height; j += 0.5) {
      
      maxDistToCenter = dist(i, j, posicionX, posicionY);
      float resto = maxDistToCenter % 50;
      if (resto == 0){
        float nivel = (maxDistToCenter / 25);
        if(nivel < 1){
          nivel = 1;
        }
        if(nivel > 10){
          nivel = 10;
        }
        ellipse(i, j, 5 * nivel, 5 * nivel);
        fill(randomColor);
        smooth();
      }
    }
  }

   
  if( millis() - tiempoInicioPantalla >= tiempoPantalla && randomAutomatico ) {
    algoParaHacer();
  }
}

void mouseMoved() {
  posicionX = mouseX;
  posicionY = mouseY;
}

void keyPressed() {
  // En caso de que la tecla presionada sea ENTER, elige un color random.
  if (key == ENTER) {
    float red = random(0, 255);
    float green = random(0, 255);
    float blue = random(0, 255);
    randomColor = color(red, green, blue);
  }
  // En caso de que la tecla presionada sea BACKSPACE, elige un color random para el background.
  if (key == BACKSPACE) {
    float red = random(0, 255);
    float green = random(0, 255);
    float blue = random(0, 255);
    randomColorBg = color(red, green, blue);
  }
  // En caso de que la tecla presionada sea SPACE, comienza el coloreado automatico.
  if(key == ' ') {
    randomAutomatico = !randomAutomatico;
  }
  // En caso de que la tecla presionada sea SPACE, finaliza el coloreado automatico y resetea el color.
  if(key == 'q' || key == 'Q'){
    reset();
  }
}

void algoParaHacer() {
  tiempoInicioPantalla = millis();
  randomColor = GetRandomColor(false);
  randomColorBg = GetRandomColor(true);
}

color GetRandomColor(boolean isBackground) {
  int min = 0;
  int max = 255;
  if(isBackground){
    max = 127;
  }
  else{
    min = 127;
  }
  float red = random(min, max);
  float green = random(min, max);
  float blue = random(min, max);
  return color(red, green, blue);  
}

void reset() {
  posicionX = width/2;
  posicionY = height/2;
  randomAutomatico = false;
  randomColor = color(#FFFFFF);
  randomColorBg = color(0);
}
