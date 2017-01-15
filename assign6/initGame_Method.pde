void initGame(){
  enemy = new Enemy();
  enemy.eState = 0;
  enemy.addEnemy(enemy.eState);
  
  fighter.fX = width-FIGHTER_W;
  fighter.fY = height/2-FIGHTER_H/2;
  fighter.hp = floor(200*0.2);
  treasure.tX = floor(random(50,590));
  treasure.tY = floor(random(50,430));
  score = 0;
  flame.flameDetected = false;
  shoot = false;
  bulletArray.bulletNum = 0;
  for (int i=0; i<bulletArray.bulletLimit; i++){
    bulletArray.bX[i] = -1;
    bulletArray.bY[i] = -1;
  }
}