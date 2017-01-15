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
    for(int i = bulletArray.bulletLimit-1; i>-1; i--){
      if(bulletArray.bX[i] <= 0){
        shoot = true;
        bulletArray.bulletNum = i;
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



      