
class Unit {
    float x;
    float y;
    float left;
    float right;
    float top;
    float bottom;

    boolean isCollision(Unit o) {
        return (this.left < o.right &&
            this.right > o.left &&
            this.top < o.bottom &&
            this.bottom > o.top);
    }
}