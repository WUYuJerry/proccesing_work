PImage bg1,bg2,start1,start2,end1,end2;
PFont scoreFont;

// flame
FlameManager flame;

int x,speedF,score;
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
int gameState;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean shoot = false;

//enemyArray
Enemy  enemy ;



//Fighter
Fighter fighter;

//Treasure
Treasure treasure;

//HPBar
HPBar hpBar;

//Bullet 
Bullet bulletArray;



void setup () {
  size(640,480) ;  
  bg1=loadImage("img/bg1.png");  
  bg2=loadImage("img/bg2.png");  
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  gameState = START;
  
  //Fighter
  fighter = new Fighter();
  
  //Enemy
  enemy = new Enemy();
  
  
  //Treasure
  treasure = new Treasure();
  
  //HPBar
  hpBar = new HPBar(15,10);
  
  //FlameManager
  flame = new FlameManager();
  
  //Bullet
  bulletArray = new Bullet();
  
  //bulletLimit = 5; //max num of bullet 

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
      enemy.display();
      enemy.move();
      enemy.changeEState();
      
 //<>//
      //treasure
      treasure.display();
       
      //fighter
      fighter.display();
      fighter.move();
       
      
      //hp
       hpBar.display(fighter.hp);
       if(fighter.hp <= 0){
         gameState = GAME_OVER;
       }
      
      //boundry detection
      fighter.fY = boundryDetectionY(fighter.fY,FIGHTER_H);
      fighter.fX = boundryDetectionX(fighter.fX,FIGHTER_W);

      //flame
      flame.display();
      
      //shoot bullet
      bulletArray.display();
      for(int i=0; i<bulletArray.bulletLimit; i++){
        if(bulletArray.bX[i] != -1 || bulletArray.bY[i] != -1){
          bulletArray.display(i);
          bulletArray.move(i);

          int chasingIndex = closestEnemy(bulletArray.bX[i],bulletArray.bY[i]);
          if(chasingIndex>=0){
            if(bulletArray.bY[i] < enemy.enemyY[chasingIndex]){
              bulletArray.bY[i] += bulletArray.bYSpeed; 
            }else{
              bulletArray.bY[i] -= bulletArray.bYSpeed;
            }
          }
          
          if(bulletArray.bX[i]<0){
            bulletArray.bX[i] = -1;
            bulletArray.bY[i] = -1;
          }
          
        // bullet vs enemy
         if(bulletArray.bX[i] != -1 || bulletArray.bY[i] != -1){
          for (int j = 0; j < enemy.enemyCount; j++) {
            if (enemy.enemyX[j] != -1 || enemy.enemyY[j] != -1) {
              if(isHit(bulletArray.bX[i], bulletArray.bY[i], BULLET_W, BULLET_H, enemy.enemyX[j], enemy.enemyY[j], ENEMY_W, ENEMY_H)){
                flame.flameDetected = true;
                flame.flameX = bulletArray.bX[i];
                flame.flameY = bulletArray.bY[i];
                bulletArray.bX[i] = -1;
                bulletArray.bY[i] = -1;
                enemy.enemyX[j] = -1;
                enemy.enemyY[j] = -1;
                scoreChange(20);
              }
            }
          }
         }
        }
      }
      //treasure vs fighter
      if(isHit(fighter.fX, fighter.fY, FIGHTER_W, FIGHTER_H, treasure.tX, treasure.tY, TREASURE_W*(1+treasure.size),TREASURE_H*(1+treasure.size))){
          if(treasure.size==0){
            fighter.hp += 10;
          }else if(treasure.size==0.4){
            fighter.hp += 20;
          }
          if(fighter.hp > 200){
            fighter.hp = 200;
          }
          treasure = new Treasure();
          treasure.tX = floor(random(50,590)); 
          treasure.tY = floor(random(50,430));
      }
      //fighter vs enemy
      for (int i = 0; i < enemy.enemyCount; i++) {
        if (enemy.enemyX[i] != -1 || enemy.enemyY[i] != -1) {
          if(isHit(fighter.fX, fighter.fY, FIGHTER_W, FIGHTER_H, enemy.enemyX[i], enemy.enemyY[i], ENEMY_W, ENEMY_H)){
             fighter.hp -= 200*0.2;
             enemy.enemyX[i] = -1;
             enemy.enemyY[i] = -1;
             flame.flameDetected = true;
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