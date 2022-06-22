class RedExplosion extends GameObject {
  int i, delay;

  RedExplosion(float x, float y) {
    super(x, y, 0, 0, 120, 120, 1, red_explosion[0]);
    i = 0;
    delay = (int) random(0, 60);
  }

  void show() {
    if (delay <= 0) {
      if (frameCount % 5 == 0) image(red_explosion[i], x, y, wdt, hgt);
      i++;
      if (i >= nRed) hp = 0;
    }
    delay--;
  }
}
