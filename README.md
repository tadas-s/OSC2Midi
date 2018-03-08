# OSC2Midi

ESP8266 based OSC <-> Midi wireless bridge.

It is mostly meant to be used with [TouchOSC][1] but of course it will work with any [OSC message source][2].

## Library dependencies

Project uses:
  * https://github.com/FortySevenEffects/arduino_midi_library/
  * https://github.com/CNMAT/OSC

## Hardware

This is based on a generic ESP8266 board and the folowing guides to do Midi I/O:
 * [Input][4]
 * [Output][3]

Midi I/O uses [SoftwareSerial][5] mostly to allow debug logging via primary serial port.

## OSC message formats

All messages are expected to have payload of 1 or 2 floats with range from 0 to 127.

### /midi/cc/{cc} + 1 float

Will Midi send control change message for `{cc}` number.

### /midi/cc/{ccA}/{ccB}/.../{index} + 1 float

Will send control change message for CC specified by `{index}`. For example:
  * /midi/cc/10/12/15/1 -> CC to 10
  * /midi/cc/10/12/15/3 -> CC to 15

This is meant to be used with TouchOSC groups of faders. For example, my MicroKORG preset
includes a fader group of 4 to control amp ADSR: `/midi/cc/73/75/70/72`

### /midi/cc/{ccA}/{ccB} + 2 floats

This sends two control change messages to `{ccA}` and `{ccB}`. This is meant to be
used with TouchOSC XY pads.

[1]: http://hexler.net/software/touchosc
[2]: https://en.wikipedia.org/wiki/Open_Sound_Control
[3]: https://www.arduino.cc/en/Tutorial/Midi
[4]: http://libremusicproduction.com/tutorials/arduino-and-midi-in
[5]: https://www.arduino.cc/en/Reference/SoftwareSerial
