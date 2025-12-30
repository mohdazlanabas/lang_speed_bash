# readme.md

**Created:** December 30, 2025
**GitHub Repository:** git@github.com:mohdazlanabas/lang_speed_bash.git

---

**Developed by:** net1io.com
**Copyright (C) 2020**

---

## Fibonacci(100) Cross-Language Performance Benchmark

### App Introduction

This application implements a computational benchmark to compare the performance of 13 popular programming languages by calculating the 100th Fibonacci number using an iterative algorithm. The benchmark measures execution time, memory usage, and demonstrates how different languages handle arbitrary-precision arithmetic required for large integer calculations.

**Benchmark Details:**
- **Algorithm:** Iterative Fibonacci calculation (not recursive)
- **Test Case:** Calculate Fibonacci(100)
- **Expected Result:** 354,224,848,179,261,915,075
- **Purpose:** Compare raw computational speed and memory efficiency across languages

### App Architecture

The application follows a simple, parallelized architecture:

```
┌─────────────────┐
│   run_all.sh    │  ← Master orchestration script
└────────┬────────┘
         │
         ├──→ Compiles/runs each language implementation in sequence
         │
         ├──→ Each implementation:
         │    1. Starts timing
         │    2. Calculates Fibonacci(100)
         │    3. Measures memory usage
         │    4. Outputs results
         │
         └──→ Aggregates output for comparison
```

**Key Design Principles:**
- Each language implementation is standalone
- Consistent output format for easy comparison
- Uses native big integer libraries where needed
- Optimized compilation flags for compiled languages

### App Language and Frameworks

| Language   | Version/Runtime | Big Integer Library |
|------------|----------------|---------------------|
| C          | GCC/Clang      | `__uint128_t`       |
| C++        | GCC/Clang      | `__uint128_t`       |
| C#         | .NET/Mono      | `System.Numerics.BigInteger` |
| Java       | OpenJDK 11+    | `java.math.BigInteger` |
| JavaScript | Node.js 14+    | `BigInt` (native)   |
| TypeScript | ts-node        | `BigInt` (native)   |
| Python     | Python 3.8+    | Native (unlimited precision) |
| Rust       | 1.70+          | `u128` (native)     |
| Go         | 1.18+          | `math/big`          |
| Dart       | 2.17+          | `BigInt` (native)   |
| Bash       | 5.0+           | `bc` (calculator)   |
| PHP        | 7.4+/8.0+      | GMP (GNU Multiple Precision) |
| Ruby       | 2.7+/3.0+      | Native (unlimited precision) |

### App File Structure

```
lang_speed/
├── readme.md              # This file
├── .gitignore            # Git ignore rules
│
├── fib.c                 # C implementation (uses __uint128_t)
├── fib.cpp               # C++ implementation (uses __uint128_t)
├── fib.cs                # C# implementation (uses BigInteger)
├── Fib.java              # Java implementation (uses BigInteger)
├── fib.js                # JavaScript implementation (uses BigInt)
├── fib.ts                # TypeScript implementation (uses BigInt)
├── fib.py                # Python implementation (native big int)
├── fib.rs                # Rust implementation (uses u128)
├── fib.go                # Go implementation (uses math/big)
├── fib.dart              # Dart implementation (uses BigInt)
├── fib.sh                # Bash implementation (uses bc)
├── fib.php               # PHP implementation (uses GMP)
├── fib.rb                # Ruby implementation (native big int)
│
├── run_all.sh            # Master script to run all benchmarks
│
├── fib_c                 # Compiled C binary (generated)
├── fib_cpp               # Compiled C++ binary (generated)
├── fib                   # Compiled Rust binary (generated)
└── Fib.class             # Compiled Java class (generated)
```

### App Compiling Steps

#### Prerequisites

**macOS (via Homebrew):**
```bash
brew install gcc mono openjdk node python rust go dart php ruby bc
npm install -g typescript ts-node
```

**Ubuntu/Debian:**
```bash
# C/C++
sudo apt install build-essential

# C#
sudo apt install mono-mcs

# Java
sudo apt install default-jdk

# JavaScript/TypeScript
sudo apt install nodejs npm
npm install -g typescript ts-node

# Python
sudo apt install python3

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Go
sudo apt install golang-go

# Dart
sudo apt install dart

# Bash
sudo apt install bash bc

# PHP (with GMP support)
sudo apt install php-cli php-gmp

# Ruby
sudo apt install ruby
```

#### Compilation Commands

**C:**
```bash
gcc -O2 fib.c -o fib_c
```

**C++:**
```bash
g++ -O2 fib.cpp -o fib_cpp
```

**C#:**
```bash
mcs fib.cs
# Or with .NET Core:
dotnet build fib.cs
```

**Java:**
```bash
javac Fib.java
```

**Rust:**
```bash
rustc -O fib.rs
```

**Go (optional - can use `go run`):**
```bash
go build fib.go
```

**Dart (optional - can run interpreted):**
```bash
dart compile exe fib.dart -o fib_dart
```

**TypeScript (optional - can use ts-node):**
```bash
tsc fib.ts
```

### App Run Steps

#### Run Individual Implementations

**C:**
```bash
./fib_c
```

**C++:**
```bash
./fib_cpp
```

**C#:**
```bash
mono fib.exe
# Or with .NET Core:
dotnet run fib.cs
```

**Java:**
```bash
java Fib
```

**JavaScript:**
```bash
node fib.js
```

**TypeScript:**
```bash
ts-node fib.ts
# Or if compiled:
node fib.js
```

**Python:**
```bash
python3 fib.py
```

**Rust:**
```bash
./fib
```

**Go:**
```bash
go run fib.go
# Or if compiled:
./fib
```

**Dart:**
```bash
dart fib.dart
# Or if compiled:
./fib_dart
```

**Bash:**
```bash
chmod +x fib.sh
./fib.sh
```

**PHP:**
```bash
php fib.php
```

**Ruby:**
```bash
ruby fib.rb
```

#### Run All Benchmarks

Execute all language implementations sequentially:
```bash
chmod +x run_all.sh
./run_all.sh
```

**Expected Output Format:**
```
Language: [Language Name]
Time: [X.XXXXXX] seconds
Memory: [XXXX] KB
Result: 354224848179261915075
```

### Suggested Testing

#### Verify Correctness
All implementations should output the same result:
```
Result: 354224848179261915075
```

You can verify this is correct using Python:
```bash
python3 -c "a,b=0,1; exec('a,b=b,a+b;'*99); print(b)"
```

#### Performance Testing

1. **Single Run Test:**
   ```bash
   ./run_all.sh
   ```

2. **Multiple Run Average (recommended):**
   ```bash
   for i in {1..5}; do
     echo "=== Run $i ==="
     ./run_all.sh
     echo ""
   done
   ```

3. **Test Individual Language:**
   ```bash
   # Example: Test Rust 10 times
   for i in {1..10}; do ./fib; done
   ```

4. **Compare Compiled vs Interpreted:**
   ```bash
   # Compiled languages (typically faster)
   ./fib_c
   ./fib_cpp
   ./fib

   # Interpreted languages
   python3 fib.py
   ruby fib.rb
   php fib.php
   ```

#### Memory Profiling

Each implementation includes basic memory measurement, but for detailed profiling:

**Linux (using valgrind):**
```bash
valgrind --tool=massif ./fib_c
```

**macOS (using leaks):**
```bash
leaks --atExit -- ./fib_c
```

**Cross-platform (using time):**
```bash
/usr/bin/time -v ./fib_c  # Linux
/usr/bin/time -l ./fib_c  # macOS
```

### Performance Expectations

**Typical Performance Ranking (Fastest → Slowest):**

1. **C / C++ / Rust** - Compiled to native machine code, minimal overhead
2. **Go** - Compiled with efficient runtime, good performance
3. **Java / C#** - JIT-compiled, managed runtime (slower startup, fast execution)
4. **Dart (AOT compiled)** - Ahead-of-time compilation option
5. **JavaScript / TypeScript** - V8 JIT optimization (Node.js)
6. **PHP / Python / Ruby** - Interpreted, dynamic typing
7. **Bash** - Shell scripting (slowest, uses external bc process)

**Memory Usage Patterns:**
- **Lowest:** C, C++, Rust, Go (direct memory control)
- **Medium:** JavaScript/TypeScript, Dart (optimized VMs)
- **Higher:** Java, C# (JVM/CLR overhead)
- **Variable:** Python, Ruby, PHP (depends on implementation)

### Notes and Considerations

**Algorithm Complexity:**
- Time Complexity: O(n) - linear with Fibonacci number
- Space Complexity: O(1) - constant space (only 2-3 variables)

**Integer Overflow Handling:**
- Fibonacci(100) = 354,224,848,179,261,915,075 (39 digits)
- This exceeds 64-bit integer max (19 digits)
- All implementations use appropriate big integer types

**Optimization Flags:**
- C/C++: `-O2` (level 2 optimization)
- Rust: `-O` (equivalent to `-O2`)
- Go: default optimization in compiled mode
- Others: runtime/JIT optimizations

**System Dependencies:**
- Results vary by CPU architecture (x86_64, ARM)
- OS scheduler affects timing
- Background processes impact results
- First run may include JIT warm-up overhead

### Troubleshooting

**Common Issues:**

1. **C/C++: `__uint128_t` not found**
   - Only available on 64-bit systems with GCC/Clang
   - Use alternative big integer library if needed

2. **PHP: GMP extension not found**
   ```bash
   sudo apt install php-gmp  # Ubuntu
   brew install php          # macOS (includes GMP)
   ```

3. **Bash: bc command not found**
   ```bash
   sudo apt install bc       # Ubuntu
   brew install bc           # macOS
   ```

4. **Java: Class not found**
   - Ensure class name matches filename (Fib.java → Fib.class)

5. **TypeScript: ts-node not found**
   ```bash
   npm install -g ts-node typescript
   ```

### Benchmarking Best Practices

1. **Close unnecessary applications** before running benchmarks
2. **Run multiple iterations** and take the average
3. **Warm up JIT-compiled languages** (run once before measuring)
4. **Use consistent system state** (same background load)
5. **Consider CPU frequency scaling** (may affect results)
6. **Test on same hardware** for fair comparison

### Use Cases

This benchmark is useful for:
- **Language selection** for compute-intensive applications
- **Educational purposes** to understand language performance characteristics
- **Runtime comparison** across different language ecosystems
- **Understanding big integer** performance implications

**Not suitable for:**
- Real-world application performance (too simple)
- I/O-heavy workload comparison
- Concurrent/parallel processing benchmarks
- Memory-intensive application testing

### Future Enhancements

Potential improvements to this benchmark:
- Add more languages (Haskell, Kotlin, Swift, Zig, etc.)
- Implement recursive version for comparison
- Add multithreaded implementations
- Create graphical performance charts
- Add Docker containers for consistent environments
- Implement matrix exponentiation method O(log n)
- Add automated CI/CD benchmarking

### Additional Resources

- [Fibonacci Sequence - Wikipedia](https://en.wikipedia.org/wiki/Fibonacci_number)
- [Big O Notation](https://en.wikipedia.org/wiki/Big_O_notation)
- [Language Benchmarks](https://benchmarksgame-team.pages.debian.net/benchmarksgame/)

### License

MIT License - Feel free to use and modify for your own benchmarking needs.

---

**Last Updated:** December 30, 2025
**Maintained by:** net1io.com
