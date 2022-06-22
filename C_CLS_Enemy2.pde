class Enemy2 extends GameObject {
  int tpCountdown, immunityCountdown;
  boolean isImageOn;


  Enemy2() {
    super(random(100, width-100), 0, 0, 2, 90, 120, 2, enemy2_img);
    y = 0-hgt/2;
    tpCountdown = 120;
    isImageOn = true;
  }

  void show() {
    if (isImageOn) {
      super.show();
    }
  }

  void act() {
    super.act();
    if (y-hgt/2 >= height) hp = 0;
    
    //aggro tp-----------------------------------------------------
    if (tpCountdown == 90) { 
      mainList.add(new SmokeParticle(x, y));
      immunityCountdown = 30;
    }
    if (tpCountdown <= 90 && tpCountdown >= 60) isImageOn = false;
    if (tpCountdown <= 60) {
      if (tpCountdown == 60) {
        x = plane.x;
        //println("aggro tped to x = ", x);
        isImageOn = true;
        mainList.add(new SmokeParticle(x, y));
      }
      if (tpCountdown % 10 == 0) {
        mainList.add(new EnemyBullet(x, y+wdt/2));
      }
    }

    //random tp-------------------------------------------------------
    if (tpCountdown == 240) {
      isImageOn = false;
      mainList.add(new SmokeParticle(x, y));
    }
    if (tpCountdown == 210) {
      x = random(100, width-100);
      mainList.add(new SmokeParticle(x, y));
      isImageOn = true;
    }

    //check bullet collision --------------------------------------------
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

    //countdown--------------------------------------------------
    tpCountdown--;
    if (tpCountdown <= 0) tpCountdown = 300;  
  }

  boolean isDead() {
    if (hp <= 0) {
      mainList.add(new BlueExplosion(x, y));
      if (random(0, 1) >= 0.5) mainList.add(new Powerup(x, y, int(random(0, 4))));
      return true;
    } else {
      return false;
    }
  }
}
