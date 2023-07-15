//no pude a terminar por motivos personales


int [] pantallas = new int [10];
int numero0,numero1,numero2,numero3,numero4,numero5,numero6,numero7,numero8,numero9;
PImage foto1,foto2,foto3,foto4,foto5,final1,final2,final3;
int minumero;
int numeroactual;

void setup(){
  
 numero0=0;
 numero1=1;
 numero2=2;
 numero3=3;
 numero4=4;
 numero5=5;
 numero6=6;
 numero7=7;
 numero8=8;
 numero9=9;
  
  
 size (600,600);

 foto1=loadImage("1984_1.png");
 foto2=loadImage("1984_2.png");
 foto3=loadImage("1984_3.png");
 foto4=loadImage("1984_4.png");
 foto5=loadImage("1984_5.png");
 final1=loadImage("Final 1.png");
 final2=loadImage("final 2.png");
 final3=loadImage("final 3.png");
  
  for(int i=0;i<12;i++){
   pantallas[i] =0;
   
  }
 
}

void draw(){
  println(pantallas);
  numeroactual=minumero;
  println(numeroactual);
  
   
