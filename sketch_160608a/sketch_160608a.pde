
int currentFrame=0;
float jump=0;

int blockXsize = 50;
int blockYsize = 50;
int boyXsize = 64;
int boyYsize = 120;

Player player;
Block box;

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
    y-=20;
  }
}

class Block {
  float x;
  float y;
  float left;
  float right;
  float top;
  float bottom;

  Block(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    left = x - (blockXsize / 2);
    right = x + (blockXsize / 2);
    top = y - (blockYsize / 2);
    bottom = y + (blockYsize / 2);
  }
  void display() {
    rect(x, y, blockXsize, blockYsize);
  }
  void move() {
    if (x < -110 ) {
      x = 1050;
    } else {
      x-=20;
    }
    
    left = x - (blockXsize / 2);
    right = x + (blockXsize / 2);
    top = y - (blockYsize / 2);
    bottom = y + (blockYsize / 2);
  }
}

void setup() {
  size(900, 480);
  background(255);
  frameRate(18);
  box = new Block(800, 350);
  player = new Player(80, 344);
  imageMode(CENTER);
}

void collision() {
  println("Called collision.");
   if (player.left < box.right
   && player.right > box.left
   && player.top > box.bottom
   && player.bottom < box.top) {
     println("충돌");
   }
}

void draw()
{
  frameRate(10+jump);
  background(230);
  fill(0);
  rect(0, 400, width, 80);
  player.display();
  
  if (mousePressed) {
    player.jump();
  }
  
  box.display();
  box.move();
  collision();
}