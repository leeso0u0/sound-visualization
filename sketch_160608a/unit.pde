
class Unit {
    float x;
    float y;
    float left;
    float right;
    float top;
    float bottom;
    int Xsize;
    int Ysize;

    boolean isCollision(Unit o) {
        return (this.left+40 < o.right &&
            this.right-40 > o.left &&
            this.top < o.bottom &&
            this.bottom > o.top);
    }
    void move() {
    x-=20;
    left = x;
    right = x + Xsize;
    top = y;
    bottom = y + Ysize;
  }
}