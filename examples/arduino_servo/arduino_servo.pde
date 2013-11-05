import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup() {
  size(360, 200);
  arduino = new Arduino(this, Arduino.list()[11], 57600);
  arduino.pinMode(4, Arduino.SERVO);
  arduino.pinMode(7, Arduino.SERVO);
}

void draw() {
  background(constrain(mouseX / 2, 0, 180));
  arduino.servoWrite(7, constrain(mouseX / 2, 0, 180));
  arduino.servoWrite(4, constrain(180 - mouseX / 2, 0, 180));
}
