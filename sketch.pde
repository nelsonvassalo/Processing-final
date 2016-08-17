import processing.video.*;

Movie movie;

String roundT = "JUSTGOTOWORK";
String letter[] = roundT.split("");
int billCount = 10;
PImage bills[] = new PImage[billCount];
int lim = 12;
float limX = 300;
float limY = 300;
float moveAngle = 0.04;
float initAngle;
int r = 260;
PFont akzidenz;
int indexLetter = 0;
int scene = 1; 



void setup(){
  size(1280, 720);
  background(255,100);
  movie = new Movie(this, "code-720.mov");
  movie.play();
  textSize(42);
  akzidenz = createFont("AkzidenzGrotesk.otf", 42);
  textFont(akzidenz);
}

void draw() {
  if (frameCount < 2166) {
    scene = 1;
  } else {
    scene = 2;
  }
  
  if(scene == 1) {
    image(movie, 0,0);
    if (frameCount % width == 0) {
      background(0);
    }
    fill(255, 255, 0, 255);
    moveAngle -= 0.002;
  
    for(int i = 1; i<indexLetter+1; i++) {
  /*    storePos();
  
  
  */
        initAngle=(PI/6);
                
        text(letter[i-1], width/2 + cos(PI+initAngle*i) * r, height/2 + sin(PI+initAngle*i) * r );
        println(letter[i-1], i-1, i);
    }
  }
  if (scene == 2) {
    createImg();
  }
  println(frameCount);
}
void movieEvent(Movie m) {
  m.read();
}

void storePos() {
  for (int i = 0; i<lim; i++) {
    limX = width/2 +  sin(moveAngle*i) * r * PI/3;
    limY = height/2 +  cos(moveAngle*i) * r * PI/3;
  }
}

void keyPressed() {
  if (indexLetter < 12) {
      if (key == BACKSPACE) {
        indexLetter--;
      }
    else {
      indexLetter++;
    }
    
  } 
  //println(letter[indexLetter], indexLetter, frameCount);

}

void createImg() {
  for (int i=0; i<billCount; i++) {
    bills[i] = loadImage("euro-note.png");
    image(bills[i], random(width), random(height));
  }
}