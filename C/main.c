#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>
#define size_of_array 128

extern void getResult();
int A[size_of_array];
int B[size_of_array];
int A_B[size_of_array];
int B_A[size_of_array];

int mygetch( ) {
    struct termios oldt, newt;
    int ch;
    tcgetattr( STDIN_FILENO, &oldt );
    newt = oldt;
    newt.c_lflag &= ~( ICANON | ECHO );
    tcsetattr( STDIN_FILENO, TCSANOW, &newt );
    ch = getchar();
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt );
    return ch;
}
int main(int argc, char *argv[]) {
    char temp_char;
    int temp_int;
    int i;
    clock_t begin;
    clock_t end;
    double prog_time;
    FILE *input, *output;
    for (i = 0; i < size_of_array; ++i) {
            A[i] = 0;
            B[i] = 0;
            A_B[i] = 0;
            B_A[i] = 0;
    }
        
    if (argc < 2 || atoi(argv[1]) == 0) {
        printf("A: ");
        while(true){
            temp_int = mygetch();
            if(temp_int == 4){
                 break;
            }
            putc((char)temp_int, stdout);
            A[temp_int] = 1;
        }
        printf("\nB: ");
        while(true){
            temp_int = mygetch();
            if(temp_int == 4){
                 break;
            }
            putc(temp_int, stdout);
            B[temp_int] = 1;
        }
    } else if (atoi(argv[1]) == 1) {
        input = fopen("A.txt", "r");
        while(true){
            temp_char = getc(input);
            if(temp_char == EOF){
                 break;
            }
            A[(int)temp_char+0] = 1;
        }
        input = fopen("B.txt", "r");
        while(true){
            temp_char = getc(input);
            if(temp_char == EOF){
                 break;
            }
            B[(int)temp_char+0] = 1;
        }
    } else if (atoi(argv[1]) == 2) {
        for (i = 33; i < size_of_array; ++i) {
            A[i] = (rand()) % 2;
            B[i] = (rand()) % 2;
        }
        printf("A: ");
        for (i = 0; i < size_of_array; ++i) {
            if(A[i]!=0){
                printf("%c", i+0);
            }
        }
        printf("\nB: ");
        for (i = 0; i < size_of_array; ++i) {
            if(B[i]!=0){
                printf("%c", i+0);
            }
        }
    }
    
    begin = clock();
    for (i = 0; i < 3000000; ++i) {
        getResult(size_of_array);
    }
    
    end = clock();
    prog_time = (double) (end - begin) / CLOCKS_PER_SEC;
    
    if (argc > 1 && atoi(argv[1]) == 1) {
        output = fopen("output.txt", "w");
        fprintf(output, "Time: %f sec", prog_time);
        fprintf(output, "\nA-B: ");
        for (i = 0; i < size_of_array; ++i) {
            if(A_B[i]!=0){
                fprintf(output, "%c", i+0);
            }
        }
        fprintf(output, "\nB-A: ");
        for (i = 0; i < size_of_array; ++i) {
            if(B_A[i]!=0){
                fprintf(output, "%c", i+0);
            }
        }
        return 0;
    }
    
    printf("\n\nTime: %f sec\n", prog_time);
    printf("A-B: ");
    for (i = 0; i < size_of_array; ++i) {
        if(A_B[i]!=0){
             printf("%c", i+0);
        }
    }
    printf("\nB-A: ");
    for (i = 0; i < size_of_array; ++i) {
        if(B_A[i]!=0){
             printf("%c", i+0);
        }
    }
    printf("\n");
    return 0;
}
