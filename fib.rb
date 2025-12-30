def fibonacci(n)
  return n if n <= 1
  a, b = 0, 1
  (2..n).each do
    a, b = b, a + b
  end
  b
end

start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
result = fibonacci(50)
end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

time_taken = end_time - start_time

# Get memory usage in KB
memory_kb = `ps -o rss= -p #{Process.pid}`.to_i

puts "Language: Ruby"
puts format("Time: %.6f seconds", time_taken)
puts "Memory: #{memory_kb} KB"
puts "Result: #{result}"
