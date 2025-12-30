#!/bin/bash

fibonacci() {
    local n=$1
    if [ $n -le 1 ]; then
        echo $n
        return
    fi

    # Use bc for arbitrary precision arithmetic
    local result=$(bc <<EOF
a = 0
b = 1
for (i = 2; i <= $n; i++) {
    temp = a + b
    a = b
    b = temp
}
b
EOF
)
    echo $result
}

# Start timing
start=$(date +%s.%N)
result=$(fibonacci 100)
end=$(date +%s.%N)

# Calculate time
time_taken=$(echo "$end - $start" | bc)

# Get memory usage (RSS in KB)
memory=$(ps -o rss= -p $$)

echo "Language: Bash"
printf "Time: %.6f seconds\n" $time_taken
echo "Memory: $memory KB"
echo "Result: $result"
