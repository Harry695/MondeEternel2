class EnemyBullet extends GameObject {
  
  EnemyBullet(float x, float y) {
    super(x, y, 0, 8, 25, 9, 1, enemyLaser_img);
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    rotate(atan2(vy, vx));
    image(img, 0, 0, wdt, hgt);
    popMatrix();
  }
}
