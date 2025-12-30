# Fibonacci Benchmark: Cross-Language Performance Comparison

## Project Overview

This project implements a simple **iterative Fibonacci(50)** calculation across 13 popular programming languages to demonstrate relative performance characteristics. The Fibonacci sequence is calculated using iteration (not recursion) to focus on loop efficiency and basic arithmetic operations.

**Benchmark Type:** Barebone computational algorithm  
**Test Case:** Calculate the 50th Fibonacci number iteratively  
**Expected Result:** 12,586,269,025

## Languages Tested

1. C
2. C++
3. C#
4. Java
5. JavaScript (Node.js)
6. TypeScript (via ts-node)
7. Python
8. Rust
9. Go
10. Dart
11. Bash
12. PHP
13. Ruby

## Output Format

Each program outputs:
```
Language: [Language Name]
Time: [X.XXXXXX] seconds
Memory: [XXXX] KB
Result: 12586269025
```

## Prerequisites

Install the required compilers/interpreters for each language:

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

# Bash (usually pre-installed)
sudo apt install bash bc

# PHP
sudo apt install php-cli

# Ruby
sudo apt install ruby
```

**macOS (via Homebrew):**
```bash
brew install gcc mono openjdk node python rust go dart php ruby
npm install -g typescript ts-node
```

---

## Running Each Implementation

### 1. C
```bash
gcc -O2 fib.c -o fib_c
./fib_c
```

### 2. C++
```bash
g++ -O2 fib.cpp -o fib_cpp
./fib_cpp
```

### 3. C#
```bash
mcs fib.cs
mono fib.exe
```
Or with .NET Core:
```bash
dotnet run fib.cs
```

### 4. Java
```bash
javac Fib.java
java Fib
```

### 5. JavaScript
```bash
node fib.js
```

### 6. TypeScript
```bash
ts-node fib.ts
```
Or compile first:
```bash
tsc fib.ts
node fib.js
```

### 7. Python
```bash
python3 fib.py
```

### 8. Rust
```bash
rustc -O fib.rs
./fib
```

### 9. Go
```bash
go run fib.go
```
Or compile first:
```bash
go build fib.go
./fib
```

### 10. Dart
```bash
dart fib.dart
```
Or compile to native:
```bash
dart compile exe fib.dart -o fib_dart
./fib_dart
```

### 11. Bash
```bash
chmod +x fib.sh
./fib.sh
```

### 12. PHP
```bash
php fib.php
```

### 13. Ruby
```bash
ruby fib.rb
```

---

## Run All Tests (Linux/macOS)

Create a simple script to run all benchmarks:

```bash
#!/bin/bash
echo "=== Fibonacci(50) Benchmark ==="
echo ""

# C
gcc -O2 fib.c -o fib_c && ./fib_c
echo ""

# C++
g++ -O2 fib.cpp -o fib_cpp && ./fib_cpp
echo ""

# C#
mcs fib.cs && mono fib.exe
echo ""

# Java
javac Fib.java && java Fib
echo ""

# JavaScript
node fib.js
echo ""

# TypeScript
ts-node fib.ts
echo ""

# Python
python3 fib.py
echo ""

# Rust
rustc -O fib.rs && ./fib
echo ""

# Go
go run fib.go
echo ""

# Dart
dart fib.dart
echo ""

# Bash
chmod +x fib.sh && ./fib.sh
echo ""

# PHP
php fib.php
echo ""

# Ruby
ruby fib.rb
```

Save as `run_all.sh`, then:
```bash
chmod +x run_all.sh
./run_all.sh
```

---

## Expected Performance Ranking

**Fastest → Slowest (Typical):**

1. **C / C++ / Rust** - Compiled, direct machine code
2. **Go** - Compiled, efficient runtime
3. **Java / C#** - JIT-compiled, managed runtime
4. **Dart (AOT)** - Ahead-of-time compiled
5. **JavaScript / TypeScript** - V8 JIT optimization
6. **PHP / Python / Ruby** - Interpreted, dynamic typing
7. **Bash** - Shell script, slowest

**Memory Usage:**
- Compiled languages (C, C++, Rust, Go) typically use less memory
- JVM/CLR languages (Java, C#) have higher baseline due to runtime
- Interpreted languages vary based on implementation

---

## Notes

- **Optimization flags:** C/C++/Rust use `-O2` or `-O` for fair comparison
- **Memory measurement:** Methods vary by language (RSS, heap allocation, GC stats)
- **JIT warm-up:** JVM/V8 languages may be faster on repeated runs
- **Integer overflow:** Some languages use arbitrary-precision integers (Python, Ruby) vs fixed 64-bit (C, Rust)
- **System dependencies:** Results vary by CPU, OS, and installed versions

---

## Why This Benchmark?

**Iterative Fibonacci(50)** is chosen because it:
- Tests basic loop efficiency
- Involves simple integer arithmetic
- Avoids I/O overhead
- Is easy to verify (single correct answer)
- Is simple enough to implement in any language (~10-30 lines)

This is **not** a comprehensive benchmark but serves as a baseline indicator of raw computational speed differences between languages.

---

## Project Structure

```
fib-benchmark/
├── README.md          # This file
├── fib.c              # C implementation
├── fib.cpp            # C++ implementation
├── fib.cs             # C# implementation
├── Fib.java           # Java implementation
├── fib.js             # JavaScript implementation
├── fib.ts             # TypeScript implementation
├── fib.py             # Python implementation
├── fib.rs             # Rust implementation
├── fib.go             # Go implementation
├── fib.dart           # Dart implementation
├── fib.sh             # Bash implementation
├── fib.php            # PHP implementation
└── fib.rb             # Ruby implementation
```

---

## License

MIT License - Feel free to use and modify for your own benchmarking needs.

## Author

Created as a simple cross-language performance demonstration.
