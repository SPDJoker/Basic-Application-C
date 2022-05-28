#ifndef _JOKER_DEBUG_H_
#define _JOKER_DEBUG_H_

#ifdef __cplusplus
extern "C" {
#endif

#define DCOLOR_RESET        "\x1B[0m"
#define DCOLOR_RED          "\x1B[31m"
#define DCOLOR_GREEN        "\x1B[32m"
#define DCOLOR_YELLOW       "\x1B[33m"
#define DCOLOR_BLUE         "\x1B[34m"
#define DCOLOR_MAGENTA      "\x1B[35m"
#define DCOLOR_CYAN         "\x1B[36m"
#define DCOLOR_WHITE        "\x1B[37m"

void debugLogc(const char *msg, const char *DCOLOR);
void debugLog(const char *msg);
void debugErr(const char *msg);

#ifdef __cplusplus
}
#endif

#endif