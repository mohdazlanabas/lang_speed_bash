import java.math.BigInteger;

public class Fib {
    public static BigInteger fibonacci(int n) {
        if (n <= 1) return BigInteger.valueOf(n);
        BigInteger a = BigInteger.ZERO;
        BigInteger b = BigInteger.ONE;
        BigInteger temp;
        for (int i = 2; i <= n; i++) {
            temp = a.add(b);
            a = b;
            b = temp;
        }
        return b;
    }

    public static void main(String[] args) {
        Runtime runtime = Runtime.getRuntime();
        runtime.gc();

        long startTime = System.nanoTime();
        BigInteger result = fibonacci(100);
        long endTime = System.nanoTime();

        double timeSeconds = (endTime - startTime) / 1e9;
        long memoryUsed = (runtime.totalMemory() - runtime.freeMemory()) / 1024;

        System.out.println("Language: Java");
        System.out.printf("Time: %.6f seconds%n", timeSeconds);
        System.out.println("Memory: " + memoryUsed + " KB");
        System.out.println("Result: " + result);
    }
}
