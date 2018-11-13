#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <OSCMessage.h>
#include <OSCBundle.h>
#include <OSCData.h>
#include <SoftwareSerial.h>
#include <MIDI.h>
#include <Ticker.h>

WiFiUDP udp;

/**
  source address of last OSC message for midi2osc messages.
*/
IPAddress clientIP;

SoftwareSerial midiSerialPort(4, 5); // RX, TX pins to be used for ss port

MIDI_CREATE_INSTANCE(SoftwareSerial, midiSerialPort, MIDI);

/**
 * Glide setting for smooth transition from one control value to another.
 */
float glide = 1.0;

/**
 * Scheduler for running the glide task.
 */
void glideTask();
Ticker glideScheduler(glideTask, 50, 0, MILLIS);

class ControlChangeState {
  public:
    uint8_t targetValue;
    float currentValue;
    bool complete = true;
    bool initialized = false;

    void setTarget(uint8_t newTargetValue) {
      if (initialized) {
        targetValue = newTargetValue;
        complete = false;
      } else {
        initialized = true;
        complete = true;
        targetValue = newTargetValue;
        currentValue = (float)newTargetValue;
      }
    }

    uint8_t getCurrentValue() {
      return round(currentValue);
    }

    /**
     * Update the control value state, i.e. move towards the desired target.
     *
     * @return bool true if state has changed and coresponding midi CC value should be sent
     */
    bool update(float glideSetting) {
      uint8_t previousValue = getCurrentValue();

      // No need to send midi cc if state is complete
      if(complete) {
        return false;
      }

      if(round((float)targetValue - currentValue) != 0) {
        if((float)targetValue > currentValue) {
          currentValue += glideSetting;
        } else {
          currentValue -= glideSetting;
        }
      } else {
        // We've reached zero difference between current and target
        complete = true;
      }

      if(previousValue != getCurrentValue()) {
        return true;
      } else {
        return false;
      }
    }
};

ControlChangeState ccStates[128];

void setup() {
  delay(1000); // very important bit for Access Point to work properly... ¯\_(ツ)_/¯

  Serial.begin(115200);
  Serial.println();
  Serial.println("Hello OSC2Midi!");
  Serial.println();

  WiFi.softAP("OSC2Midi", "Midi2OSCGateway");
  Serial.print("AP IP address: ");
  Serial.println(WiFi.softAPIP());

  Serial.println();
  udp.begin(8000);

  MIDI.setHandleControlChange(MidiCCToOSC);

  // The MIDI input used in project is always pulled high,
  // so don't try to "fight" and pull the input pin up as well
  pinMode(4, INPUT_PULLUP);
  pinMode(5, OUTPUT);
  midiSerialPort.begin(31250);

  glideScheduler.start();
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
    Serial.printf("MSG: %s\tCC: %u\tValue: %u\n", address, cc, value);
    //MIDI.sendControlChange(cc, value, 1);
    ccStates[cc].setTarget(value);
  } else if (msg.size() == 2 && msg.isFloat(0) && msg.isFloat(1)) {
    // XY pad, two values
    cc = getCC(address, 0);
    value = round(msg.getFloat(0));
    value = value > 127 ? 127 : value;
    Serial.printf("MSG: %s\tCC: %u\tValue: %u\n", address, cc, value);
    // MIDI.sendControlChange(cc, value, 1);
    ccStates[cc].setTarget(value);

    cc = getCC(address, 1);
    value = round(msg.getFloat(1));
    value = value > 127 ? 127 : value;
    Serial.printf("MSG: %s\tCC: %u\tValue: %u\n", address, cc, value);
    // MIDI.sendControlChange(cc, value, 1);
    ccStates[cc].setTarget(value);
  } else {
    Serial.printf("Cannot handle: %s\n", address);
  }
}

uint8_t getCC(char *str, int index) {
  // TODO: no need to use String (which uses heap allocations)
  String s = String(str);

  // drop the first /
  if (s.startsWith("/")) {
    s = s.substring(1);
  }

  if (index == -1) {
    // Index is not specified - pick the last digit then
    index = s.substring(s.lastIndexOf("/") + 1).toInt() - 1;
  }

  while (index > 0) {
    s = s.substring(s.indexOf("/") + 1);
    index--;
  }

  return s.toInt();
}

uint8_t getCC(char *str) {
  return getCC(str, -1);
}

void MidiCCToOSC(uint8_t channel, uint8_t number, uint8_t value) {
  char buffer[1024];
  snprintf(buffer, sizeof(buffer), "/midi/cc/%u", number);

  OSCMessage msg = OSCMessage(buffer);
  msg.add(value * 1.0);

  Serial.print("MidiCCToOsc: ");
  Serial.print(buffer);
  Serial.print(" ");
  Serial.println(value * 1.0);

  udp.beginPacket(clientIP, 8001);
  msg.send(udp);
  udp.endPacket();
}

void OSCSetSettings(OSCMessage &msg, int offset) {
  char address[100] = { 0 };

  msg.getAddress(address, offset, sizeof(address));

  if (msg.size() == 1 && msg.isFloat(0)) {
    if (strcmp(address, "/glide") == 0) {
      glide = msg.getFloat(0);
      Serial.printf("Setting glide to: %f\n", glide);
    }
  } else {
    Serial.printf("Cannot handle: %s\n", address);
  }
}

void glideTask() {
  for(uint8_t cc = 0; cc < 128; cc++) {
    if(ccStates[cc].update(glide)) {
      Serial.printf("Glide CC: %u\tValue: %u\n", cc, ccStates[cc].getCurrentValue());
      MIDI.sendControlChange(cc, ccStates[cc].getCurrentValue(), 1);
    }
  }
}

void loop() {
  OSCMessage msg;
  uint8_t buffer[1024];

  // Check if there are any OSC packets to handle
  size_t size = udp.parsePacket();
  if (size > 0) {
    udp.read(buffer, size);
    msg.fill(buffer, size);

    if (!msg.hasError()) {
      msg.route("/midi/cc", OSCToMidiCC);
      msg.route("/midi/settings", OSCSetSettings);
    } else {
      int error = msg.getError();
      Serial.print("error: ");
      Serial.println(error);
    }

    // Keep track of the client IP address for "talking back"
    clientIP = udp.remoteIP();
  }

  // Check if there are any CC messages from synth itself
  MIDI.read();

  glideScheduler.update();
}

