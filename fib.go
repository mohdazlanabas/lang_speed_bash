package main

import (
    "fmt"
    "math/big"
    "runtime"
    "time"
)

func fibonacci(n int) *big.Int {
    if n <= 1 {
        return big.NewInt(int64(n))
    }
    a := big.NewInt(0)
    b := big.NewInt(1)
    temp := big.NewInt(0)
    for i := 2; i <= n; i++ {
        temp.Add(a, b)
        a.Set(b)
        b.Set(temp)
    }
    return b
}

func main() {
    var m runtime.MemStats
    runtime.ReadMemStats(&m)

    start := time.Now()
    result := fibonacci(100)
    elapsed := time.Since(start)

    runtime.ReadMemStats(&m)
    memoryKB := m.Alloc / 1024

    fmt.Println("Language: Go")
    fmt.Printf("Time: %.6f seconds\n", elapsed.Seconds())
    fmt.Printf("Memory: %d KB\n", memoryKB)
    fmt.Printf("Result: %s\n", result.String())
}
