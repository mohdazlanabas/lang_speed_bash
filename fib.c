#include <stdio.h>
#include <time.h>
#include <sys/resource.h>

__uint128_t fibonacci(int n) {
    if (n <= 1) return n;
    __uint128_t a = 0, b = 1, temp;
    for (int i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

void print_uint128(__uint128_t n) {
    if (n == 0) {
        printf("0");
        return;
    }
    char buffer[40];
    int i = 39;
    buffer[i] = '\0';
    while (n > 0 && i > 0) {
        buffer[--i] = '0' + (n % 10);
        n /= 10;
    }
    printf("%s", &buffer[i]);
}

int main() {
    struct timespec start, end;
    struct rusage usage;

    clock_gettime(CLOCK_MONOTONIC, &start);
    __uint128_t result = fibonacci(100);
    clock_gettime(CLOCK_MONOTONIC, &end);
    
    double time_taken = (end.tv_sec - start.tv_sec) + 
                        (end.tv_nsec - start.tv_nsec) / 1e9;
    
    getrusage(RUSAGE_SELF, &usage);
    long memory_kb = usage.ru_maxrss;

    printf("Language: C\n");
    printf("Time: %.6f seconds\n", time_taken);
    printf("Memory: %ld KB\n", memory_kb);
    printf("Result: ");
    print_uint128(result);
    printf("\n");

    return 0;
}
