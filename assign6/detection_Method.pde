boolean isHit(int object1X, int object1Y, int object1W, int object1H, int object2X, int object2Y, float object2W, float object2H){
  if(object1X+object1W > object2X && object1X < object2X+object2W){
    if(object1Y+object1H > object2Y && object1Y < object2Y+object2H){
      return true;
    }
  }
  return false;
}

int closestEnemy(int x, int y){
  float distance = 100000;
  int eIndex = -1;  
  for (int i = 0; i < enemy.enemyCount; i++) {
    if (enemy.enemyX[i]+ENEMY_W >= 0 && enemy.enemyX[i]-ENEMY_W <= width && enemy.enemyY[i]-ENEMY_H >= 0 && enemy.enemyY[i]+ENEMY_H <= height) {
      if(dist(x,y,enemy.enemyX[i],enemy.enemyY[i]) < distance){
        eIndex = i;
      }
      if(x < enemy.enemyX[i]){
        eIndex = -1;
      }
    }
  }
  return eIndex;
}

int boundryDetectionX(int objectX, int objectW){
  if(objectX <= 0){
    objectX = 0;
  }
  if(objectX >= width-objectW){
    objectX = width-objectW;
  }
  return objectX;
}

int boundryDetectionY(int objectY, int objectH){
  if(objectY <= 0){
    objectY = 0;
  } 
  if(objectY >= height-objectH){
    objectY = height-objectH;
  }
  return objectY;
}