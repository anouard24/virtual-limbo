#include <stdio.h>

int main(void){
	int a[20] = {0};
	for (int i = 0; i < 20; ++i)
	{
		printf("%d, ",a[i]);
	}
	a[23] = 0;
	printf("\n%d",a[23]);
	printf("\n%d",a[24]);
	printf("\n%d\n",a[51]);
}
