#ifndef _DARKNET_ENV_
#define _DARKNET_ENV_

#include <stdlib.h>

static char *DEFAULT_BACKUP_DIRECTORY = "/tmp/";

char* get_backup_directory() {
   char *dir = getenv("DARKNET_BACKUP_DIR");
   if (!dir) dir = DEFAULT_BACKUP_DIRECTORY;
   return dir;
}
#endif
