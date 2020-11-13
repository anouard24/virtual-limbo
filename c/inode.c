#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    struct stat sb;
    long int inode;
    if (argc != 2) {
        fprintf(stderr, "syntax: %s <file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    if (stat(argv[1], &sb) == -1) {
        perror("stat");
        exit(EXIT_FAILURE);
    }
    inode = (long) sb.st_ino;
    printf("Inode number: %ld\n", inode);

    return 0;
}
