void game() {
  background(0);

  //add objects------------------------------------
  mainList.add(new Star()); 
  if (frameCount % 60 == 0) mainList.add(new Enemy());
  if (frameCount % 180 == 0) mainList.add(new Enemy2());
  if (frameCount % 120 == 0) mainList.add(new Enemy3());

  //main loop------------------------------------
  int i = 0;
  while (i < mainList.size()) {
    GameObject thisObject = mainList.get(i);
    thisObject.show();
    thisObject.act();
    if (thisObject.isDead()) {
      mainList.remove(i);
    } else {
      i++;
    }
  }

  if (!plane.isDead()) {
    plane.show();
    plane.act();
  }
  
  //debug-------------------------------
  if (isTabPressed) {
    fill(white);
    textAlign(CORNER, CORNER);
    text("FPS: "+frameRate, 10, 10);
    text("Entities: "+mainList.size(), 10, 20);
    text("Lives: "+plane.hp, 10, 30);
  }
  
  //plane stats---------------------------------------
  healthBar();
  missileCooldown();
}

//========================================================

void gameClicks() {
  plane.deployBomb();
}

//=====================================================
void healthBar() {
  noFill();
  stroke(lightGrey);
  rect(125, height-50, 150, 25, 50);
  noStroke();
  fill(red);
  rectMode(CORNER);
  if (plane.hp > 0) rect(50, height-61, map(plane.hp, 0, plane.maxHp, 0, 150), 22, 50); 
  rectMode(CENTER);
}

//========================================================
void missileCooldown() {
  noFill();
  stroke(200);
  strokeWeight(3);
  circle(250, height-50, 50);
  image(missile_img, 250, height-50, 45, 15);
  fill(200, 200);
  noStroke();
  arc(250, height-50, 50, 50, 0, radians(map(plane.missileInterval, 0, 300, 360, 0)));
}

//==========================================================
//void init() {
//  plane = new Spaceship();
//  mainList.clear();
//}
