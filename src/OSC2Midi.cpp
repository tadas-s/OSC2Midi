#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <OSCMessage.h>
#include <OSCBundle.h>
#include <OSCData.h>
#include <SoftwareSerial.h>
#include <MIDI.h>
#include <OSC2Midi.h>
#include "debug.h"

void MidiCCToOSC(uint8_t channel, uint8_t number, uint8_t value);

WiFiUDP udp;

/**
   source address of last OSC message for midi2osc messages.
*/
IPAddress clientIP;

SoftwareSerial midiSerialPort(4, 5); // RX, TX pins to be used for ss port

MIDI_CREATE_INSTANCE(SoftwareSerial, midiSerialPort, MIDI);

// Built-in led used to show activity status
#define LED_BUILTIN 2
bool led = false;

void setup() {
  // The MIDI input used in project is always pulled high,
  // so don't try to "fight" and pull the input pin up as well
  pinMode(4, INPUT_PULLUP);
  pinMode(5, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  Serial.begin(115200);

  DEBUG_MSG("\nHello OSC2Midi!\n");

  WiFi.softAP("OSC2Midi", "Midi2OSCGateway");

  DEBUG_MSG("\nAP IP address: %s\n", WiFi.softAPIP().toString().c_str());

  udp.begin(8000);

  MIDI.setHandleControlChange(MidiCCToOSC);

  midiSerialPort.begin(31250);
}

void OSCToMidiCC(OSCMessage &msg, int offset) {
  char address[100] = { 0 };
  uint8_t cc, value;

  msg.getAddress(address, offset, sizeof(address));

  if (msg.size() == 1 && msg.isFloat(0)) {
    // Single or multi control with sending one value
    cc = getCC(address);
    value = round(msg.getFloat(0));
    value = value > 127 ? 127 : value;
    DEBUG_MSG("MSG: %s\tCC: %u\tValue: %u\n", address, cc, value);
    MIDI.sendControlChange(cc, value, 1);
  } else if (msg.size() == 2 && msg.isFloat(0) && msg.isFloat(1)) {
    // XY pad, two values
    cc = getCC(address, 0);
    value = round(msg.getFloat(0));
    value = value > 127 ? 127 : value;
    DEBUG_MSG("MSG: %s\tCC: %u\tValue: %u\n", address, cc, value);
    MIDI.sendControlChange(cc, value, 1);

    cc = getCC(address, 1);
    value = round(msg.getFloat(1));
    value = value > 127 ? 127 : value;
    DEBUG_MSG("MSG: %s\tCC: %u\tValue: %u\n", address, cc, value);
    MIDI.sendControlChange(cc, value, 1);
  } else {
    DEBUG_MSG("Cannot handle: %s\n", address);
  }
}

void MidiCCToOSC(uint8_t channel, uint8_t number, uint8_t value) {
  char buffer[1024];
  snprintf(buffer, sizeof(buffer), "/midi/cc/%u", number);

  OSCMessage msg = OSCMessage(buffer);
  msg.add(value * 1.0);

  DEBUG_MSG("MidiCCToOsc: %s %f", buffer, value * 1.0);

  udp.beginPacket(clientIP, 8001);
  msg.send(udp);
  udp.endPacket();
}

void loop() {
  OSCMessage msg;
  uint8_t buffer[1024];

  // Check if there are any OSC packets to handle
  size_t size = udp.parsePacket();
  if (size > 0 && size <= 1024) {
    udp.read(buffer, size);
    msg.fill(buffer, size);

    if (!msg.hasError()) {
      msg.route("/midi/cc", OSCToMidiCC);
      led = !led;
      digitalWrite(LED_BUILTIN, led);
    } else {
      DEBUG_MSG("Error parsing OSC message: %d", msg.getError());
    }

    // Keep track of the client IP address for "talking back"
    clientIP = udp.remoteIP();
  }

  // Check if there are any CC messages from synth itself
  MIDI.read();
}