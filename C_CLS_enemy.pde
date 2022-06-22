class Enemy extends GameObject {
  
  Enemy() {
    super(random(100, width-100), 0, 0, 3, 150, 100, 3, enemy_img);
    y = 0-hgt/2;
  }
  
  void act() {
    super.act();
    
    if (y-hgt/2 >= height) hp = 0;
    
    if (frameCount % 50 == 0) mainList.add(new EnemyBullet(x, y+wdt/2));
    
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
