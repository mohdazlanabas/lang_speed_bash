using System;
using System.Diagnostics;
using System.Numerics;

class Program
{
    static BigInteger Fibonacci(int n)
    {
        if (n <= 1) return n;
        BigInteger a = 0, b = 1, temp;
        for (int i = 2; i <= n; i++)
        {
            temp = a + b;
            a = b;
            b = temp;
        }
        return b;
    }

    static void Main()
    {
        var stopwatch = Stopwatch.StartNew();
        BigInteger result = Fibonacci(100);
        stopwatch.Stop();

        long memoryUsed = GC.GetTotalMemory(false) / 1024;

        Console.WriteLine("Language: C#");
        Console.WriteLine($"Time: {stopwatch.Elapsed.TotalSeconds:F6} seconds");
        Console.WriteLine($"Memory: {memoryUsed} KB");
        Console.WriteLine($"Result: {result}");
    }
}
