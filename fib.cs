using System;
using System.Diagnostics;

class Program
{
    static long Fibonacci(int n)
    {
        if (n <= 1) return n;
        long a = 0, b = 1, temp;
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
        long result = Fibonacci(50);
        stopwatch.Stop();
        
        long memoryUsed = GC.GetTotalMemory(false) / 1024;
        
        Console.WriteLine("Language: C#");
        Console.WriteLine($"Time: {stopwatch.Elapsed.TotalSeconds:F6} seconds");
        Console.WriteLine($"Memory: {memoryUsed} KB");
        Console.WriteLine($"Result: {result}");
    }
}
