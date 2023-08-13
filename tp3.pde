//Faustino Ugrina Natale
//https://www.youtube.com/watch?v=O1fSKIjEqvY
//el video tiene un problema de atraso con la camara igual es entendible 

int pantallaActual = 0;
int cantPantallas = 7;//10

int pantallaFinalActual = 0; //0, 1, 2
int cantFinales = 3;

PImage[] arregloPantallas = new PImage[cantPantallas];
String[] arregloTextosPantallas = new String[cantPantallas];
PImage[] arregloFinales= new PImage[cantFinales];
String[] arregloTextosFinales = new String[cantFinales];
boolean pantallas = true;
boolean creditos = false;
boolean finales = false;
PImage pantallaCreditos;


boolean botonInicio, botonReiniciar, botonCreditos, botonRebelarse, botonNoRebelarse, botonSi, botonNo = false;




void setup(){  
  
  size (600,600);

  pantallaCreditos = loadImage("creditos.jpg");

  for(int i=0;i<cantPantallas;i++){
    arregloPantallas[i] = loadImage("pantalla" + i + ".jpg");
    arregloTextosPantallas[i] = obtenerTextoArchivo("texto" + i + ".txt");
    if(i < cantFinales) {
      arregloFinales[i] = loadImage("final" + i + ".jpg");
      arregloTextosFinales[i] = obtenerTextoArchivo("textofinal" + i + ".txt");
    }
  }
  
}


void draw(){

  if(pantallas){
    fill(240);
    stroke(0);
    image(arregloPantallas[pantallaActual], 0, 0, width, height);    
    text(arregloTextosPantallas[pantallaActual], 10, 50);
    
  }
  if(pantallaActual == 5){
    fill(240);
    image(arregloPantallas[pantallaActual], 0, 0, width, height);    
    text(arregloTextosPantallas[pantallaActual], 10, 300);
    
  
  }
  if(creditos) {
    image(pantallaCreditos, 0, 0, width, height);
  }
  
  if(finales) {
   
    image(arregloFinales[pantallaFinalActual], 0, 0, width, height);
    fill(240);
    text(arregloTextosFinales[pantallaFinalActual], 10, 50);
    
  }
  
  mostrarBotones();
  
}


String obtenerTextoArchivo(String archivo) {
  return String.join("\n", loadStrings(archivo));
}



void mousePressed() {
  if(pantallas) {
    if(pantallaActual != 0 && pantallaActual != 4 && pantallaActual != 6) {
        siguientePantalla();
    }
    
    if(pantallaActual == 0){
      if (mouseX > 250 && mouseX < 350 && mouseY > 300 && mouseY < 350) {
        print("botonInicio");
        siguientePantalla();
      }
      if (mouseX > 250 && mouseX < 350 && mouseY > 400 && mouseY < 450) {
        print("botonCreditos");
        mostrarCreditos();
      }
    } //and posicion = "Iniciar" y "Creditos".
    
    if(pantallaActual == 4){
      if ( mouseX > 100 && mouseX < 200 && mouseY > 300 && mouseY < 350) {
        print("botonSi");
        siguientePantalla();
      }
      if (pmouseX > 400 && mouseX < 500 && mouseY > 300 && mouseY < 350) {
        print("botonNo");
        mostrarFinales(0);
      }
    } //"Si" y "No"
    
    if(pantallaActual == 6){
      if ( mouseX > 100 && mouseX < 200 && mouseY > 300 && mouseY < 350) {
        print("botonRebelarse");
        mostrarFinales(1);
      }
      if (pmouseX > 400 && mouseX < 500 && mouseY > 300 && mouseY < 350) {
        print("botonNoRebelarse");
        mostrarFinales(2);
      }
    } ////mostrar botones "Rebelarse" o "....."
  }
  
  if(finales){
    if (mouseX > 250 && mouseX < 350 && mouseY > 450 && mouseY < 500) {
      print("botonReiniciar");
      reiniciarPantallas();
    }
  }
  
  if(creditos){
    if (mouseX > 250 && mouseX < 350 && mouseY > 300 && mouseY < 350) {
      print("botonInicio");
      reiniciarPantallas();
    }
  }
}


void mostrarBotones() {
  if(finales) {
    dibujarBoton(250, 450, "Reiniciar");
  }
  
  if(creditos) {
    dibujarBoton(250, 300, "Inicio");
  }
  
  if(pantallas) {
    if(pantallaActual == 0) {
      dibujarBoton(250, 300, "Iniciar");
      dibujarBoton(250, 400, "Creditos");
    }
    
    if(pantallaActual == 4) {
      dibujarBoton(100, 300, "Si");
      dibujarBoton(400, 300, "No");
    }
    
    if(pantallaActual == 6) {
      dibujarBoton(100, 300, "Sucumbir");
      dibujarBoton(400, 300, "Rebelarse");
    }
  }
}


void dibujarBoton(int posX, int posY, String texto){
  fill(120);
  rect(posX, posY, 100, 50);
  fill(0);
  textSize(20);
  text(texto, posX + 15, posY + 30);
}


void reiniciarPantallas() {
  pantallaActual = 0;
  pantallas = true;
  finales = false;
  creditos = false;
}

void mostrarFinales(int pantallaSeleccionada) {  
  pantallaFinalActual = pantallaSeleccionada;
  pantallas = false;
  finales = true;
  creditos = false;
}

void mostrarCreditos() {
  pantallas = false;
  finales = false;
  creditos = true;
}



void siguientePantalla() {
  pantallaActual++;
  if(pantallaActual == cantPantallas){
    pantallaActual = 0;
  }
}
