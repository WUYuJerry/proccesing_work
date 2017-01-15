class Boss extends Enemy{
  int shooted;
  PImage bossImg;
  
  Boss(){
    speedxE = 5;
    enemyCount = 5;
    shooted = 0;
    bossImg=loadImage("img/boss.png");
    int h =50 ;
    enemyX = new int[enemyCount];
    enemyY = new int[enemyCount];
    for (int i = 0; i < 5; ++i) {
      enemyX[i] = -bossImg.width;
      enemyY[i] = h+i*enemyImg.height;
    }
  }
  
  void display(){
    //super();
    for (int i = 0; i < enemyCount; ++i) {
      if (enemyX[i] != -1 || enemyY[i] != -1) {
        image(bossImg, enemyX[i], enemyY[i]);
      }
    }
  }
  void move(){
    for (int i = 0; i < enemyCount; ++i) {
      if (enemyX[i] != -1 || enemyY[i] != -1) {
        enemyX[i]+=2;
      }
    }
  }
  
  //void addBoss()
  //{
  //  println("addBoss");
  //  int h = 50;
  //  for (int i = 0; i < 5; ++i) {
  //    enemyX[i] = 80;
  //    enemyY[i] = h+i*enemy.height;
  //  }
  //}
  

}