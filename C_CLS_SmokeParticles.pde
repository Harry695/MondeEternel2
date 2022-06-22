class SmokeParticle extends GameObject {
  int i = 0;
  
  SmokeParticle(float x, float y) {
    super(x, y, 0, 0, 150, 150, 1, smoke_particle[0]); 
  }
  
  void show() {
    if (frameCount % 6 == 0) image(smoke_particle[i], x, y, wdt, hgt);
    i++;
    if (i >= nSmoke) hp = 0;
  }
}
