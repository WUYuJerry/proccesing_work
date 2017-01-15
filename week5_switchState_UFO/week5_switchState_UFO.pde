final int GO_RIGHT = 0;
final int GO_DOWN = 1;
final int GO_LEFT = 2;
final int GO_UP = 3;

float x, y;
float w, h;
float speed = 5;

int state = GO_RIGHT;

void setup() {
  size(500, 500);
  w = 50;
  h = 30;
  x = w/2;
  y = h/2;
}

void draw() {

  // If the state is 0, move to the right.
  switch (state){
    case GO_RIGHT:
      x += speed;
      // If, while the state is 0, it reaches the right side of the window, change the state to 1
      if (x > width-w/2) {
        x = width-w/2;
        state = 1;
      }
      break;
      
    case GO_DOWN:
      y += speed;
      if (y > height-h/2) {
        y = height-h/2;
        state = 2;
      }
      break;

    case GO_LEFT:
      x -= speed;
      if (x < w/2) {
        x = w/2;
        state = 3;
      }
      break;
    
    case GO_UP:
      y -= speed;
      if (y < h/2) {
        y = h/2;
        state=0;
      }
      break;
  }
  
  background(0);
  // UFO
  fill(151,37,210);
  ellipse(x, y, w, h/2);
  fill(186,0,255);
  stroke(255);
  arc(x, y, h*4/5, h*4/5, PI, TWO_PI);
} 