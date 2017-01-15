int x1,x2,x3,x4,y,hp;
int speedX , speedY ;

PImage bg1Img;
PImage bg2Img;
PImage bg3Img;
PImage fighterImg;
PImage enemyImg;
PImage hpImg;
PImage treasureImg;


void setup (){
  size(640,480);
  bg1Img= loadImage("img/bg1.png");
  bg2Img= loadImage("img/bg2.png");
  bg3Img= loadImage("img/bg3.png");
  fighterImg= loadImage("img/fighter.png");
  enemyImg= loadImage("img/enemy.png");
  hpImg= loadImage("img/hp.png");
  treasureImg= loadImage("img/treasure.png");
  
  hp = floor(random(15,217));//random hp
  y = floor(random(320));//random treasure
  
}

void draw () {
// image(bg1Img,x2,0);
 x2 += 5;
 x2 %= 6400;
 image(bg2Img,-640+x3,0);
 x3 += 5;
 x3 %= 1280;
 image(bg3Img,-1280+x4,0);
 x4 += 5;
 x4 %= 1920;
 
 image(fighterImg,580,200);
 
 fill(256,0,0);
 rectMode(CORNERS);
 rect(15,15,hp,35);
 image(hpImg,10,10);
 
 image(enemyImg,x1,100);
 x1 += 0;
 x1 %= 580; 
 
 image(treasureImg,300,y);
 
}