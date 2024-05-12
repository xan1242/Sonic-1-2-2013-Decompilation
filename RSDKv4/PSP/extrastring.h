#include <string.h>
#include <ctype.h>

inline char *strsep(char **stringp, const char *delim) {
    char *start = *stringp;
    char *end;

    if (start == NULL) {
        return NULL;
    }

    end = strpbrk(start, delim);

    if (end != NULL) {
        *end++ = '\0';
        *stringp = end;
    } else {
        *stringp = NULL;
    }

    return start;
}

int strcasecmp(const char *s1, const char *s2) {
    while (*s1 && *s2) {
        int diff = tolower((unsigned char)*s1) - tolower((unsigned char)*s2);
        if (diff != 0) {
            return diff;
        }
        s1++;
        s2++;
    }

    return tolower((unsigned char)*s1) - tolower((unsigned char)*s2);
}