final int EYE_X_L = 160;  // left eye center X-position 
final int EYE_X_R = 440;  // right eye center X-position
final int EYE_Y = 250;    // eyes center Y-position
final int SCARF_W = 60;

PImage face, eye, fly;


void setup() {  
  size(600 ,720);
  face = loadImage("face.png");
  eye = loadImage("eye.png");
  fly = loadImage("fly.png");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noCursor(); // make mouse disappear
}

void draw(){  
  image(face, width/2, height/2);
    
  
  
  // draw eyes
  pushMatrix();
  translate(EYE_X_L,EYE_Y);
  rotate(atan2(mouseY-EYE_Y,mouseX-EYE_X_L)); //<>//
  println(degrees(atan2(mouseY-EYE_Y,mouseX-EYE_X_L)));
  image(eye, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(EYE_X_R,EYE_Y);
  rotate(atan2(mouseY-EYE_Y,mouseX-EYE_X_R));
  image(eye, 0, 0);
  popMatrix();

  
  
  // draw scarf
  colorMode(HSB,360,100,100);
  
  for(int i = 0; i<10; i++){
    for(int j = 0; j<2; j++){
      float dis = dist(mouseX,mouseY,0+i*60+SCARF_W/2,600+j*60+SCARF_W/2);
      float B = map(dis,0,60,30,100);
      fill(32,70,100);
      int val = (i+j)%3;
      switch(val){
        case 0:
          fill(32,70,B);
          break;
        case 1:
          fill(218,80,B);
          break;
        case 2:
          fill(216,60,B);
          break;
      }
    
      rect(0+i*60,600+j*60,SCARF_W,SCARF_W);
      
      
    }
  }
  
    
  image(fly, mouseX, mouseY);
}