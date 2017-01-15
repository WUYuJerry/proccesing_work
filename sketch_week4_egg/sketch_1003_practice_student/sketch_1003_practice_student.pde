PImage bgImg, basket, egg1, egg2, breakEgg1, breakEgg2;
boolean isPlaying;
final int EGG_W = 35;
final int EGG_H = 45;
final int EGG_MIN_X = 25;
final int EGG_MAX_X = 225; 
final int BASKET_W = 100;
final int BASKET_H = 100;
final int BASKET_Y = 310;
final int BASKET_BOUND = 10;
final int BREAKEGG_W = 70;
final int BREAKEGG_H = 70;
final int GROUND_Y = 430;

int eggX1, eggY1, eggX2, eggY2, eggDrop;
boolean EGG1, EGG2;


void setup(){
  size(350, 500);
  bgImg = loadImage("bgImg.png");
  basket = loadImage("basket.png");
  egg1 = loadImage("egg.png");
  egg2 = loadImage("egg.png");
  breakEgg1 = loadImage("breakEgg.png");
  breakEgg2 = loadImage("breakEgg.png");
  isPlaying = true;
  eggX1 = floor(random(EGG_MIN_X,EGG_MAX_X));
  eggX2 = floor(random(EGG_MIN_X,EGG_MAX_X));
  eggY1 = 0;
  eggY2 = -150;
  eggDrop = floor(random(2,4));
  EGG1=true;
  EGG2=true;
}

void draw() {
  
  if(isPlaying) {
    
    image(bgImg, 0, 0, 350, 500);
    if(EGG1==true){
      image(egg1, eggX1 ,eggY1, EGG_W, EGG_H);
    }
    if(EGG2==true){
      image(egg2, eggX2 ,eggY2, EGG_W, EGG_H);
    }
    image(basket, mouseX-BASKET_W*0.5, 310, 100, 100);
   



    //Egg1 Has Broken
    if(EGG1==false){
       image(breakEgg1, eggX1 ,430, 70, 70);
    }
    
    
    //Egg2 Has Broken
    if(EGG2==false){
       image(breakEgg2, eggX2 ,430, 70, 70);
    }
    
    //Game Over
    if(EGG1==false && EGG2==false){
      isPlaying = false;
    }

    //Eggs Drop
     eggY1+=eggDrop;
     eggY2+=eggDrop;

   
    //Control Basket Movement
  
    
    //Condition: Egg1 is Catched or Not
   if(EGG1==true){
   if(eggY1>=310+1/2*BASKET_H){
     if(eggX1>mouseX-BASKET_W*0.5+BASKET_BOUND && eggX1<mouseX+BASKET_W*0.5-BASKET_BOUND){
      //isPlaying = false;
      eggX1 = floor(random(EGG_MIN_X,EGG_MAX_X));
      eggY1 = 0;
     }else{
     EGG1 = false;
     }
   }
   }

    //Condition: Egg2 is Catched or Not
    if(EGG2==true){
    if(eggY2>=310+1/2*BASKET_H){
     if(eggX2>mouseX-BASKET_W*0.5+BASKET_BOUND && eggX2<mouseX+BASKET_W*0.5-BASKET_BOUND){
      //isPlaying = false;
      eggX2 = floor(random(EGG_MIN_X,EGG_MAX_X));
      eggY2 = 0;
     }else{
     EGG2 = false;
     }
   }
   }
    
  }
}

void mouseClicked(){
  if(!isPlaying){
    isPlaying = true;
    EGG1 = true;
    EGG2 = true;
    eggX1 = floor(random(EGG_MIN_X,EGG_MAX_X));
    eggX2 = floor(random(EGG_MIN_X,EGG_MAX_X));
    eggY1 = 0;
    eggY2 = -150;
  }
}