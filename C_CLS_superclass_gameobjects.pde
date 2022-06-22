abstract class GameObject {
  float x, y, vx, vy, wdt, hgt;
  int hp;
  PImage img;
  
  GameObject(float x, float y, float vx, float vy, float wdt, float hgt, int hp, PImage img) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.wdt = wdt;
    this.hgt = hgt;
    this.hp = hp;
    this.img = img;
  }
  
  void show() {
    image(img, x, y, wdt, hgt);
  }
  
  void act() {
    x += vx;
    y += vy;
    if (y-hgt/2 >= height) hp = 0;
  }
  
  boolean isDead() {
    if (hp <= 0) {
      return true; 
    } else {
      return false;
    }
  }
  
  boolean isCollidingWith(GameObject thisObject) {
    return abs(thisObject.x - x) < thisObject.wdt/2 + wdt/2 && abs(thisObject.y - y) < thisObject.hgt/2 + hgt/2;
  }
  
  //void checkBulletHit(String cls) {
  //  int i = 0;
  //  while (i < mainList.size()) {
  //    GameObject thisObject = mainList.get(i);
  //    if (thisObject.class.getClass().equals(cls)) {
  //      if (isCollidingWith(thisObject)) {
  //        hp--;
  //        thisObject.hp = 0;
  //      }
  //    }
  //    i++;
  //  }
  //}
}
