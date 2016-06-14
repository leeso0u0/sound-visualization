
int playerCurrentFrame = 0;
int coinCurrentFrame = 0;
float jump=0;

int blockXsize = 50;
int blockYsize = 100;
int boyXsize = 60;
int boyYsize = 170;
int flowerXsize = 30;
int flowerYsize = 30;
int coinCount = 0;
int life = 3;

float timer = 0;

float t = 1;
boolean tPoint = false;
float s = 0;
boolean isJump = false;

Player player;
ArrayList<Block> boxes = new ArrayList<Block>();
ArrayList<Coin> coins = new ArrayList<Coin>();

PImage bg ;

void setup() {
  size(900, 480);
  bg = loadImage("bg.png");
  background(255);
  frameRate(12);
  player = new Player(90, 224);
  boxes.add(new Block(800, 350));
  coins.add(new Coin(700, 270));
}

void keyPressed() {
  isJump = true;
  tPoint = true;
}

void draw()
{
  frameRate(18);
  background(230);
  
  
  pushMatrix();
  scale(0.2);
  image(bg, -frameCount, 0);
  popMatrix();
  
  fill(0);
  rect(0, 400, width, 80);
  for ( Block box : boxes) {
    if (box.bIsCollision && player.isCollision(box)) {
      println("Crash");
      box.bIsCollision = false;
      life--;
    }
    box.move();
    box.display();
  }

  for ( Coin coin : coins) {
    if (coin.bIsDraw)
    {
      if ( !player.isCollision(coin)) {
        coin.display();
      } else {
        coin.bIsDraw = false;
        coinCount++;
      }
      coin.move();
    }
  }
  timer +=0.2;

  int ran = int(random(100));
  if (timer > 1) {
    if ( ran>15) {
      coins.add(new Coin(1000, 300));
    } else {
      boxes.add(new Block(1000, 350));
    }
    timer=0;
  }
  if (isJump) {
    player.jump();
  }
  player.display();

  if (coinCount < 50) {
    textSize(32); 
    text(coinCount, 30, 50);
  } 
  else {
    background(0);
    fill(255);
    text("win", width/2, height/2);
    return;
  }
  
  if ( life < 1 ){
    background(0);
    fill(255);
    text("lose ", width/2, height/2);
    return;
   }
}