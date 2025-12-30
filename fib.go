package main

import (
    "fmt"
    "runtime"
    "time"
)

func fibonacci(n int) uint64 {
    if n <= 1 {
        return uint64(n)
    }
    var a, b uint64 = 0, 1
    for i := 2; i <= n; i++ {
        a, b = b, a+b
    }
    return b
}

func main() {
    var m runtime.MemStats
    runtime.ReadMemStats(&m)
    
    start := time.Now()
    result := fibonacci(50)
    elapsed := time.Since(start)
    
    runtime.ReadMemStats(&m)
    memoryKB := m.Alloc / 1024
    
    fmt.Println("Language: Go")
    fmt.Printf("Time: %.6f seconds\n", elapsed.Seconds())
    fmt.Printf("Memory: %d KB\n", memoryKB)
    fmt.Printf("Result: %d\n", result)
}
