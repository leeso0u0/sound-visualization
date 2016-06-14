
class Coin extends Unit {
  PImage flower;
  boolean bIsDraw;

  Coin(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    Xsize = flowerXsize;
    Ysize = flowerYsize;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Xsize;
    flower= loadImage("F1.png");
    bIsDraw = true;
  }

  void display() {
    if(bIsDraw)
    {
      image(flower, x, y);
    }
  }
    void move() {
    x-=20;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Ysize;
    }
}