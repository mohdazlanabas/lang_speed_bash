function fibonacci(n) {
    if (n <= 1)
        return BigInt(n);
    var a = 0n, b = 1n, temp;
    for (var i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}
var startTime = process.hrtime.bigint();
var result = fibonacci(100);
var endTime = process.hrtime.bigint();
var timeSeconds = Number(endTime - startTime) / 1e9;
var memoryUsed = Math.round(process.memoryUsage().heapUsed / 1024);
console.log("Language: TypeScript");
console.log("Time: ".concat(timeSeconds.toFixed(6), " seconds"));
console.log("Memory: ".concat(memoryUsed, " KB"));
console.log("Result: ".concat(result));
