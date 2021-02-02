#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <errno.h>
#include <time.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <err.h>

typedef unsigned long Ulong;

#include "param.h"
#include "freq_table.h"

#include "mmap.c"
#include "fpga_ctrl.c"
#include "chord.c"
#include "demo_music.c"

void manage_data(char *);
