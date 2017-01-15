
int x, y, w, h;
int r, g, b;

void setup(){
  size(1000,1000);
  x = 500;
  y = 100;
  w = 100;
  h = 200;
  
  
}

void draw(){
  background(0);
  r = floor (random(256));
  g = floor (random(256));
  b = floor (random(256));
  x += 5;
  x %= 1000;
  
  
  // roof
  stroke(255);
  fill(100,0,0);
  triangle(x+w/2,y,x,y+h/2,x+w,y+h/2);
  
  //body
  colorMode(RGB);
  fill(r,100,0);
  rectMode(CORNERS);
  rect(x,y+h/2,x+w,y+h);
  
  //door
  stroke(0);
  rectMode(CORNERS);
  rect(x+3.0/5*w,y+3.5/5*h,x+425.0/500*w,y+h);
  
  //chimney
  colorMode(RGB);
  fill(0,100,100);
  quad(x+300.0/500*w,y+50.0/500*h,x+300.0/500*w,y+25.0/500*h,x+375.0/500*w,y+25.0/500*h,x+375.0/500.0*w,y+125.0/500*h);
  
  //windows
  stroke(255);
  line(x+100.0/500*w,y+300.0/500*h,x+100.0/500*w,y+450.0/500*h);
  line(x+100.0/500*w,y+300.0/500*h,x+200.0/500*w,y+300.0/500*h);
  line(x+200.0/500*w,y+450.0/500*h,x+200.0/500*w,y+300.0/500*h);
  line(x+200.0/500*w,y+450.0/500*h,x+100.0/500*w,y+450.0/500*h);
  
  line(x+150.0/500*w,y+300.0/500*h,x+150.0/500*w,y+450.0/500*h);
  line(x+100.0/500*w,y+350.0/500*h,x+200.0/500*w,y+350.0/500*h);
  line(x+100.0/500*w,y+400.0/500*h,x+200.0/500*w,y+400.0/500*h);
  
  //doorknob
  colorMode(RGB);
  fill(50,5,100);
  ellipse(x+320.0/500*w,y+420.0/500*h,20.0/500*w,20.0/500*w);
  ellipse(x+320.0/500*w,y+420.0/500*h,15.0/500*w,15.0/500*w);
}