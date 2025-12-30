<?php

function fibonacci($n) {
    if ($n <= 1) return $n;
    $a = 0;
    $b = 1;
    for ($i = 2; $i <= $n; $i++) {
        $temp = $a + $b;
        $a = $b;
        $b = $temp;
    }
    return $b;
}

$startTime = microtime(true);
$result = fibonacci(50);
$endTime = microtime(true);

$timeTaken = $endTime - $startTime;
$memoryUsed = memory_get_peak_usage(true) / 1024;

echo "Language: PHP\n";
printf("Time: %.6f seconds\n", $timeTaken);
printf("Memory: %d KB\n", $memoryUsed);
echo "Result: $result\n";
?>
