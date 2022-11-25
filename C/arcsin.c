#include <stdio.h>
#include <math.h>
#define accuracy 0.0005
double arcsin(double x) {
    double res = 0;
    int n = 0;
    double last = x;
    do {
        res += last;
        ++n;
        last = last * x * x * (2.0 * n - 1.0) * (2.0 * n) * (2.0 * n - 1.0)/ (4.0 * n * n * (2.0 * n + 1.0));
    } while (fabs(last) > fabs(accuracy*res));
    return res;
}
