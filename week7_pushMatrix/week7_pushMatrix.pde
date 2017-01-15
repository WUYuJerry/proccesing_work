size(350,350);
background(0);

for( int i = 10; i<width; i = i+50){
  pushMatrix(); //<>//
  translate(i,100);
  triangle(15,0,0,15,30,15);
  popMatrix();
}