#include <stdio.h>
extern int A[];
extern int B[];
extern int b_size;
void createArrayB(int a_size) {
    int i_A;
    int k;
    for(k=0; k<10000000; ++k){
    	int sum = 0;
    	b_size = 0;
    	for (i_A = 0; i_A < a_size; i_A+=2) {
     	   sum+=A[i_A];
    	}
    	for (i_A = 0; i_A < a_size; ++i_A) {
    	    if (A[i_A] < sum) {
     	           B[b_size] = A[i_A];
     	           ++b_size;
     	       }
   	 }
    }
}
