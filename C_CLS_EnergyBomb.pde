class EnergyBomb extends GameObject {
  float targetX, targetY;

  EnergyBomb(float x, float y, float targetX, float targetY) {
    super(x, y, 0, 0, 100, 100, 1, blueOrb_img);
    this.targetX = targetX;
    this.targetY = targetY;
  }

  //void show() {
  //  image(blueOrb_img, x, y, wdt, hgt);
  //}

  void act() {
    super.act();

    //moving towards point-----------------------------------
    vx = (targetX - x)/50;
    vy = (targetY - y)/50;
    if (dist(x, y, targetX, targetY) <= 50) {
      hp = 0;
      mainList.add(new ExplosionRing(x, y));
      int i = 0;
      while (i < mainList.size()) {
        GameObject thisObject = mainList.get(i);
        if (thisObject instanceof Enemy || thisObject instanceof Enemy2 || thisObject instanceof Enemy3 || thisObject instanceof EnemyBullet) {
          if (dist(x, y, thisObject.x, thisObject.y) < 300) {
            thisObject.hp = 0;
          }
        }
        i++;
      }
    }
  }
}
