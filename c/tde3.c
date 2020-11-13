#include <stdio.h>
// I was still learning C
// In this time I don't know how to use functions
// with functions it will be great
// last modification of code logic: 29/11/2016

int main() {
    int i,k,j,n,m,N;
    float T[100],M,S=0,min,max,p,occ;
    printf("entrer le nombre des etudiants :\t");
    scanf("%d",&n);
    if (n<1||n>100) {
        printf("retaper le nombre des etudiants: \t");
        scanf("%d",&n);
    } else {
        //saisi et affichage des notes
        for (i=0; i<n; i++) {
            printf("entrer les notes des etudiants : \t");
            scanf("%f",&T[i]);
        }
        for (i=0; i<n; i++) {
            printf("T[%d] = %.2f\n",i,T[i]);
        }
        //calcule et affichage de la moyenne des notes
        for(i=0; i<n; i++) {
            S=S+T[i];
        }
        M=S/n;
        printf("la moyenne de notes est : %2f\n",M);
        // recherche et afichage de la notes minimal
        min=T[0];
        k=0;
        for (i=1; i<n; i++)
            if (T[i]<min) {
                min=T[i];
                k=i;
            }
        printf("la note minimal est T[%d]=%.1f\n",k,min);
    }
    // recherche et affichage de la note maximal
    max=T[0];
    for (i=1; i<n; i++) {
        if (T[i]>max)
            max=T[i];
        k=i;
    }
    printf("la note maximale  est T[%d]=%f\n",k,max);
    // recherche d'une note s'elle existe dans le tableau et le nombre doccurennce
    k=0;
    printf("entrer la note a chercher:\t ");
    scanf("%f",&p);
    for ( i=0; i<n; i++) {
        if (T[i]==p)
            k=k+1;
    }
    if (k==0)
        printf("la note cherche n'existe plus dans ce tableau\n");
    else
        printf("la note existe %d fois\n",k);
    // modification d'une note connaissant son indice
    printf("entrer lindice du note: ");
    scanf("%d",&m);
    if (m<0||m>=n)
        printf("lindice est hors de tableau :  ");
    else {
        printf("entrer la nouvelle valeur : \n ");
        scanf("%d/n",&N);
        T[m]=N;
    }
    for (i=0; i<n; i++)
        printf("T[%d]=%.2f\n",i,T[i]);
    // tri du tableau en ordre croissant (tri par selection)
    for  (i=1; i<n; i++) {
        min=T[i-1];
        for (j=i; j<n; j++) {
            if (T[j]<min) {
                min=T[j];
                k=j;
            }
        }
        T[k]=T[i-1];
        T[i-1]=min;
    }
    for (i=0; i<n; i++)
        printf("nouveauT[%d]=%.2f\t",i,T[i]);

}
