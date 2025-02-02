import processing.video.*;

Movie movie;

String roundT[] = {"JUSTGOTOWORK","NOCASHNOREST", "IN4AUSTERITY", "HAVEPATIENCE", "OUTOFOURLAND"};
int wordsTotal = roundT.length;
int indexText = 0;
String letter[] = roundT[indexText].split("");
String caption = "You wished Europe to ";
int lim = 12;
float limX = 300;
float limY = 300;
float moveAngle = 0.04;
float initAngle;
int r = 260;
PFont akzidenz;
int indexLetter = 0;
int scene = 1; 
float imgDist = 0.006;
int fade, fadeMain = 255;



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
        fade-=3;
    }
    else {
      caption = "You wish Europe to ";
    }
    text(caption, width/2, height-40);


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
    //indexLetter = 0;
    //indexText++;
    //caption = "You wish Europe to ";
    nextState();
    
  }
  textMode(CENTER);
  textAlign(CENTER);
  caption += key;

  fade = 255;
  
  
  
  //println(letter[indexLetter], indexLetter, frameCount);
}

void nextState() {
if (fadeMain > 0) {
  if (indexText < wordsTotal ) {
     indexText += 1;
  } else {
    indexText = 0;
  }
  indexLetter = 0;
  letter = roundT[indexText].split("");
  caption = "You wished Europe to ";
  }
}