/*
arduino_pwm

Demonstrates the control of analog output (PWM) pins of an Arduino board
running the StandardFirmata firmware.  Moving the mouse horizontally across
the sketch changes the output on pins 9 (value is proportional to the mouse
X coordinate) and 11 (inversely porportional to mouse X).

To use:
* Using the Arduino software, upload the StandardFirmata example (located
  in Examples > Firmata > StandardFirmata) to your Arduino board.
* Run this sketch and look at the list of serial ports printed in the
  message area below. Note the index of the port corresponding to your
  Arduino board (the numbering starts at 0).  (Unless your Arduino board
  happens to be at index 0 in the list, the sketch probably won't work.
  Stop it and proceed with the instructions.)
* Modify the "arduino = new Arduino(...)" line below, changing the number
  in Arduino.list()[0] to the number corresponding to the serial port of
  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
  or "/dev/tty.usbmodem621" on Mac.
* Connect LEDs or other outputs to pins 9 and 11.
* Run this sketch and move your mouse horizontally across the screen.
  
For more information, see: http://playground.arduino.cc/Interfacing/Processing
*/

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

void setup() {
  size(512, 200);

  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
}

void draw() {
  background(constrain(mouseX / 2, 0, 255));
  
  // Output analog values (PWM waves) to digital pins 9 and 11.
  // Note that only certain Arduino pins support analog output (PWM).
  // See the documentation for your board for details.
  arduino.analogWrite(9, constrain(mouseX / 2, 0, 255));
  arduino.analogWrite(11, constrain(255 - mouseX / 2, 0, 255));
}
