class Powerup extends GameObject {
  int type, timer, isImageOn, timerFactor;

  Powerup(float x, float y, int type) {
    super(x, y, random(-3, 3), random(-3, 3), 50, 50, 1, null);
    this.type = type;
    isImageOn = 1;
  }

  void show() {
    if (type == 0) img = shield_PWRP;
    if (type == 1) img = doubleShot_PWRP;
    if (type == 2) img = tripleShot_PWRP;
    if (type == 3) img = blueOrb_PWRP;
    if (isImageOn == 1) super.show();
  }

  void act() {
    x += vx;
    y += vy;
    
    //bouncing--------------------------------------------
    if (x+wdt/2 >= width || x-wdt/2 <= 0) vx*=-1;
    if (y+hgt/2 >= height || y-hgt/2 <= 0) vy*=-1;
    if (x+wdt/2 > width) x = width-wdt-2;
    if (y-hgt/2 < 0) y = wdt+2;
    
    //plane collision-----------------------------------------
    if (plane.x-plane.wdt/2 < x+wdt/2 && plane.x+plane.wdt/2 > x-wdt/2 && plane.y-plane.hgt/2 < y+hgt/2 && plane.y+plane.hgt/2 > y-hgt/2) {
      plane.receivePowerup(type);
      hp = 0;
    }
    
    //timer & blinking-------------------------------------------------
    if (timer > 360) if (timer % 20 == 0) {
      isImageOn*=-1;
    }
      
    timer++;
    if (timer > 600) hp = 0;
  }
}
