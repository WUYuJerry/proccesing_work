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
    for(int i = bulletLimit-1; i>-1; i--){
      if(bX[i] <= 0){
        shoot = true;
        bulletNum = i;
      }
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

void move(){
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
}

      