# def fibonacci(n)
#   return 1 if n == 1
#   return 1 if n == 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end


def fibonacci(n)
  fib = [0, 1]
  next_fib = 1
  while fib[n] == nil
    next_fib += fib[-2]
    fib.push(next_fib)
  end
  next_fib
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4