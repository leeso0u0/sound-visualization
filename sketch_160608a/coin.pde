
class Coin extends Unit {
  PImage flower;
  
  Coin(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    left = x - (flowerXsize / 2);
    right = x + (flowerXsize / 2);
    top = y - (flowerYsize / 2);
    bottom = y + (flowerYsize / 2);

    flower= loadImage("F1.png");
  }

  void display() {
    image(flower, x, y);
  }

  void move() {
    x-=20;
    left = x;
    right = x + flowerXsize;
    top = y;
    bottom = y + flowerYsize;
  }
}