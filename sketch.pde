import processing.video.*;

Movie movie;

String roundT = "JUSTGOTOWORK";
String letter[] = roundT.split("");
int billCount = 30;
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
float imgX[] = new float[billCount];
float imgY[] = new float[billCount];
float imgDist = 0.006;



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
  
    image(movie, 0,0);
    if (frameCount % width == 0) {
      background(0);
    }

   
   if(scene == 1) {

    fill(255, 255, 0, 255);
    moveAngle -= 0.008;
  
    for(int i = 1; i<indexLetter+1; i++) {
        initAngle=(PI/6);
        
        if (i <= 6) {
          text(letter[i-1], width/2 + cos(PI+initAngle*i+moveAngle) * r, height/2 + sin(PI+initAngle*i+moveAngle) * r );
        }
        else {
          text(letter[i-1], width/2 + cos(PI+initAngle*i+moveAngle) * r, height/2 + sin(0-PI+initAngle*i+moveAngle) * r );
        }
        println(letter[i-1], i-1, i);
    }
  }
  if (scene == 2) {
    textAlign(CENTER);
    stroke(3);
    fill(255,255,0,255);
    strokeWeight(4);
    rectMode(CENTER);
    textSize(16);
    rect(width/2, height/2, 300, 40);
    fill(0,255);
    text("Unleash Offshore €uros", width/2, height/2+5);
    if(mousePressed) {
      if(mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY > height/2 - 25 && mouseY < height/2 +25) {
         fill(0,255);
         //rect(width/2, height/2, 300, 40);
        createImg();
      
      }
    }
    imgDist += random(0,0.08);

        
  }
  println(frameCount);
}
void movieEvent(Movie m) {
  m.read();
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
    scale(random(0.3,1));
        
    for(int a = 0; a<billCount; a++) {
      imgX[a] = random(1, width);
      imgY[a] = sin(random(-1,1)*imgDist);
    }
    image(bills[i], imgX[i], 0);   
  }
}