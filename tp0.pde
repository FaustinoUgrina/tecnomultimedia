//Faustino Ugrina Natale
//comision 3
//tp0

PImage retrato;

void setup(){
   size (800,400);
   retrato = loadImage("data/tp0.jpg");
}

void draw(){
    background(#AD0202);
    
    image(retrato, 400,0);
    
    fill(250 ,234 ,216);
      stroke(0);
      ellipse(200 ,410 ,130 ,50);
      stroke(250 ,234 ,216);
      ellipse(200 ,225 ,200 ,250);
      square(165 ,320 ,70);
      ellipse(100 ,235 ,25 ,50);
      ellipse(300 ,235 ,25 ,50);
 
    stroke(0);
    fill(0);
      ellipse(200, 140, 200, 80);
      ellipse(110 ,180 ,50 ,100);
      ellipse(140 ,170 ,45 ,100);
      ellipse(160 ,170 ,45 ,100);
      ellipse(240 ,170 ,45 ,100);
      ellipse(260 ,170 ,45 ,100);
      ellipse(290 ,180 ,50 ,100);
    
    strokeWeight(2);
    fill(255);
      ellipse(255 ,245 ,45 ,45);
      ellipse(150 ,245 ,45 ,45);
    
    fill(0);
      ellipse(260 ,240 ,35 ,35);
      ellipse(155 ,240 ,35 ,35);
    
    stroke(#FA6A7B);
    fill(#FA6A7B);
      ellipse(135 ,275 ,25 ,10);
      ellipse(265 ,275 ,25 ,10);
      ellipse(200 ,267 ,15 ,25);
    
    stroke(0);
    fill(0);
      line(200 ,280 ,210 ,275);
      line(200 ,280 ,190 ,275);
      line(205 ,310 ,225 , 305);
      line(195 ,310 ,175 , 305);
} 
