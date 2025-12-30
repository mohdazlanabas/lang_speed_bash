import 'dart:io';

BigInt fibonacci(int n) {
  if (n <= 1) return BigInt.from(n);
  BigInt a = BigInt.zero, b = BigInt.one, temp;
  for (int i = 2; i <= n; i++) {
    temp = a + b;
    a = b;
    b = temp;
  }
  return b;
}

void main() {
  final stopwatch = Stopwatch()..start();
  final result = fibonacci(100);
  stopwatch.stop();

  final memoryInfo = ProcessInfo.currentRss;
  final memoryKB = memoryInfo ~/ 1024;

  print('Language: Dart');
  print('Time: ${(stopwatch.elapsedMicroseconds / 1000000).toStringAsFixed(6)} seconds');
  print('Memory: $memoryKB KB');
  print('Result: $result');
}
