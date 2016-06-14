
class Block extends Unit {
  boolean bIsCollision;
  Block(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    Xsize = blockXsize;
    Ysize = blockYsize;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Ysize;
    bIsCollision = true;
  }
  
  void display() {
    rect(x, y, Xsize, Ysize);
  }

}