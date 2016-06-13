
class Block extends Unit {

  Block(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    Xsize = blockXsize;
    Ysize = blockYsize;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Xsize;
  }
  
  void display() {
    rect(x, y, blockXsize, blockYsize);
  }

}