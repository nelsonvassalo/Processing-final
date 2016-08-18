import processing.video.*;

Movie movie;

String roundT[] = {"JUSTGOTOWORK","NOCASHNOREST", "AUSTERITYFTW"};
int indexText = 0;
String letter[] = roundT[indexText].split("");
String caption = "";
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
int fade = 255;



void setup(){
  size(1280, 720);
  background(255,100);
  movie = new Movie(this, "code-720.mov");
  movie.loop();
  
  akzidenz = createFont("AkzidenzGrotesk.otf", 42);
  textFont(akzidenz);
}

void draw() {
  
    textSize(42);
    image(movie, 0,0);
    if (frameCount % width == 0) {
      background(0);
    }

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
    if (indexLetter <=12) {
        fill(255,255,255,fade);
        textSize(18);
        text(caption, width/2, height-40);
        fade-=3;
    }
    else {
      caption = "";
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
  } else {
    indexLetter = 0;
    indexText++;
    caption = "";
    
  }
  textMode(CENTER);
  textAlign(CENTER);
  caption += key;

  fade = 255;
  
  
  
  //println(letter[indexLetter], indexLetter, frameCount);
}



void createImg() {
  for (int i=0; i<billCount; i++) {
    bills[i] = loadImage("euro-note.png");
    imgX[i] += width/billCount;
    image(bills[i], imgX[i], imgY[i]);

  }
}