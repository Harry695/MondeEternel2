void keyPressed() {
  if (key == 'w' || key == 'W') isWPressed = true;
  if (key == 's' || key == 'S') isSPressed = true;
  if (key == 'a' || key == 'A') isAPressed = true;
  if (key == 'd' || key == 'D') isDPressed = true;
  if (key == ' ') isSpacePressed = true;
  if (keyCode == TAB) isTabPressed = true;
  if (keyCode == SHIFT) isShiftPressed = true;
  if (keyCode == ESC) isESCPressed = true;
}

//============================================================

void keyReleased() {
  if (key == 'w' || key == 'W') isWPressed = false;
  if (key == 's' || key == 'S') isSPressed = false;
  if (key == 'a' || key == 'A') isAPressed = false;
  if (key == 'd' || key == 'D') isDPressed = false;
  if (key == ' ') isSpacePressed = false;
  if (keyCode == TAB) isTabPressed = false;
  if (keyCode == SHIFT) isShiftPressed = false;
  if (keyCode == ESC) isESCPressed = false;
}
