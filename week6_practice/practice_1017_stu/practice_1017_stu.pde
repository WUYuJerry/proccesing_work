PImage bg, fish, upBadCat, underBadCat, myCat, lose, win, restart;
final int FISH_W = 130;
final int FISH_H = 130;
final int BADCAT_INIT_X = 160;
final int BADCAT_INIT_Y = -140;
final int BADCAT_W = 150;
final int BADCAT_H = 430;
final int SPACE = 220;
final int MYCAT_X = 1080;
final int MYCAT_Y = 280;
final int MYCAT_W = 220;
final int MYCAT_H = 150;
final int RESTART_W = 150;
final int RESTART_H = 150;
int badCatX;


int gameState = 0; 
/**************************
*    0: game is playing   *
*    1: game is lose      *
*    2: game is win       *
***************************/

int fishX, fishY;
float badCatY;
float x_inc = PI/15.0;
float k = 0.0;
float k_inc = PI/15.0;
final float A = 50.0; 


void setup()
{
  size(1280,755);
  bg = loadImage("img/bg.png");
  fish = loadImage("img/fish.png");
  upBadCat = loadImage("img/upBadCat.png");
  underBadCat = loadImage("img/underBadCat.png");  
  myCat = loadImage("img/myCat.png");
  lose = loadImage("img/lose.png");
  win = loadImage("img/win.png");
  restart = loadImage("img/restart.png");
  badCatX = BADCAT_INIT_X; 
}

void draw()
{
  switch(gameState) {
    case 0:
        image(bg, 0, 0, 1280, 755);
        
        //move the fish by mouse 
        fishX = mouseX-FISH_W/2;
        fishY = mouseY-FISH_H/2;
        if(fishX < 0 ){
          fishX = 0;
        } else if(fishX > 1280-FISH_W) {
          fishX = 1280-FISH_W;
        }
        if(fishY < 0) {
          fishY = 0;
        } else if(fishY > 755-FISH_H) {
          fishY = 755-FISH_H;
        }
        image(fish, fishX, fishY,FISH_W, FISH_H);
     
             
        //the badCat robs fish
        k += k_inc;
        for(int i = 0; i < 6; i++) {
          badCatY =  A * sin(x_inc*i+k) + BADCAT_INIT_Y ;
          badCatX = BADCAT_INIT_X+BADCAT_W*i; 
          image(upBadCat,badCatX,badCatY);
          image(underBadCat,badCatX,badCatY+BADCAT_H+SPACE);
          
          if(mouseX+FISH_W*0.5>badCatX && mouseX-FISH_W*0.5<badCatX+BADCAT_W){ //<>//
          if(mouseY-FISH_H*0.5<badCatY+BADCAT_H || mouseY+FISH_H*0.5>badCatY+BADCAT_H+SPACE){
            gameState = 1;
          }
        }
        }
           
        
        
        //if(mouseX+FISH_W*0.5>BADCAT_INIT_X && mouseX-FISH_W*0.5<badCatX+BADCAT_W){
        //  if(mouseY-FISH_H*0.25<badCatY+BADCAT_H || mouseY+FISH_H*0.25>badCatY+BADCAT_H+SPACE){
        //    gameState = 1; //<>//
        //  }
        //}
        //success to feed myCat
        image(myCat, MYCAT_X, MYCAT_Y);
            
      
        /* ... Part II : how to tell "myCat has been fed fish" ...*/
        if(mouseX+FISH_W*0.5>MYCAT_X && mouseY>MYCAT_Y && mouseY<MYCAT_Y+MYCAT_H){
         gameState = 2;
        }
      
            
        break;
  
      case 1:
        image(lose, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
        if(mouseX>0 && mouseX<RESTART_W && mouseY>0 && mouseY<RESTART_H){
            gameState = 0;
          }
        }
        break;
        
      case 2:
        image(win, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          if(mouseX>0 && mouseX<RESTART_W && mouseY>0 && mouseY<RESTART_H){
            gameState = 0;
          }
        }
        break;
        
     default:
        print("error");
        break;
  }
}