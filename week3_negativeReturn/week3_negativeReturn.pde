int x;

void setup(){
size(500,500);
x=200;
}

void draw(){

background(0);
x = x-1;

x = x % width;

rectMode(CORNERS);
rect(x,height/2,x+100,height/2+100);

if(x+100<0){
  x=width;
}
}