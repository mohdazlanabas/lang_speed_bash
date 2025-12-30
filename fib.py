import time
import tracemalloc

def fibonacci(n):
    if n <= 1:
        return n
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b

tracemalloc.start()
start_time = time.perf_counter()
result = fibonacci(50)
end_time = time.perf_counter()
current, peak = tracemalloc.get_traced_memory()
tracemalloc.stop()

time_taken = end_time - start_time
memory_kb = peak // 1024

print("Language: Python")
print(f"Time: {time_taken:.6f} seconds")
print(f"Memory: {memory_kb} KB")
print(f"Result: {result}")
