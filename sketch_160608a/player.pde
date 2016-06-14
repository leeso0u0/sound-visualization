
class Player extends Unit {
  int playerImageCount = 5;
  PImage[] boy = new PImage[playerImageCount];

  Player(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    Xsize = boyXsize;
    Ysize = boyYsize;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Ysize;

    boy[0]= loadImage("boy1.png");
    boy[1]= loadImage("boy2.png");
    boy[2]= loadImage("boy3.png");
    boy[3]= loadImage("boy4.png");
    boy[4]= loadImage("boy5.png");
  }

  void display() {
    image(boy[playerCurrentFrame], x, y);
    if (!isJump) {
      playerCurrentFrame = (playerCurrentFrame+1) % playerImageCount;
    } else playerCurrentFrame = 3;
  }

  void jump() {
    if (tPoint) {
      t+=0.2;
      s = 5 * t - 9*t*t*0.5;      
      y = y+s;

      if (t > 3) 
      {
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

    left = x ;
    right = x + boyXsize;
    top = y;
    bottom = y + boyYsize;
  }

  void move() {
    x+=10;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Ysize;
  }
}