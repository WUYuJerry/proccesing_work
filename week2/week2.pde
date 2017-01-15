
//int x, y, w, h;
int r, g, b;
float s, u; //suun
float d, o, w; //shadow

void setup(){
  size(500,600);
  colorMode(HSB,360,100,100);

  //x = 500;
  //y = 100;
  //w = 100;
  //h = 200;
  
  s = 50;
  u = 50;
  
  d = 150; //left x
  o = 450; //right x
  w = 550; //y
  
  
}

void draw(){
  background(197,48,39);
  r = floor (random(256));
  g = floor (random(256));
  b = floor (random(256));
  
  d = d+0.5;
  o = o+0.5;
  s = s+0.5;

  //x += 1;
  //x %= 1000;
  
  //chimney
  fill(52,90,50);
  //quad(x+300.0/500*w,y+50.0/500*h,x+300.0/500*w,y+25.0/500*h,x+375.0/500*w,y+25.0/500*h,x+375.0/500.0*w,y+125.0/500*h);
    quad(325,150,325,200,375,250,375,150);
    
 // roof
  stroke(20,0,100);
  fill(0,90,80);
  //triangle(x+w/2,y,x,y+h/2,x+w,y+h/2);
    triangle(width/2,100,100,250,400,250);

  //body
  fill(52,50,80);
  rectMode(CORNERS);
  //rect(x,y+h/2,x+w,y+h);
    rect(100,250,400,450);

  
  //door
  stroke(0,0,100);
  rectMode(CORNERS);
  //rect(x+3.0/5*w,y+3.5/5*h,x+425.0/500*w,y+h);
    rect(300,325,375,450);

  
  
  //windows
  stroke(0,0,100);
  //line(x+100.0/500*w,y+300.0/500*h,x+100.0/500*w,y+450.0/500*h);
  //line(x+100.0/500*w,y+300.0/500*h,x+200.0/500*w,y+300.0/500*h);
  //line(x+200.0/500*w,y+450.0/500*h,x+200.0/500*w,y+300.0/500*h);
  //line(x+200.0/500*w,y+450.0/500*h,x+100.0/500*w,y+450.0/500*h);
    rect(125,275,225,350);
  
  //line(x+150.0/500*w,y+300.0/500*h,x+150.0/500*w,y+450.0/500*h);
  //line(x+100.0/500*w,y+350.0/500*h,x+200.0/500*w,y+350.0/500*h);
  //line(x+100.0/500*w,y+400.0/500*h,x+200.0/500*w,y+400.0/500*h);
    line(175,275,175,350);
    line(125,300,225,300);
    line(125,325,225,325);

  //doorknob
  fill(50,5,100);
  //ellipse(x+320.0/500*w,y+420.0/500*h,20.0/500*w,20.0/500*w);
  //ellipse(x+320.0/500*w,y+420.0/500*h,15.0/500*w,15.0/500*w);
    ellipse(320,390,10,10);
    
  //sun
  fill(16,82,93);
  ellipse(s,u,50,50);
  
  //shadow
  fill(23,88,49);
  quad(100,450,400,450,o,w,d,w);
}