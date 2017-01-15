void initGame(){
  addEnemy(0);
  eState = 0;
  fX = width-FIGHTER_W;
  fY = height/2-FIGHTER_H/2;
  tX = floor(random(50,590));
  tY = floor(random(50,430));
  blood = floor(200*0.2);
  score = 0;
  flameDetected = false;
  shoot = false;
  bulletNum = 0;
  for (int i=0; i<bulletLimit; i++){
  bX[i] = -1;
  bY[i] = -1;
  }
}