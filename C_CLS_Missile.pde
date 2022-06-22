class Missile extends GameObject {
  float ax, ay, targetX, targetY;

  Missile(float x, float y) {
    super(x, y, 0, 0, 75, 25, 1, missile_img);
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

    //choose target----------------------------------------------
    int i = 0;
    while (i < mainList.size()) {
      GameObject thisObject = mainList.get(i);
      if (thisObject instanceof Enemy || thisObject instanceof Enemy2 || thisObject instanceof Enemy3) {
        if (thisObject.y > 50) {
          targetX = thisObject.x;
          targetY = thisObject.y;
        }
      }
      i++;
    }

    //adjust trajectory------------------------------------------
    ax = (targetX - x)/1500;
    ay = (targetY - y)/2000;
    vx+=ax;
    vy+=ay;
  }
}
