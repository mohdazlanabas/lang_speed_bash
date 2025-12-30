#include <iostream>
#include <chrono>
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
    auto start = std::chrono::high_resolution_clock::now();
    long long result = fibonacci(50);
    auto end = std::chrono::high_resolution_clock::now();
    
    std::chrono::duration<double> elapsed = end - start;
    
    struct rusage usage;
    getrusage(RUSAGE_SELF, &usage);
    
    std::cout << "Language: C++" << std::endl;
    std::cout << "Time: " << elapsed.count() << " seconds" << std::endl;
    std::cout << "Memory: " << usage.ru_maxrss << " KB" << std::endl;
    std::cout << "Result: " << result << std::endl;
    
    return 0;
}
