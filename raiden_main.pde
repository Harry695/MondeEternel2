//FINAL PROJECT! :O
//Harry Ouyang
//blk 3
//Created 2022-05-24

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//TODO:
//-Death reset
//-Scoring
//-Powerup distribution

//variables ========================================================================
//mode framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//colors
color black = #000000;
color white = #FFFFFF;
color deepBlue = #2E5266;
color lightGrey = #D3D0CB;
color platinum = #E5E7E6;
color aquaBlue = #41EAD4;
color red = #FF0022;

//images
PImage spaceship_img, laser_img, enemy_img, enemy2_img, enemy3_img, enemyLaser_img, missile_img, blueOrb_img;
PImage shield_PWRP, doubleShot_PWRP, tripleShot_PWRP, blueOrb_PWRP;
PImage menu;

//vfx
PImage [] blue_explosion;
final int nBlue = 16;
PImage [] red_explosion;
final int nRed = 12;
PImage [] smoke_particle;
final int nSmoke = 36;

//fonts

//keyboard
boolean isWPressed, isSPressed, isAPressed, isDPressed, isSpacePressed, isTabPressed, isShiftPressed, isESCPressed;

//objects
ArrayList<GameObject> mainList;
Spaceship plane;

//====================================================================================

void setup() {
  fullScreen();//size();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
  
  //images init
  spaceship_img = loadImage("plane.png");
  laser_img = loadImage("laser.png");
  enemy_img = loadImage("enemy.png");
  enemy2_img = loadImage("enemy2.png");
  enemy3_img = loadImage("enemy3.png");
  enemyLaser_img = loadImage("enemyLaser.png");
  missile_img = loadImage("missile.png");
  blueOrb_img = loadImage("blueOrb.png");
  
  shield_PWRP = loadImage("shield_PWRP.png");
  doubleShot_PWRP = loadImage("doubleShot_PWRP.png");
  tripleShot_PWRP = loadImage("tripleShot_PWRP.png");
  blueOrb_PWRP = loadImage("blueOrb_PWRP.png");
  
  menu = loadImage("menu.png");
  
  //vfx init
  blue_explosion = new PImage[nBlue];
  for (int i = 0; i < nBlue; i++) {
    blue_explosion[i] = loadImage("blue_explosion/frame_"+i+"_delay-0.04s.gif");
  }
  
  red_explosion = new PImage[nRed];
  for (int i = 0; i < nRed; i++) {
    red_explosion[i] = loadImage("red_explosion/frame_"+i+"_delay-0.1s.gif");
  }
  
  smoke_particle = new PImage[nSmoke];
  for (int i = 0; i < nSmoke; i++) {
    smoke_particle[i] = loadImage("smoke_particles/frame_"+i+"_delay-0.04s.gif");
  }
  
  //objects init
  mainList = new ArrayList<GameObject>();
  plane = new Spaceship();
  
  //keyboard init
  isWPressed = isSPressed = isAPressed = isDPressed = isSpacePressed = isTabPressed = false;
}

//=====================================================================================

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}

//=====================================================================================
