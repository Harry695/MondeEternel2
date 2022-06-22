class Spaceship extends GameObject {
  int firingInterval, missileInterval, gunMode, shieldCountdown, gunCountdown;
  boolean isBombReady;
  final int normalGun = 0;
  final int dualGun = 1;
  final int tripleGun = 2;
  
  final int maxHp = 100;

  Spaceship() {
    super(width/2, height/2, 0, 0, 90, 100, 100, spaceship_img);
    firingInterval = 10;
    missileInterval = 300;
    gunMode = normalGun;
    isBombReady = true;
  }

  void show() {
    super.show();
    //shield---------------------------------
    if (shieldCountdown > 0) {
      stroke(white);
      strokeWeight(3);
      fill(white, 70);
      circle(x, y, 120);
    }
  }

  void act() {
    super.act();
    
    //controls-------------------------------------------
    if (isAPressed) vx = -5;
    if (isDPressed) vx = 5;
    if (isWPressed) vy = -5;
    if (isSPressed) vy = 5;
    if (!isWPressed && !isSPressed) vy *= 0.93;
    if (!isAPressed && !isDPressed) vx *= 0.93;
    
    //firing--------------------------------------------
    if (isSpacePressed && firingInterval >= 10) {
      shoot();
      firingInterval = 0;
    }
    
    //missiles--------------------------------------------
    if (isShiftPressed && missileInterval >= 300) {
      mainList.add(new Missile(x, y));
      mainList.add(new Missile(x, y));
      mainList.add(new Missile(x, y));
      missileInterval = 0;
    }
    
    //limit-------------------------------------------
    x = min(max(wdt/2, x), width-wdt/2);
    y = min(max(hgt/2, y), height-hgt/2);
    
    //bullet collision-----------------------------------------
    int i = 0;
    while (i < mainList.size()) {
      GameObject thisObject = mainList.get(i);
      if (thisObject instanceof EnemyBullet || thisObject instanceof Enemy3) {
        if (isCollidingWith(thisObject)) {
          if (shieldCountdown >= 0) hp--;
          thisObject.hp = 0;
        }
      }
      i++;
    }
    
    //countdowns------------------------------------------
    firingInterval++;
    missileInterval++;
    if (shieldCountdown > 0) shieldCountdown--;
    if (gunCountdown > 0) gunCountdown--;
    if (gunCountdown <= 0) gunMode = normalGun;
  }

  boolean isDead() {
    if (hp == 0) {
      for (int i = 0; i < 5; i++) mainList.add(new RedExplosion(random(x-100, x+100), random(y-100, y+100)));
      hp--;
      return true;
    } if (hp < 0) {
      return true;
    } else {
      return false;
    }
  }

  void shoot() {
    if (gunMode == dualGun && gunCountdown > 0) {
      mainList.add(new Bullet(x-wdt/4, y, 90));
      mainList.add(new Bullet(x+wdt/4, y, 90));
    } else if (gunMode == tripleGun && gunCountdown > 0) {
      mainList.add(new Bullet(x, y, 80));
      mainList.add(new Bullet(x, y, 90));
      mainList.add(new Bullet(x, y, 100));
    } else if (gunMode == normalGun) {
      mainList.add(new Bullet(x, y, 90));
    } else {
      println("Error: gunMode = "+gunMode);
    }
  }

  void receivePowerup(int type) {
    if (type == 0) {
      shieldCountdown = 300;
    } else if (type >= 1 && type <= 2) {
      gunMode = type;
      gunCountdown = 600;
    } else if (type == 3) {
      isBombReady = true;
    } else {
      println("Error: type = "+type);
    }
  }
  
  void deployBomb() {
    if (isBombReady) mainList.add(new EnergyBomb(x, y, mouseX, mouseY));
    isBombReady = false;
  }
}
