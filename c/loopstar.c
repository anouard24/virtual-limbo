#include <stdio.h>
int main() {
    int i, j, n = 5,s=0;
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < s; j++) printf(" ");
        for(j = i; j < n; j++) printf("*");
        printf("\n");
        s++;
    }
    return 0;
}
