class BlueExplosion extends GameObject {
  int i;
  
  BlueExplosion(float x, float y) {
    super(x, y, 0, 0, 120, 120, 1, blue_explosion[0]);
    i = 0;
  }
  
  BlueExplosion(float x, float y, float wdt, float hgt) {
    super(x, y, 0, 0, wdt, hgt, 1, blue_explosion[0]);
    i = 0;
  }
  
  void show() {
    if (frameCount % 5 == 0) image(blue_explosion[i], x, y, wdt, hgt);
    i++;
    if (i >= nBlue) hp = 0;
    if (wdt == 600) println(wdt+", "+hgt, i, hp);
  }
  
  void act() {
  }
}
