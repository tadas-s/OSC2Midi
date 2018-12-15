#ifndef DEBUG_H
#define DEBUG_H

#ifdef DEBUG

#define DEBUG_ESP_PORT Serial1
#define DEBUG_MSG(...) Serial1.printf( __VA_ARGS__ )

#define DEBUG_OSC_MESSAGE(msg) \
    do { \
        char address[100]; \
        msg.getAddress(address, 0, sizeof(address)); \
        Serial1.printf("osc message: [%d] %s ", msg.size(), address); \
        for (int i = 0; i < msg.size(); i++) { \
            if (msg.isFloat(i)) { Serial1.printf("f:%f\t", msg.getFloat(i)); } \
            if (msg.isInt(i)) { Serial1.printf("i:%d\t", msg.getInt(i)); } \
        } \
        Serial1.printf("\n"); \
    } while(0);

#else
#define DEBUG_MSG(...)
#define DEBUG_OSC_MESSAGE(...)
#endif

#endif