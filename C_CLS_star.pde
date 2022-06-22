class Star extends GameObject {
  
  Star() {
    super(random(width), 0, 0, 0, random(2,5), 0, 1, null);
    vy = hgt = wdt;
  }
  
  void show() {
    noStroke();
    fill(white);
    rect(x, y, wdt, hgt, 25);
  }
  
  void act() {
    super.act();
    if (y-hgt/2 > height) {
      hp = 0;
    }
  }
  
}
