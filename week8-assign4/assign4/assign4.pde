PImage bg1,bg2,enemy,fighter,hp,treasure,start1,start2,end1,end2;

// flame
int numFrames = 5;
int currentFrame;
int f = 0;
PImage[] flame = new PImage[numFrames];

int bulletLimit = 5;
int bulletNum = 0;
int bSpeed = 5;
int [] bX = new int [bulletLimit];
int [] bY = new int [bulletLimit];
PImage[] bullet = new PImage[bulletLimit];


int x,eX,eSpacing,eMid,tX,tY,fX,fY,blood,speedF,speedxE,speedyE;
float eY,eNum,flameX,flameY;
final int FIGHTER_W = 51;
final int FIGHTER_H = 51;
final int ENEMY_W = 51;
final int ENEMY_H = 51;
final int BULLET_W = 31;
final int BULLET_H = 27;
final int START=0;
final int PLAYING=1;
final int GAME_OVER=2;
final int STRAIGHT = 0; 
final int SLASH = 1; 
final int DAIMOND = 2; //enemyState
int gameState,eState;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean eYRandom = true;
boolean eRefill = true;
boolean eNextState = true;
boolean flameDetected = false;
boolean shoot = false;



//enemyArray
float [][] eStraight ;
float [][] eSlash ;
float [][] eDaimond ;

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
  for (int i=0; i<numFrames; i++){
    flame[i] = loadImage("img/flame"+(i+1)+".png");
  }
  for (int i=0; i<bulletLimit; i++){
    bullet[i] = loadImage("img/shoot.png");
  }
  
  eX = 0; //enenmy
  eY = floor(random(50,430));
  eSpacing = 70;
  eNum = 5;
  eMid = floor(eNum/2);
  eStraight = new float [int(eNum)][2] ;
  eSlash = new float [int(eNum)][2] ;
  eDaimond = new float [int(eNum)][4] ;

   
  tX = floor(random(50,590)); //treasure
  tY = floor(random(50,430));
  
  fX = floor(589); //fighter
  fY = floor(height/2);
  
  blood = floor(200*0.2); //hp blood start from 20%

  speedF = 5;
  speedxE = 3;
  speedyE = 1;
  
  bulletNum = 0; //bullet num on the screen
  bulletLimit = 5; //max num of bullet 
  for (int i=0; i<bulletLimit; i++){
    bX[i] = -width;
  }
  
  gameState = START;
  eState = 0;
  
  currentFrame = 0;
  frameRate(60);
  
}

void draw() {
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
       //<>//
    switch(eState){
         
       case STRAIGHT:
       //eY Random
         eY = (eYRandom == true) ? random(0, height-eSpacing) : eY ;
         eYRandom = false;
         eX%=width+eSpacing*(eNum-1);
       //refill enemy element
       if(eRefill == true){
             for(int i = 0; i<eNum; i++){  
               eStraight[i][0]= eSpacing*i;
               eStraight[i][1]= eY;
             }
             eRefill = false;
       }
       
       //show the enemy //<>//
         for(int i = 0; i<eNum; i++){
         image(enemy,eX-eStraight[i][0],eStraight[i][1]);
       //enemy detection
            if(fX>(eX-eStraight[i][0])-50 && fX<(eX-eStraight[i][0])+50){
              if(fY>eStraight[i][1]-50 && fY<eStraight[i][1]+50){
                if(blood>0.2*200){
                 blood -= 0.2*200;
                 flameDetected = true;
                 flameX = eX-eStraight[i][0];
                 flameY = eStraight[i][1];
                 eStraight[i][0] = 10*eX;
                 eStraight[i][1] = -10*eY;
               }else{
                 gameState = GAME_OVER; //change gameState when mousePressed         
               }
              }
            }
            for(int b = 0; b < bulletLimit; b++){
              if(bX[b]+BULLET_W>(eX-eStraight[i][0]) && bX[b]<(eX-eStraight[i][0])+50){
                if(bY[b]+BULLET_H>eStraight[i][1] && bY[b]<eStraight[i][1]+50){
                  flameDetected = true;
                  flameX = eX-eStraight[i][0];
                  flameY = eStraight[i][1];
                  eStraight[i][0] = 10*eX;
                  eStraight[i][1] = -10*eY;
                  bX[b] = -width;
                }
              }
            }
         }
         
         break;
         
       case SLASH:
       //eY Random
         eY = (eYRandom == true) ? random(0, height-eSpacing*eNum): eY ;
         eYRandom = false;
         eX%=width+eSpacing*(eNum-1);
         
       //refill enemy element
       if(eRefill == true){
             for(int i = 0; i<eNum; i++){   
               eSlash[i][0]= eSpacing*i;
               eSlash[i][1]= eSpacing*i;
             }
             eRefill = false;
       }
       
       //show the enemy
         for(int i = 0; i<eNum; i++){
         image(enemy,eX-eSlash[i][0],eY+eSlash[i][1]);
         
       //enemy detection
         if(fX>(eX-eSlash[i][0])-50 && fX<(eX-eSlash[i][0])+50){
              if(fY>(eY+eSlash[i][1])-50 && fY<(eY+eSlash[i][1])+50){
                if(blood>0.2*200){
                 flameDetected = true;
                 flameX = eX-eSlash[i][0];
                 flameY = eY+eSlash[i][1];
                 blood -= 0.2*200;
                 eSlash[i][0] = 10*eX;
                 eSlash[i][1] = -10*eY;
                 flameDetected = true;
               }else{
                 gameState = GAME_OVER; //change gameState when mousePressed         
               }
              }
            }
             for(int b = 0; b < bulletLimit; b++){
              if(bX[b]+BULLET_W>(eX-eSlash[i][0]) && bX[b]<(eX-eSlash[i][0])+50){
                if(bY[b]+BULLET_H>(eY+eSlash[i][1]) && bY[b]<(eY+eSlash[i][1])+50){
                  flameDetected = true;
                  flameX = eX-eSlash[i][0];
                  flameY = eY+eSlash[i][1];
                  eSlash[i][0] = 10*eX;
                  eSlash[i][1] = -10*eY;
                  bX[b] = -width;
                }
              }
            }
         }
         break;
         
       case DAIMOND:
       //eY Random
         eY = (eYRandom == true) ? random(0+eSpacing*floor(eNum/2), height-eSpacing*ceil(eNum/2.0)): eY ;
         eYRandom = false;
         eX%=width+eSpacing*(eNum-1);
         
       //refill enemy element
       if(eRefill == true){
         for(int i = 0; i<eNum; i++){
                 if( i == 0||i == eNum-1){
                   eDaimond[i][0]= eSpacing*i;
                   eDaimond[i][1]= eSpacing*(eMid-abs(i-eMid));
                 }else{
                   eDaimond[i][0]= eSpacing*i;
                   eDaimond[i][1]= eSpacing*(eMid-abs(i-eMid));//upperEnemy
                   eDaimond[i][2]= eSpacing*i;
                   eDaimond[i][3]= eSpacing*(eMid-abs(i-eMid));//lowerEnemy
                 }
         }
         eRefill = false;
       }
       //eY Random
         eY = (eYRandom == true) ? random(0+eSpacing*floor(eNum/2), height-eSpacing*ceil(eNum/2)): eY ;
         eYRandom = false;
         eX%=width+eSpacing*(eNum-1);
         
       //show the enemy
       for(int i = 0; i<eNum; i+=4){
        image(enemy,eX-eDaimond[i][0],eY-eDaimond[i][1]); //upperEnemy
        if(fX>(eX-eDaimond[i][0])-50 && fX<(eX-eDaimond[i][0])+50){
              if(fY>(eY-eDaimond[i][1])-50 && fY<(eY-eDaimond[i][1])+50){
                if(blood>0.2*200){
                  flameDetected = true;
                  flameX = eX-eDaimond[i][0];
                  flameY = eY-eDaimond[i][1];
                 blood -= 0.2*200;
                 eDaimond[i][0] = 10*eX;
                 eDaimond[i][1] = 10*eY;
                 flameDetected = true;
               }else{
                 gameState = GAME_OVER; //change gameState when mousePressed         
               }
              }
            }
            for(int b = 0; b < bulletLimit; b++){
              if(bX[b]+BULLET_W>(eX-eDaimond[i][0]) && bX[b]<(eX-eDaimond[i][0])+50){
                if(bY[b]+BULLET_H>(eY-eDaimond[i][1]) && bY[b]<(eY-eDaimond[i][1])+50){
                  flameDetected = true;
                  flameX = eX-eDaimond[i][0];
                  flameY = eY-eDaimond[i][1];
                  eDaimond[i][0] = 10*eX;
                  eDaimond[i][1] = 10*eY;
                  bX[b] = -width;
                }
              }
            }
       }
         for(int i = 1; i<eNum-1; i++){
            image(enemy,eX-eDaimond[i][0],eY-eDaimond[i][1]); //upperEnemy
            image(enemy,eX-eDaimond[i][2],eY+eDaimond[i][3]); //lowerEnemy
       //enemy detection
            if(fX>(eX-eDaimond[i][0])-50 && fX<(eX-eDaimond[i][0])+50){
              if(fY>(eY-eDaimond[i][1])-50 && fY<(eY-eDaimond[i][1])+50){
                if(blood>0.2*200){
                  flameDetected = true;
                  flameX = eX-eDaimond[i][0];
                  flameY = eY-eDaimond[i][1];
                 blood -= 0.2*200;
                 eDaimond[i][0] = 10*eX;
                 eDaimond[i][1] = 10*eY;
                 flameDetected = true;
               }else{
                 gameState = GAME_OVER; //change gameState when mousePressed         
               }
              }
            }
            for(int b = 0; b < bulletLimit; b++){
              if(bX[b]+BULLET_W>(eX-eDaimond[i][0]) && bX[b]<(eX-eDaimond[i][0])+50){
                if(bY[b]+BULLET_H>(eY-eDaimond[i][1]) && bY[b]<(eY-eDaimond[i][1])+50){
                  flameDetected = true;
                  flameX = eX-eDaimond[i][0];
                  flameY = eY-eDaimond[i][1];
                  eDaimond[i][0] = 10*eX;
                  eDaimond[i][1] = 10*eY;
                  bX[b] = -width;
                }
              }
            }
            if(fX>(eX-eDaimond[i][2])-50 && fX<(eX-eDaimond[i][2])+50){
              if(fY>(eY+eDaimond[i][3])-50 && fY<(eY+eDaimond[i][3])+50){
                if(blood>0.2*200){
                  flameDetected = true;
                  flameX = eX-eDaimond[i][2];
                  flameY = eY+eDaimond[i][3];
                 blood -= 0.2*200;
                 eDaimond[i][2] = 10*eX;
                 eDaimond[i][3] = -10*eY;
                 flameDetected = true;
               }else{
                 gameState = GAME_OVER; //change gameState when mousePressed         
               }
              }
            }
            for(int b = 0; b < bulletLimit; b++){
              if(bX[b]+BULLET_W>(eX-eDaimond[i][2]) && bX[b]<(eX-eDaimond[i][2])+50){
                if(bY[b]+BULLET_H>(eY+eDaimond[i][3]) && bY[b]<(eY+eDaimond[i][3])+50){
                  flameDetected = true;
                  flameX = eX-eDaimond[i][2];
                  flameY = eY+eDaimond[i][3];
                  eDaimond[i][2] = 10*eX;
                  eDaimond[i][3] = -10*eY;
                  bX[b] = -width;
                }
              }
            }
           
         }
         break;
       }
       
       eX += speedxE;
       
       if(eX-eSpacing*(eNum-1)>=width){
         eYRandom = true;
         eState++;
         eState %= 3;
         eRefill = true;
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
      //flame
      if(flameDetected == true){
        image(flame[f], flameX, flameY);
           if (frameCount % (60/10)==0){
              currentFrame++;
              f = currentFrame % numFrames;
              if(f==0){flameDetected=false;}
           }
      }
      
      //shoot bullet
      if(shoot == true){
        for(int i = bulletLimit-1; i>-1; i--){
          if(bX[i] <= 0){
            bulletNum = i;
          }
        }
        bX[bulletNum] = fX-BULLET_W;
        bY[bulletNum] = fY+(FIGHTER_H-BULLET_H)/2;
        shoot = false;
      }
      
      for(int i=0; i<bulletLimit; i++){
        image(bullet[i],bX[i],bY[i]);
        bX[i] -= bSpeed;
        if(bX[i]<0){
          bX[i] = -width;
        }
      }
      
     
      
      
      

      break;
                        

   //game over///////////////////////// 
   case GAME_OVER:
     image(end2,0,0);
     eRefill = true;
     if(mouseX>210 && mouseX<443){
        if(mouseY>311 && mouseY<343){
           image (end1,0,0);
           if(mousePressed){
             gameState = PLAYING; //change gameState when mousePressed
             eState = 0;
             eX = 0; //enenmy
             eY = floor(random(50,430));
             eYRandom = true;
             fX = width-FIGHTER_W;
             fY = height/2-FIGHTER_H/2;
             blood = floor(200*0.2);
             flameDetected = false;
             for (int i=0; i<bulletLimit; i++){
               bX[i] = -width;
             }
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
  if(key == ' '){
    int ok = 0;
    for(int i = bulletLimit-1; i>-1; i--){
      if(bX[i] <= 0){
      ok ++;
      }
    }
    if(ok>0){ 
    shoot = true;
    
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