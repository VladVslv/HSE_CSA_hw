#include <stdio.h>
#include <stdlib.h>
#include <time.h>

    #define size 50
extern void createArrayB(int a_size);
    int A[size];
    int B[size];
    int b_size;
int main(int argc, char *argv[]) {
    int a_size;
    int i;
    clock_t begin;
    clock_t end;
    double time;
    FILE *input, *output;
    if (argc < 2 || atoi(argv[1]) == 0) {
        do {
            printf("Print size of array A (1 <= size <= %d): \n", size);
            scanf("%d", &a_size);
            if (a_size < 1) {
                printf("Incorrect input : size < 1 !\n\n");
            }
            else if (a_size > size) {
                printf("Incorrect input : size > %d !\n\n", size);
            }
        } while (a_size < 1 || a_size > size);
        for (i = 0; i < a_size; ++i) {
            printf("A[%d] : ", i);
            scanf("%d", A + i);
        }
    } else if (atoi(argv[1]) == 1) {
        input = fopen("input.txt", "r");
        fscanf(input, "%d", &a_size);
            if (a_size < 1) {
                printf("Incorrect input : size < 1 !\n");
                return 1;
            }
            else if (a_size > size) {
                printf("Incorrect input : size > %d !\n", size);
                return 1;
            }
        for (i = 0; i < a_size; ++i) {
            fscanf(input, "%d", A + i);
        }
    } else if (atoi(argv[1]) == 2) {
        a_size = rand() % size + 1;
        for (i = 0; i < a_size; ++i) {
            A[i] = rand() - RAND_MAX/2;
            printf("A[%d] : %d\n", i, A[i]);
        }
    }
    
    begin = clock();
    createArrayB(a_size);
    end = clock();
    time = (double)((end-begin))/ CLOCKS_PER_SEC;
    if (argc > 1 && atoi(argv[1]) == 1) {
        output = fopen("output.txt", "w");
        fprintf(output, "Time: %f sec\n", time);
        for (i = 0; i < b_size; ++i) {
            fprintf(output, "B[%d]: %d \n", i, B[i]);
            }
        return 0;
    }
    printf("\nTime: %f sec\n", time);
    for (i = 0; i < b_size; ++i) {
        printf("B[%d]: %d \n", i, B[i]);
    }
    return 0;
}
