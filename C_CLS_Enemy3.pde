class Enemy3 extends GameObject {
  float ax, ay;
  
  Enemy3() {
    super(random(100, width-100), 0, 0, 8, 75, 75, 1, enemy3_img);
    y = 0-hgt/2;
    ax = 0;
    ay = 0;
  }
  
  
  void show() {
    pushMatrix();
    translate(x, y);
    rotate(atan2(vy, vx));
    image(img, 0, 0, wdt, hgt);
    popMatrix();
  }
  
  void act() {
    super.act();
    
    if (y-hgt/2 >= height) hp = 0;
    
    ax = (plane.x - x)/1500;
    ay = (plane.y - y)/2000;
    vx+=ax;
    vy+=ay;

    
    //checkBulletHit(Bullet.class.getClass());
    int i = 0;
    while (i < mainList.size()) {
      GameObject thisObject = mainList.get(i);
      if (thisObject instanceof Bullet || thisObject instanceof Missile) {
        if (isCollidingWith(thisObject)) {
          hp--;
          thisObject.hp = 0;
        }
      }
      i++;
    }
  }
  
  boolean isDead() {
    if (hp <= 0) {
      mainList.add(new BlueExplosion(x, y));
      return true;
    } else {
      return false;
    }
  }
    
}
