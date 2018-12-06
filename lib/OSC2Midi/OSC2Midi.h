#ifndef OSC2MIDI_H
#define OSC2MIDI_H

#include <cstdint>

uint8_t getCC(const char *str, int index);
uint8_t getCC(const char *str);

#endif