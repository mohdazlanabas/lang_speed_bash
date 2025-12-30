function fibonacci(n) {
    if (n <= 1) return n;
    let a = 0n, b = 1n, temp;
    for (let i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

const startTime = process.hrtime.bigint();
const result = fibonacci(100);
const endTime = process.hrtime.bigint();

const timeSeconds = Number(endTime - startTime) / 1e9;
const memoryUsed = Math.round(process.memoryUsage().heapUsed / 1024);

console.log("Language: JavaScript");
console.log(`Time: ${timeSeconds.toFixed(6)} seconds`);
console.log(`Memory: ${memoryUsed} KB`);
console.log(`Result: ${result}`);
