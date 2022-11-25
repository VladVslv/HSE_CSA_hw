#include <stdio.h>
#include <stdlib.h>
#include <time.h>
extern double arcsin(double x);

int main(int argc, char **argv) {
    int i;
    double x;
    double res;
    clock_t begin;
    clock_t end;
    double prog_time;
    FILE *input, *output;
    
    if (argc < 2) {
        printf("Print x (-1 <= x <= 1): ");
        scanf("%lf", &x);
        while (x < -1 || x > 1) {
            printf("Incorrect input!\n\nPrint x (-1 <= x <= 1): ");
            scanf("%lf", &x);
        }
    } else if (argc >= 3) {
        input = fopen(argv[1], "r");
        if (!input) {
            printf("Input file does not exist\n");
            return 1;
        }
        fscanf(input, "%lf", &x);
        if (x > 1 || x < -1) {
            printf("\nIncorrect input (-1 <= x <= 1)!");
            return 1;
        }
    } else if (argc >= 2) {   
        x = 2.0 * (double)rand() / (double)RAND_MAX - 1.0;
    }
    
    begin = clock();
    for (i = 0; i < 4000000; ++i) {
        res = arcsin(x);
    }
    end = clock();
    prog_time = (double) (end - begin) / CLOCKS_PER_SEC;
    
    if (argc >= 3) {
        output = fopen(argv[2], "w");
        fprintf(output, "Time: %lf sec\n", prog_time);
        fprintf(output, "res = %lf \n", res);
        return 0;
    }
    if (argc >= 2) {
        output = fopen(argv[1], "w");
        fprintf(output,  "x = %lf \n", x);
        fprintf(output, "\nTime: %lf sec\n", prog_time);
        fprintf(output, "res = %lf \n", res);
        return 0;
    }
  
    printf("\nTime: %lf sec\n", prog_time);
    printf("res = %lf \n", res);
    return 0;
}
