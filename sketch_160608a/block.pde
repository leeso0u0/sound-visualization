
class Block extends Unit {

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
   x-=20;
    left = x;
    right = x + blockXsize;
    top = y;
    bottom = y + blockYsize;
  }
}