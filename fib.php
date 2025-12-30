<?php

function fibonacci($n) {
    if ($n <= 1) return gmp_init($n);
    $a = gmp_init(0);
    $b = gmp_init(1);
    for ($i = 2; $i <= $n; $i++) {
        $temp = gmp_add($a, $b);
        $a = $b;
        $b = $temp;
    }
    return $b;
}

$startTime = microtime(true);
$result = fibonacci(100);
$endTime = microtime(true);

$timeTaken = $endTime - $startTime;
$memoryUsed = memory_get_peak_usage(true) / 1024;

echo "Language: PHP\n";
printf("Time: %.6f seconds\n", $timeTaken);
printf("Memory: %d KB\n", $memoryUsed);
echo "Result: " . gmp_strval($result) . "\n";
?>
