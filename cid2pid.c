#include <stdlib.h>
#include <unistd.h>
#include <tracefs.h>

int main(int argc, char *argv[])
{
        int pid;
	int cid;
	if(argc != 2) {
		fprintf(stderr, "Usage:\n  %s <cid>\n", argv[0]);
		exit(-1);
	}

	cid = atoi(argv[1]);

        pid = tracefs_find_cid_pid(cid);
        if (pid >= 0) {
                printf("cid: %u\npid: %d\n", cid, pid);
        	exit(0);
	}
	exit(-1);
}
