#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

// created before 28/01/2018
// its like 'time' command in linux
// it run programs and read time usage

float now(){
	struct timespec t;
	if (clock_gettime(CLOCK_MONOTONIC, &t) < 0) {
		perror("clock_gettime");
		exit(1);
	}
	return t.tv_sec + (t.tv_nsec / 1e9);
}

int main(int argc, char** argv){
	if(argc<2)	return 1;
	char *str = malloc(1000*sizeof(str));
	strcpy(str, argv[1]);
	for (int i = 2; i < argc; i++){
		strcat(str," ");
		strcat(str,argv[i]);
	}
	float start = now();
	system(str);
	float stop = now();
	printf("Terminé : %0.6f s\n", (stop - start));
	return 0;
}
