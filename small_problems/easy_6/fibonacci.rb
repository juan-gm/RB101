# Write a method that calculates and returns the index of
# the first Fibonacci number that has the number of digits
# specified as an argument. 
# (The first Fibonacci number has index 1.)

# 1 1 2 3 5 8 13 21 34 55 89 144

# Input: The number of digits the number should have.

# Output: The index of the first fibonacci number with 
# the specified number of digits. For example, fib(2) = 7.

# Data structures: An array to hold the fibonacci sequence
# up to what is needed, because we need to give the index

# Algorithm:
# 1. Create the fib = [0, 1, 1] array, our initial array.
# 2. Add the next number in the series, by adding the two
#    previous numbers in the array.
# 3. Check if this number has the desired length. If so,
#    return the index. If not, go back to step 2.

def find_fibonacci_index_by_length(index)
  fib = [0, 1, 1]
  counter = 3
  while true
    next_num = fib[counter - 1] + fib[counter - 2]
    break if next_num.to_s.size >= index
    fib << next_num
    counter += 1
  end
  counter
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847