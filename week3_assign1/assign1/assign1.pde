PImage bg1,bg2,enemy,fighter,hp,treasure;
int x,eX,eY,tX,tY,fX,fY,blood;

void setup () {
  size(640,480) ;  
  bg1=loadImage("img/bg1.png");  
  bg2=loadImage("img/bg2.png");  
  enemy=loadImage("img/enemy.png");  
  fighter=loadImage("img/fighter.png");  
  hp=loadImage("img/hp.png");  
  treasure=loadImage("img/treasure.png");  
  
  eX = floor(random(50,590)); //enenmy
  eY = floor(random(50,430));
   
  tX = floor(random(50,590)); //treasure
  tY = floor(random(50,430));
  
  fX = floor(random(50,590)); //fighter
  fY = floor(random(50,430));
  
  blood = floor(random(200)); //hp blood


}

void draw() {
  
  //background
  image(bg1,x,0);   
  image(bg2,-640+x,0);   
  image(bg1,-1280+x,0);   
  x++; x%=1280;
  
  //enemy
   image(enemy,eX,eY); 
   eX++; eX%=640;
   
  //treasure
   image(treasure,tX,tY);
   
  //fighter
   image(fighter,fX,fY);
  
  //hp
   fill(255,0,0);
   rect(15,10,blood,30);
   image(hp,10,10);

}