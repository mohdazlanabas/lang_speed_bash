#include <iostream>
#include <chrono>
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

std::ostream& operator<<(std::ostream& os, __uint128_t n) {
    if (n == 0) {
        os << "0";
        return os;
    }
    char buffer[40];
    int i = 39;
    buffer[i] = '\0';
    while (n > 0 && i > 0) {
        buffer[--i] = '0' + (n % 10);
        n /= 10;
    }
    os << &buffer[i];
    return os;
}

int main() {
    auto start = std::chrono::high_resolution_clock::now();
    __uint128_t result = fibonacci(100);
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
