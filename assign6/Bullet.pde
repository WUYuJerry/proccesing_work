class Bullet{
  int bulletLimit;
  int bulletNum;
  int bXSpeed;
  int bYSpeed;
  int [] bX;
  int [] bY;
  PImage[] bullet = new PImage[bulletLimit];
  
  Bullet(){
    bulletLimit = 5;
    bulletNum = 0;
    bXSpeed = 5;
    bYSpeed = 2;
    bulletLimit = 5; //max num of bullet
    bX = new int [bulletLimit];
    bY = new int [bulletLimit];
    bullet = new PImage[bulletLimit];
    for (int i=0; i<bulletLimit; i++){
      bullet[i] = loadImage("img/shoot.png");
    }
  }
  
  void display(int i){
    image(bullet[i],bX[i],bY[i]);
  }
  
  void display(){
    if(shoot == true){
      println("dsiplay");
      bX[bulletNum] = fighter.fX-BULLET_W;
      bY[bulletNum] = fighter.fY+(FIGHTER_H-BULLET_H)/2;
      shoot = false;
    }
  }
  
  void move(int i){
     bX[i] -= bXSpeed;
  }

}