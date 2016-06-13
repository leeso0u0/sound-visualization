
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
        return (this.left < o.right &&
            this.right > o.left &&
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