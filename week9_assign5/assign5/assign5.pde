PImage bg1,bg2,enemy,fighter,hp,treasure,start1,start2,end1,end2;
PFont scoreFont;

// flame
int numFrames = 5;
int currentFrame;
int f = 0;
PImage[] flame = new PImage[numFrames];

int bulletLimit = 5;
int bulletNum = 0;
int bXSpeed = 5;
int bYSpeed = 2;
int [] bX = new int [bulletLimit];
int [] bY = new int [bulletLimit];
PImage[] bullet = new PImage[bulletLimit];


int x,eX,tX,tY,fX,fY,blood,speedF,speedxE,speedyE,score;
float eY,eNum,flameX,flameY;
final int FIGHTER_W = 51;
final int FIGHTER_H = 51;
final int ENEMY_W = 51;
final int ENEMY_H = 51;
final int TREASURE_W = 51;
final int TREASURE_H = 51;
final int BULLET_W = 31;
final int BULLET_H = 27;
final int START=0;
final int PLAYING=1;
final int GAME_OVER=2;
int gameState,eState;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean flameDetected = false;
boolean shoot = false;

//enemyArray
int enemyCount = 8;
int[] enemyX = new int[enemyCount];
int[] enemyY = new int[enemyCount];

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
  
  gameState = START;
  
  speedF = 5;
  speedxE = 3;
  
  bulletLimit = 5; //max num of bullet 
  
  currentFrame = 0;
  frameRate(60);
  
  scoreFont = createFont("Arial",24); 
  
  initGame();
}

void draw() {
  switch(gameState){
    //gamestate_START
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
    
    //gamestate_PLAYING
    case PLAYING:
      //background
      image(bg1,x,0);   
      image(bg2,-640+x,0);   
      image(bg1,-1280+x,0);   
      x++; x%=1280;
      
      //scoreFont
      textFont(scoreFont,30);
      textAlign(CENTER);
      fill(255);
      text("score : "+score,width-100,height-50); 
      
      //enemy_show & change_eState
      for (int i = 0; i < enemyCount; ++i) {
        if (enemyX[i] != -1 || enemyY[i] != -1) {
          image(enemy, enemyX[i], enemyY[i]);
          enemyX[i]+=5;
        }
      }
      changeEState();
 //<>//
      //treasure
       image(treasure,tX,tY);
       
      //fighter
       image(fighter,fX,fY);
      
      //hp
       fill(255,0,0);
       rectMode(CORNER);
       rect(15,10,blood,30);
       image(hp,10,10);
       if(blood <= 0){
         gameState = GAME_OVER;
       }

      //fighterMove
      move();
      
      //boundry detection
      fY = boundryDetectionY(fY,FIGHTER_H);
      fX = boundryDetectionX(fX,FIGHTER_W);

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
        bX[bulletNum] = fX-BULLET_W;
        bY[bulletNum] = fY+(FIGHTER_H-BULLET_H)/2;
        shoot = false;
      }
      
      for(int i=0; i<bulletLimit; i++){
        if(bX[i] != -1 || bY[i] != -1){
          image(bullet[i],bX[i],bY[i]);
          bX[i] -= bXSpeed;

          int chasingIndex = closestEnemy(bX[i],bY[i]);
          if(chasingIndex>=0){
            if(bY[i] < enemyY[chasingIndex]){
              bY[i] += bYSpeed; 
            }else{
              bY[i] -= bYSpeed;
            }
          }
          
          if(bX[i]<0){
            bX[i] = -1;
            bY[i] = -1;
          }
          
        // bullet vs enemy
          for (int j = 0; j < enemyCount; j++) {
            if (enemyX[j] != -1 || enemyY[j] != -1) {
              if(isHit(bX[i], bY[i], BULLET_W, BULLET_H, enemyX[j], enemyY[j], ENEMY_W, ENEMY_H)){
                bX[i] = -1;
                bY[i] = -1;
                enemyX[j] = -1;
                enemyY[j] = -1;
                scoreChange(20);
              }
            }
          }
        }
      }
      //treasure vs fighter
      if(isHit(fX, fY, FIGHTER_W, FIGHTER_H, tX, tY, TREASURE_W,TREASURE_H)){
          if(blood<190){
           blood += 0.1*200;
         }
          tX = floor(random(50,590)); 
          tY = floor(random(50,430));
      }
      //fighter vs enemy
      for (int i = 0; i < enemyCount; i++) {
        if (enemyX[i] != -1 || enemyY[i] != -1) {
          if(isHit(fX, fY, FIGHTER_W, FIGHTER_H, enemyX[i], enemyY[i], ENEMY_W, ENEMY_H)){
             blood -= 200*0.2;
             enemyX[i] = -1;
             enemyY[i] = -1;
          }
        }
      }
      
   break;
   //gamestate_playing_end
                        

   //gameState_game_over
   case GAME_OVER:
     image(end2,0,0);
     if(mouseX>210 && mouseX<443){
        if(mouseY>311 && mouseY<343){
           image (end1,0,0);
           if(mousePressed){
             gameState = PLAYING; //change gameState when mousePressed
             initGame();
           }
        }
      }
    break;
  }
}

void scoreChange(int value){
  score += value;
}