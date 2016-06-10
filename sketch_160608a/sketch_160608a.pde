int imageCount=5;
int currentFrame=0;
int boyMoveY=0;
PImage[] boy = new PImage[imageCount];
PImage obj;
boolean isJump=false;
float objX=720;
float jump=0;
void setup()
{
  size(900, 480);
  background(255);
  frameRate(18);

  boy[0]= loadImage("boy1.png");
  boy[1]= loadImage("boy2.png");
  boy[2]= loadImage("boy3.png");
  boy[3]= loadImage("boy4.png");
  boy[4]= loadImage("boy5.png");

  obj = loadImage("T.png");
  //imageMode(CENTER);
}

void moveObjLeftSide()
{
  pushMatrix();
  translate(objX, 240);
  pushMatrix();
  scale(1.75);
  image(obj, 0, 0);
  popMatrix();
  popMatrix();

  if (objX < -110 )
  {
    objX = 1050;
  } else   objX-=20;
}

void drawBoy()
{
  pushMatrix();
  translate(80, 280+boyMoveY);
  pushMatrix();
  scale(0.2);
  image(boy[currentFrame], 0, 0);
  popMatrix();
  popMatrix();
}

void draw()
{
  frameRate(18+jump);
  background(230);
  fill(0);
  rect(0, 400, width, 80);
  drawBoy();
  if (mousePressed)
  {
    boyMoveY-=20;
    if (boyMoveY<-200) boyMoveY = -200;
  } 
  else
  {
    if (boyMoveY<0) boyMoveY+=10;
    currentFrame = (currentFrame+1) % imageCount;
  }
  moveObjLeftSide();
  jump+=0.02;
}