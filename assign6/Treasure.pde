class Treasure {
  int tX, tY ;
  float size;
  PImage img;
  
  Treasure(){
    size = floor(random(2))*0.4;
    tX = floor(random(TREASURE_W*(1+size),width-TREASURE_W*(1+size)));
    tY = floor(random(TREASURE_H*(1+size),height-TREASURE_H*(1+size)));
    img=loadImage("img/treasure.png");
  }
  
  void display(){
    image(img,tX,tY,TREASURE_W*(1+size),TREASURE_H*(1+size));
  }
  
}