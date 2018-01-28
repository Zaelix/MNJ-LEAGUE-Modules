import ddf.minim.*;

PImage knight;
PImage sun;
int[] sunCoords = {-600, -600};
AudioSample win;
AudioSample sad;
boolean isVictorious = false;

void setup(){
  size(1024, 1024);
  knight = loadImage("knight2.jpg");
  sun = loadImage("sun.png");
  sun.resize(512, 512);
  background(knight);
  Minim minim = new Minim(this);
  win = minim.loadSample("sun.mp3");
  sad = minim.loadSample("sad.mp3");
}

void draw(){
  if(mouseX < 100 && mouseY < 100 || isVictorious){
    background(knight);
    rect(490, 190, 50, 50);
  }
  else{
    background(255, 0,0);
  }
  rect(0,0,100,100);
  
  if (mousePressed){
    sunCoords[0] = mouseX; 
    sunCoords[1] = mouseY; 
    checkWin();
  }
  
  image(sun, sunCoords[0]-256, sunCoords[1]-256);
  
  
}

void checkWin(){
  if(sunCoords[0] > 490 && sunCoords[0] < 540 && sunCoords[1] > 190 && sunCoords[1] < 240){
    // Play sound
    isVictorious = true;
    win.trigger();
  }
  else{
    sunCoords[0] = -600; 
    sunCoords[1] = -600; 
    sad.trigger();
  }
}