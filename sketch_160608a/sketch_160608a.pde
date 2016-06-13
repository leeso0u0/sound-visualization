
int playerCurrentFrame = 0;
int coinCurrentFrame = 0;
float jump=0;

int blockXsize = 30;
int blockYsize = 50;
int boyXsize = 64;
int boyYsize = 120;
int flowerXsize = 30;
int flowerYsize = 30;
int coinCount = 0;

float timer = 0;

float t = 1;
boolean tPoint = false;
float s = 0;
boolean isJump = false;

Player player;
ArrayList<Block> boxes = new ArrayList<Block>();
ArrayList<Coin> coins = new ArrayList<Coin>();

void setup() {
  size(900, 480);
  background(255);
  frameRate(18);
  player = new Player(80, 344);
  boxes.add(new Block(800, 350));
  coins.add(new Coin(700, 350));
  imageMode(CENTER);
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

  for ( Block box : boxes) {
    if (player.isCollision(box)) {
    //  println("충돌");
    }
    box.move();
   box.display(); 
}

  for ( Coin coin : coins) {
    if (!player.isCollision(coin)) {
      coin.display();
    }
    else {
      coinCount++;
    }
    coin.move();
  }
  timer +=0.2;
  
  int ran = int(random(100));
  if (timer > 1) {
    if ( ran>15) {
      coins.add(new Coin(1000, 350));
    }
    else {
      boxes.add(new Block(1000,350));
    }
    timer=0;
  }
  
  if (isJump) {
    player.jump();
  }
  player.display();
  println(coinCount);

}