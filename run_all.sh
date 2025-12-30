#!/bin/bash
    echo "=== Fibonacci(100) Benchmark ==="
    echo "Running from fastest to slowest (expected)..."
    echo ""

    # 1. C - Compiled to native machine code
    gcc -O2 fib.c -o fib_c && ./fib_c
    echo ""

    # 2. C++ - Compiled to native machine code
    g++ -O2 fib.cpp -o fib_cpp && ./fib_cpp
    echo ""

    # 3. Rust - Compiled to native machine code
    rustc -O fib.rs && ./fib
    echo ""

    # 4. Go - Compiled with efficient runtime
    go run fib.go
    echo ""

    # 5. Java - JIT-compiled, managed runtime
    javac Fib.java && java Fib
    echo ""

    # 6. C# - JIT-compiled, managed runtime
    mcs fib.cs -r:System.Numerics.dll && mono fib.exe
    echo ""

    # 7. Dart - AOT compiled option
    if command -v dart &> /dev/null; then
        dart fib.dart
        echo ""
    else
        echo "Dart not installed - skipping"
        echo ""
    fi

    # 8. JavaScript - V8 JIT optimization
    node fib.js
    echo ""

    # 9. TypeScript - V8 JIT optimization
    ts-node fib.ts
    echo ""

    # 10. Python - Interpreted, dynamic typing
    python3 fib.py
    echo ""

    # 11. PHP - Interpreted, dynamic typing
    php fib.php
    echo ""

    # 12. Ruby - Interpreted, dynamic typing
    ruby fib.rb
    echo ""

    # 13. Bash - Shell scripting (slowest)
    chmod +x fib.sh && ./fib.sh
