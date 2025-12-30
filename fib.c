#include <stdio.h>
#include <time.h>
#include <sys/resource.h>

long long fibonacci(int n) {
    if (n <= 1) return n;
    long long a = 0, b = 1, temp;
    for (int i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

int main() {
    struct timespec start, end;
    struct rusage usage;
    
    clock_gettime(CLOCK_MONOTONIC, &start);
    long long result = fibonacci(50);
    clock_gettime(CLOCK_MONOTONIC, &end);
    
    double time_taken = (end.tv_sec - start.tv_sec) + 
                        (end.tv_nsec - start.tv_nsec) / 1e9;
    
    getrusage(RUSAGE_SELF, &usage);
    long memory_kb = usage.ru_maxrss;
    
    printf("Language: C\n");
    printf("Time: %.6f seconds\n", time_taken);
    printf("Memory: %ld KB\n", memory_kb);
    printf("Result: %lld\n", result);
    
    return 0;
}
