#include "joker/utils/Debug.h"
#include <stdio.h>

void debugLogc(const char *msg, const char *DCOLOR) {
    printf("%s%s\n" DCOLOR_RESET, DCOLOR, msg);
}

void debugLog(const char *msg) {
    printf("%s\n", msg);
}

void debugErr(const char *msg) {
    printf(DCOLOR_YELLOW "[ERROR] %s\n" DCOLOR_RESET, msg);
}