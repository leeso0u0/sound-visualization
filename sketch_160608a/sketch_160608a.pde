
int currentFrame=0;
int boyMoveY=0;

PImage obj;
float objX=720;
float jump=0;

int blockXsize = 50;
int blockYsize = 50;
int boyXsize = 64;
int boyYsize = 120;
  Player player;

class Player {
  float x;
  float y;
  float left;
  float right;
  float top;
  float bottom;
  int imageCount = 5;
  PImage[] boy = new PImage[imageCount];

  Player(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    left = x-(boyXsize/2);
    right = x+(boyXsize/2);
    top = y-(boyYsize/2);
    bottom = y+(boyXsize/2);

    boy[0]= loadImage("boy1.png");
    boy[1]= loadImage("boy2.png");
    boy[2]= loadImage("boy3.png");
    boy[3]= loadImage("boy4.png");
    boy[4]= loadImage("boy5.png");
  }

  void display() {
    image(boy[currentFrame], x, y);
    currentFrame = (currentFrame+1) % imageCount;
  }
  void jump() {
    
  }
}

class Block {
  float x;
  float y;
  float left;
  float right;
  float top;
  float bottom;
  
  Block(float tempX, float tempY){
    x = tempX;
    y = tempY;
    left = x - (blockXsize / 2);
    right = x + (blockXsize / 2);
    top = y - (blockYsize / 2);
    bottom = y + (blockYsize / 2);
  }
}
void setup()
{
  size(900, 480);
  background(255);
  frameRate(18);

  player = new Player(80, 344);
  obj = loadImage("T.png");
  imageMode(CENTER);
}

void moveObj()
{
  rect(objX, 350, 50, 50);

  if (objX < -110 )
  {
    objX = 1050;
  } else   objX-=20;
}

void draw()
{
  frameRate(10+jump);
  background(230);
  fill(0);
  rect(0, 400, width, 80);
  player.display();
  //drawBoy();
  /* if (mousePressed) {
   boyMoveY-=20;
   if (boyMoveY<-200) boyMoveY = -200;
   } else {
   if (boyMoveY<0) boyMoveY+=10;
   currentFrame = (currentFrame+1) % imageCount;
   }
   
   moveObj();
   
   //jump+=0.02;*/
}