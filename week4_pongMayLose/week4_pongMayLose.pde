float ballX, ballY;
float ballSize;
float centerX, centerY;
float paddleW, paddleH;
float rightPaddleX, rightPaddleY;
float leftPaddleX, leftPaddleY;
float speedX, speedY;

boolean isPlaying = false;

//score
int score;
int life;
final int   TOTAL_LIFE = 3;
  
void setup(){
  size(320,200);
  background(255);
  
  centerX = width/2;
  centerY = height/2;
  ballSize = 15;
  ballX = centerX;
  ballY = centerY;
  speedX = random(-5,5);
  speedY = random(-5,5);
  paddleW = 10;
  paddleH = 50;
  rightPaddleX = width-paddleW*2;
  rightPaddleY = centerY-paddleH/2;
  leftPaddleX = paddleW;
  leftPaddleY = centerY-paddleH/2;
  score = 0;
  life = TOTAL_LIFE;
  
  // middle line
  stroke(128);
  line(centerX, 0, centerX, height);
  
  // ball
  noStroke();
  fill(255,0,0);
  ellipse(centerX,centerY,ballSize,ballSize);
  
  // paddles
  fill(0,0,255);
  rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
  rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
}

void draw(){
  if (isPlaying){
    background(255);
  
    // middle line
    stroke(128);
    line(centerX, 0, centerX, height);
    
    // -------- ball
    // move
    ballX += speedX;
    ballY += speedY;
    // boundary detection
    if (ballX < 0 || ballX > width){
      speedX *= -1;
    }
    if (ballY < 0 || ballY > height){
      speedY *= -1;
    }
    
    //paddle detection
    if(ballX>=rightPaddleX ){
      if(rightPaddleY < ballY && ballY < rightPaddleY+paddleH){
        speedX *= -1;
        score += 10;
        println("score " + score);
      }else {
       // isPlaying = false;
       isPlaying = false;
        life--;
        if(life<=0){
          println("GAME OVER");
        }else{
            println("life " + life);
          }
     }
    }
    if(ballX<paddleW*2+ballSize*1/2)
    {
      if( leftPaddleY< ballY && ballY <leftPaddleY+paddleH){
        speedX *= -1;
      }
    }
    // draw
    noStroke();
    fill(255,0,0);
    ellipse(ballX,ballY,ballSize,ballSize);
    // -------- ball
    
    // paddles
    fill(0,0,255);
    // right
    rightPaddleY = mouseY-paddleH/2;
    rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
    // left
    if(leftPaddleY != ballY-paddleH/2){
      if(leftPaddleY<ballY-paddleH/2){
        leftPaddleY += 1;
      }
      else{
        leftPaddleY -= 1;
      }
    }
    rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
  }
}

void keyPressed(){
  isPlaying = true;
  ballX = centerX;
  ballY = centerY;
  speedX = random(-5,5);
  speedY = random(-5,5);
}