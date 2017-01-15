PImage bg1,bg2,enemy,fighter,hp,treasure,start1,start2,end1,end2;
int x,eX,eSpacing,eMid,tX,tY,fX,fY,blood,speedF,speedxE,speedyE;
float eY,eNum;
final int FIGHTER_W = 51;
final int ENEMY_W = 51;
final int START=0;
final int PLAYING=1;
final int GAME_OVER=2;
int gameState,eState;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean eRandom = false;

void setup () {
  size(640,480) ;  
  bg1=loadImage("img/bg1.png");  
  bg2=loadImage("img/bg2.png");  
  enemy=loadImage("img/enemy.png");  
  fighter=loadImage("img/fighter.png");  
  hp=loadImage("img/hp.png");  
  treasure=loadImage("img/treasure.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");

  eX = 0; //enenmy
  eY = floor(random(50,430));
  eSpacing = 70;
  eNum = 5;
  eMid = floor(eNum/2);
   
  tX = floor(random(50,590)); //treasure
  tY = floor(random(50,430));
  
  fX = floor(589); //fighter
  fY = floor(height/2);
  
  blood = floor(200*0.2); //hp blood start from 20%

  speedF = 5;
  speedxE = 3;
  speedyE = 1;

  
  gameState = START;
  eState = 0;
}

void draw() {
  //START
  switch(gameState){
    //start/////////////////////////////////
    case START:
      image(start2,0,0);
      if(mouseX>210 && mouseX<443){
        if(mouseY>378 && mouseY<412){
           image (start1 ,0,0);
           if(mousePressed){
             gameState = PLAYING; //change gameState when mousePressed
           }
        }
      }
    break;
    
    //playing//////////////////////////////
    case PLAYING:
      //background
      image(bg1,x,0);   
      image(bg2,-640+x,0);   
      image(bg1,-1280+x,0);   
      x++; x%=1280;
      
    //enemy
       switch(eState){
       case 0:
         eY = (eRandom == true) ? random(0, height-eSpacing*eNum): eY ;
         eRandom = false;
         for(int i = 0; i<eNum; i++){         
           image(enemy,eX-eSpacing*i,eY);
         }
         break;
       case 1:
         eY = (eRandom == true) ? random(0, height-eSpacing*eNum): eY ;
         eRandom = false;
         for(int i = 0; i<eNum; i++){         
           image(enemy,eX-eSpacing*i,eY+eSpacing*i);
         }
         break;
       case 2:
         eY = (eRandom == true) ? random(0+eSpacing*floor(eNum/2), height-eSpacing*ceil(eNum/2)): eY ;
         eRandom = false;
         for(int i = 0; i<eNum; i++){         
          image(enemy,eX-eSpacing*i,eY-eSpacing*(eMid-abs(i-eMid))); //upperEnemy
          image(enemy,eX-eSpacing*i,eY+eSpacing*(eMid-abs(i-eMid))); //lowerEnemy
         }
         break;
       }
       eX += speedxE;
       if(eX-eSpacing*(eNum-1)>=width){
         eRandom = true;
         eX%=width+eSpacing*(eNum-1);
         eState++;
         eState %= 3;
       }
      //treasure
       image(treasure,tX,tY);
       
      //fighter
       image(fighter,fX,fY);
      
      //hp
       fill(255,0,0);
       rectMode(CORNER);
       rect(15,10,blood,30);
       image(hp,10,10);
       //hp detection
       if(blood<0){
        blood = 0;   
       }
       
       
      //fighterMove
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
      //boundry detection
     if(fY <= 0){
        fY = 0;
      } 
      if(fY >= height-FIGHTER_W){
        fY = height-FIGHTER_W;
      }
      if(fX <= 0){
        fX = 0;
      }
      if(fX >= width-FIGHTER_W){
        fX = width-FIGHTER_W;
      }
     
      //treasure detection
      if(fX>tX-50 && fX<tX+50){
        if(fY>tY-50 && fY<tY+50){
          if(blood<190){
           blood += 0.1*200;
         }
          tX = floor(random(50,590)); 
          tY = floor(random(50,430));
        }
      }
      break;

   //game over///////////////////////// 
   case GAME_OVER:
     image(end2,0,0);
     if(mouseX>210 && mouseX<443){
        if(mouseY>311 && mouseY<343){
           image (end1,0,0);
           if(mousePressed){
             gameState = PLAYING; //change gameState when mousePressed
           }
        }
      }
     break;
  }
}
void keyPressed(){
  if (key == CODED) {  
        switch (keyCode) {
          case UP:
            upPressed = true;
            break;
          case DOWN:
            downPressed = true;
            break;
          case LEFT:
            leftPressed = true;
            break;
          case RIGHT:
            rightPressed = true;
            break;
        }
      }
}
void keyReleased(){
 if (key == CODED) {
        switch (keyCode) {
          case UP:
            upPressed = false;
            break;
          case DOWN:
            downPressed = false;
            break;
          case LEFT:
            leftPressed = false;
            break;
          case RIGHT:
            rightPressed = false;
            break;
        }
      }
}