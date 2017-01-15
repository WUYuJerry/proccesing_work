size(400,800);
//background(0);
println(0.8*height+10);
fill(0);
rectMode(CORNERS);
rect(width/2-45,0.8*height-10,width/2+45,0.8*height+10);
fill(255,0,0);
arc(width/2,0.8*height,100,100,radians(180),radians(360),CHORD);
fill(255);
arc(width/2,0.8*height+5,100,100,radians(0),radians(180),CHORD);

fill(0);
ellipse(width/2,0.8*height+2.5,20,20);
fill(255);
ellipse(width/2,0.8*height+2.5,15,15);
fill(255);
ellipse(width/2,0.8*height+2.5,10,10);
fill(0);

//////////////////////
fill(182,164,102);
ellipse(width/2,0.2*height+150,300,150);

fill(178,123,66);
strokeWeight(2);
arc(width/2,0.2*height,150,150,radians(180),radians(360),OPEN);
arc(width/2,0.2*height+150,150,40,radians(0),radians(180),OPEN);
noStroke();
rect(width/2-75,0.2*height,width/2+75,0.2*height+150);
stroke(0);
line(width/2-75,0.2*height,width/2-75,0.2*height+150);
line(width/2+75,0.2*height,width/2+75,0.2*height+150);


fill(0);

ellipse(width/2-30,0.2*height,10,40);
ellipse(width/2+30,0.2*height,10,40);
fill(255);

ellipse(width/2-30,0.2*height-10,6,15);
ellipse(width/2+30,0.2*height-10,6,15);

fill(207,76,80);
stroke(166,99,62);
ellipse(width/2,0.2*height+50,70,40);
fill(255);
noStroke();
ellipse(width/2-10,0.2*height+40,30,20);