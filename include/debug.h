#ifndef DEBUG_H
#define DEBUG_H

#ifdef DEBUG
#define DEBUG_ESP_PORT Serial1
#define DEBUG_MSG(...) Serial1.printf( __VA_ARGS__ )
#else
#define DEBUG_MSG(...)
#endif

#endif