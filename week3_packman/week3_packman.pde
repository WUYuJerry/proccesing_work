int R,x,X,d,q,r,g,b;
int A,B,C,D,E,F,G,H;
PImage bgImg,bgImg2;

void setup(){
size(300,200);
bgImg=loadImage("bg.png");
bgImg2=loadImage("bg.png");   

R=0;
x=0; X=300;

}

void draw(){
image(bgImg,x,0); 
x--;
image(bgImg,X,0); 
X--;
if(x<-300){
  x=300;
}
if(X<-300){
  X=300;
}

//ball
r=floor(random(256));
g=floor(random(256));
b=floor(random(256));
fill(r,g,b);


A--;
A%=50;
ellipse(100+A,100,10,10);

ellipse(150+A,100,10,10);

ellipse(200+A,100,10,10);

ellipse(250+A,100,10,10);

ellipse(300+A,100,10,10);

ellipse(350+A,100,10,10);

ellipse(400+A,100,10,10);

ellipse(450+A,100,10,10);

//packmon
R++; 
if(R>40){
  R=0;
};
fill(255,255,0);
arc(50, 100, 30, 30,radians(40-R),radians(320+R),PIE);





}