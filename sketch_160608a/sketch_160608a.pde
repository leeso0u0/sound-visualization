
int playerCurrentFrame = 0;
int coinCurrentFrame = 0;
float jump=0;

int blockXsize = 30;
int blockYsize = 50;
int boyXsize = 64;
int boyYsize = 120;
int flowerXsize = 30;
int flowerYsize = 30;

float t = 1;
boolean tPoint = false;
float s = 0;
boolean isJump = false;

Player player;
Block box;
Coin coin;

class Player {
  float x;
  float y;
  float left;
  float right;
  float top;
  float bottom;
  int playerImageCount = 5;
  PImage[] boy = new PImage[playerImageCount];

  Player(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    left = x - (boyXsize / 2);
    right = x + (boyXsize / 2);
    top = y - (boyYsize / 2);
    bottom = y + (boyXsize / 2);

    boy[0]= loadImage("boy1.png");
    boy[1]= loadImage("boy2.png");
    boy[2]= loadImage("boy3.png");
    boy[3]= loadImage("boy4.png");
    boy[4]= loadImage("boy5.png");
  }

  void display() {
    image(boy[playerCurrentFrame], x, y);
    if(!isJump){
      playerCurrentFrame = (playerCurrentFrame+1) % playerImageCount;
    }
    else playerCurrentFrame = 3;
  }

  void jump() {
    if (tPoint) {
      t+=0.2;
      s = 5 * t - 9*t*t*0.5;
      y = y+s;
      if (t > 3) {
        tPoint = false;
      }
    } else {
      s = 5 * t - 9*t*t*0.5;
      y = y-s;
      t-=0.2;
      if (t <= 1) {
        isJump = false;
      }
    }

    left = x - (boyXsize / 2);
    right = x + (boyXsize / 2);
    top = y - (boyYsize / 2);
    bottom = y + (boyXsize / 2);
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

    left = x;
    right = x + blockXsize;
    top = y;
    bottom = y + blockYsize;
  }
}

class Coin {
  float x;
  float y;
  float left;
  float right;
  float top;
  float bottom;
  int flowerImageCount = 2;
  PImage[] flower = new PImage[flowerImageCount];

  Coin(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    left = x - (flowerXsize / 2);
    right = x + (flowerXsize / 2);
    top = y - (flowerYsize / 2);
    bottom = y + (flowerYsize / 2);

    flower[0]= loadImage("F1.png");
    flower[1]= loadImage("F2.png");
  }

  void display() {
   image(flower[coinCurrentFrame], x, y);
   coinCurrentFrame = (coinCurrentFrame+1) % flowerImageCount;
  }
  
  void move() {
    if (x < -110 ) {
      x = 1050;
    } else {
      x-=20;
    }

    left = x;
    right = x + flowerXsize;
    top = y;
    bottom = y + flowerYsize;
  }
}

void setup() {
  size(900, 480);
  background(255);
  frameRate(18);
  box = new Block(800, 350);
  player = new Player(80, 344);
  coin = new Coin(700,350);
  imageMode(CENTER);
}

boolean isCollision() {
  if (player.left < box.right
    && player.right > box.left
    && player.top < box.bottom
    && player.bottom > box.top) {
    return true;
  }
  return false;
}

boolean isGetCoin() {
    if (player.left < coin.right
    && player.right > coin.left
    && player.top < coin.bottom
    && player.bottom > coin.top) {
    return true;
  }
  return false;
}

void keyPressed() {
  isJump = true;
  tPoint = true;
}

void draw()
{
  frameRate(18);
  background(230);
  fill(0);
  rect(0, 400, width, 80);
  
  player.display();
  
  box.display();
  box.move();
  
  if (isCollision()) {
    println("collision");
  }
  if (isGetCoin()) {
    println("get coin!");
  }
  if (isJump) {
    player.jump();
  }
  
  coin.display();
  coin.move();
}