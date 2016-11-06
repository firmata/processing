# Processing client for Firmata

See http://playground.arduino.cc/Interfacing/Processing for more info.

## Contributing

*Note: The build process (as defined in build.xml) copies 2 jar files from the Processing
application and assumes Processing is installed on OS X in the Applications directory so
the following build instructions will currently only work for OS X.*

To build:

1. Ensure you have [Apache Ant](http://ant.apache.org/) installed.
2. From the root directory, run: `ant`
   This will generate a few directories, but ultimately all you need is the updated
   processing-arduino.zip file.
3. Run: `ant clean` to remove the generated files and directories
