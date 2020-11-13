#include <stdio.h>

// an efficient way to calculate power of a number
// created before 10/11/2017

float expo(float z,int s){
	if(s==0) return 1;
	if(s%2==0){
		float x = expo(z,s/2);
		return x*x;
	}
	else{
		float y = expo(z,(s-1)/2);
		return y*y*z;
	}
}

int main(void){
	float a;
	int b;
	printf("Hello! enter a float and an integer\n");
	scanf("%f %d",&a,&b);
	float q = expo(a,b);
	printf("\n%f\n",q);
}
