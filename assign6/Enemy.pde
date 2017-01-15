class Enemy{
  int speedxE,speedyE,enemyCount;
  int[] enemyX ;
  int[] enemyY ;
  float eY,eNum;
  int eState;
  PImage enemyImg;
  
  Enemy(){
    speedxE = 5;
    enemyCount = 8;
    enemyImg=loadImage("img/enemy.png");  
    enemyX = new int[enemyCount];
    enemyY = new int[enemyCount];
  }
  
  void display(){
    for (int i = 0; i < enemyCount; ++i) {
      if (enemyX[i] != -1 || enemyY[i] != -1) {
        image(enemyImg, enemyX[i], enemyY[i]);
      }
    }
  }
  void move(){
    for (int i = 0; i < enemyCount; ++i) {
      if (enemyX[i] != -1 || enemyY[i] != -1) {
        enemyX[i]+=speedxE;
      }
    }
  }

  // 0 - straight, 1-slope, 2-dimond 3-Boss
  void addEnemy(int type){  
    for (int i = 0; i < enemyCount; ++i) {
      enemyX[i] = -1;
      enemyY[i] = -1;
    }
    switch (type) {
      case 0:
        addStraightEnemy();
        break;
      case 1:
        addSlopeEnemy();
        break;
      case 2:
        addDiamondEnemy();
        break;
      case 3:
      println("case3");
      addBoss();
      break;
    }
  }
  
  void addBoss()
  {
    println("addBoss");
    enemy = new Boss();
    
  }
  void addStraightEnemy()
  {
    float t = random(height - enemyImg.height);
    int h = int(t);
    for (int i = 0; i < 5; ++i) {
      enemyX[i] = (i+1)*-80;
      enemyY[i] = h;
    }
  }
  void addSlopeEnemy()
  {
    
    float t = random(height - enemyImg.height * 5);
    int h = int(t);
    for (int i = 0; i < 5; ++i) {
      enemyX[i] = (i+1)*-80;
      enemyY[i] = h + i * 40;
    }
  }
  void addDiamondEnemy()
  {
    float t = random( enemyImg.height * 3 ,height - enemyImg.height * 3);
    int h = int(t);
    int x_axis = 1;
    for (int i = 0; i < 8; ++i) {
      if (i == 0 || i == 7) {
        enemyX[i] = x_axis*-80;
        enemyY[i] = h;
        x_axis++;
      }
      else if (i == 1 || i == 5){
        enemyX[i] = x_axis*-80;
        enemyY[i] = h + 1 * 40;
        enemyX[i+1] = x_axis*-80;
        enemyY[i+1] = h - 1 * 40;
        i++;
        x_axis++;  
      }
      else {
        enemyX[i] = x_axis*-80;
        enemyY[i] = h + 2 * 40;
        enemyX[i+1] = x_axis*-80;
        enemyY[i+1] = h - 2 * 40;
        i++;
        x_axis++;
      }
    }
  }
  
  void changeEState(){
    boolean allOut = true;
    for (int i = 0; i < enemyCount; ++i) {
      if (enemyX[i] != -1 || enemyY[i] != -1) {
        if(enemyX[i]<width && enemyX[i]>=(i+1)*-80){
          allOut = false;
        }
      }    
    }
    if(allOut){      
      eState++;
      eState %= 4;
      println(eState);
      addEnemy(eState);
    }
  }

}