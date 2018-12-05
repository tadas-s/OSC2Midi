#include "OSC2Midi.h"
#include <string.h>
#include <stdlib.h>

/*
 * TODO: this will return rather unpredictable numbers when 
 * given strings with numbers > 255.
 */
uint8_t getCC(const char *str, int index)
{
    const char *offset = str;

    // skip the first /
    if (strncmp(str, "/", strlen("/")) == 0)
    {
        offset++;
    }

    if (index == -1)
    {
        return atoi(offset);
    }

    while (index > 0)
    {
        const char *new_offset = strstr(offset, "/");
        if (new_offset) {
            offset = new_offset + 1;
        } else {
            return 0;
        }

        index--;
    }

    return atoi(offset);
}

uint8_t getCC(const char *str)
{
    return getCC(str, -1);
}