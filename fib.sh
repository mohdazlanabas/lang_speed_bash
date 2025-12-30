#!/bin/bash

fibonacci() {
    local n=$1
    if [ $n -le 1 ]; then
        echo $n
        return
    fi
    
    local a=0
    local b=1
    local temp
    
    for ((i=2; i<=n; i++)); do
        temp=$((a + b))
        a=$b
        b=$temp
    done
    
    echo $b
}

# Start timing
start=$(date +%s.%N)
result=$(fibonacci 50)
end=$(date +%s.%N)

# Calculate time
time_taken=$(echo "$end - $start" | bc)

# Get memory usage (RSS in KB)
memory=$(ps -o rss= -p $$)

echo "Language: Bash"
printf "Time: %.6f seconds\n" $time_taken
echo "Memory: $memory KB"
echo "Result: $result"
