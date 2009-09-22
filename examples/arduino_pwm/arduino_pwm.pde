import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup() {
  size(512, 200);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
}

void draw() {
  background(constrain(mouseX / 2, 0, 255));
  arduino.analogWrite(9, constrain(mouseX / 2, 0, 255));
  arduino.analogWrite(11, constrain(255 - mouseX / 2, 0, 255));
}
