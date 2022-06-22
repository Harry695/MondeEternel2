class Bullet extends GameObject {
  float angle;
  
  Bullet(float x, float y, float angleIn) {
    super(x, y, 0, 0, 25, 9, 1, laser_img);
    angle = angleIn;
    vx = 8*cos(radians(-angle));
    vy = 8*sin(radians(-angle));
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    rotate(radians(-angle));
    image(img, 0, 0, wdt, hgt);
    popMatrix();
  }
  
  void act() {
    super.act();
    if (y-hgt/2 >= height || y+hgt/2 <= 0) hp = 0;
  }

}
