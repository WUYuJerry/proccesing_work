class Fighter {
  int fX, fY , hp , speedF;
  PImage img;
  
  
  Fighter(){
    fX = width-FIGHTER_W;
    fY = height/2-FIGHTER_H/2;
    speedF = 5;
    hp = floor(200*0.2);
    img=loadImage("img/fighter.png");
  }
  
  void display(){
    image(img,fX,fY);
  }
  
  void move(){
    if (upPressed) {
      fY -= speedF;
    }
    if (downPressed) {
      fY += speedF;
    }
    if (leftPressed) {
      fX -= speedF;
    }
    if (rightPressed) {
      fX += speedF;
    }
  }
   
}