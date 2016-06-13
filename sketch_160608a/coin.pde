
class Coin extends Unit {
  PImage flower;

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
  }

  void display() {
    image(flower, x, y);
  }
}