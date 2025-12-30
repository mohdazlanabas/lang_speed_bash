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
