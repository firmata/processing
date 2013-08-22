import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

void setup() {
  size(880, 540);

  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  
  for (int i = 0; i <= 53; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

void draw() {
  background(off);
  stroke(on);
  
  for (int i = 0; i <= 53; i++) {
    if (arduino.digitalRead(i) == Arduino.HIGH)
      fill(on);
    else
      fill(off);

    if (i <= 13) {
      rect(420 - i * 30, 30, 20, 20);
    } else if (i <= 21) {
      rect(480 + (i - 14) * 30, 30, 20, 20);
    } else {
      rect(780 + (i % 2) * 30, 30 + (i - 22) / 2 * 30, 20, 20);
    }
  }
    
  noFill();
  for (int i = 0; i <= 15; i++) {
    ellipse(280 + i * 30, 500, arduino.analogRead(i) / 16, arduino.analogRead(i) / 16);
  }
}
