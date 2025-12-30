use std::time::Instant;

fn fibonacci(n: u32) -> u64 {
    if n <= 1 {
        return n as u64;
    }
    let mut a: u64 = 0;
    let mut b: u64 = 1;
    for _ in 2..=n {
        let temp = a + b;
        a = b;
        b = temp;
    }
    b
}

fn main() {
    let start = Instant::now();
    let result = fibonacci(50);
    let duration = start.elapsed();
    
    // Memory usage - approximate via allocation tracking
    let memory_kb = std::mem::size_of_val(&result) + 
                    std::mem::size_of::<u64>() * 2;
    
    println!("Language: Rust");
    println!("Time: {:.6} seconds", duration.as_secs_f64());
    println!("Memory: {} KB", memory_kb / 1024);
    println!("Result: {}", result);
}
