class ExplosionRing extends GameObject {
  int sw;
  
  ExplosionRing(float x, float y) {
    super(x, y, 0, 0, 1, 1, 1, null);
    sw = 1;
  }
  
  void show() {
    strokeWeight(sw);
    stroke(aquaBlue);
    noFill();
    circle(x, y, wdt);
    wdt+=20;
    sw++;
    if (wdt >= 500) {
      hp = 0;
    }
  }
  
  void act() {
  }
}
