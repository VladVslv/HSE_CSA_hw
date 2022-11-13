#include <stdio.h>
#include <stdbool.h>

extern int A[];
extern int B[];
extern int A_B[];
extern int B_A[];

void getResult(int size_of_array) {
    int j = 0;
    for (j = 0; j < size_of_array; ++j) {
        if(A[j] == 0 && B[j] != 0){
             B_A[j] = 1;
        }
        if(A[j] != 0 && B[j] == 0){
             A_B[j] = 1;
        }
    }
}
