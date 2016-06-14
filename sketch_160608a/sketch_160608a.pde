import processing.sound.*;

SoundFile CoinEffect ;

boolean once;

int playerCurrentFrame = 0;
int coinCurrentFrame = 0;
float jump=0;

boolean isEnding = false;
int blockXsize = 50;
int blockYsize = 100;
int boyXsize = 60;
int boyYsize = 170;
int flowerXsize = 30;
int flowerYsize = 30;
int coinCount = 0;
int life = 3;
char[] lifeheart = new char[3];

float timer = 0;

float t = 1;
boolean tPoint = false;
float s = 0;
boolean isJump = false;
int meet = 0;
int end = 0;

Player player;
ArrayList<Block> boxes = new ArrayList<Block>();
ArrayList<Coin> coins = new ArrayList<Coin>();

PImage girl;
PImage bg1 ;
PImage bg2 ;
PImage meetGirl;

void setup() {
  size(900, 480);
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg2.png");
  girl = loadImage("girl.png");
  meetGirl = loadImage("E.png");
  CoinEffect = new SoundFile(this, "waterdrop.wav");
  background(255);
  frameRate(12);
  player = new Player(90, 224);
  boxes.add(new Block(800, 350));
  coins.add(new Coin(700, 270));
  for (int k = 0; k < 3; k++) lifeheart[k] = '♥';
}

void keyPressed() {
  if (!isEnding) {
    isJump = true;
    tPoint = true;
  }
}

void draw()
{

  frameRate(18);

  if (coinCount < 10 ) { 
    background(230);
    pushMatrix();
    image(bg2, -frameCount/10, -100);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    scale(0.7);
    image(bg1, -650-frameCount, -300);
    popMatrix();
    fill(0);
    rect(0, 400, width, 80);

    textSize(32); 
    text(coinCount, 30, 50);

    for ( Block box : boxes) {
      if (box.bIsCollision && player.isCollision(box)) {
        println("Crash");
        box.bIsCollision = false;
        life--;
        if (life > 0) lifeheart[2-life] = ' ';
      }
      box.move();
      if (coinCount < 10) box.display();
    }

    for ( Coin coin : coins) {
      if (coin.bIsDraw)
      {
        if ( !player.isCollision(coin)) {
          if (coinCount < 10) coin.display();
        } else {
          coin.bIsDraw = false;
          coinCount++;
          CoinEffect.play();
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

    for (int k = 0; k<3; k++) {
      fill(255, 0, 0);
      text(lifeheart[k], 770+(k*35), 50);
    }
  } else {
    isEnding = true;
    background(230);
    pushMatrix();
    image(bg2, -frameCount/10, -100);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    scale(0.7);
    image(bg1, -650-frameCount, -300);
    popMatrix();
    fill(0);
    rect(0, 400, width, 80);
    meet+=3;
    end = width - meet ;

    player.move();
    player.display();
    fill(255, 255);
    image(girl, end, 235);

    if (player.right > end-5) {
      background(255);
      image(meetGirl, width/2-40, 225);
      fill(0);
      text("Congratulation!", width/2-120, 100);
    }

    return;
  }

  if ( life < 1 ) {
    CoinEffect.stop();
    background(0);
    fill(255);
    text("lose ", width/2, height/2);
    coinCount = 0;
    
    return ;
  }
}